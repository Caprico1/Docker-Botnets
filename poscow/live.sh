#/bin/bash

echo "100" > ../interval
#rm -rf  /usr/local/test/.iplist_*

# if [ -n "$localip" ];then
#     ip=$localip
# else
#     ip=`curl ip.cip.cc`
# fi
# proc=`cat /proc/cpuinfo | grep processor | wc -l`
# echo ${proc}_${ip} >> /usr/local/test/.iplist_${ip}

# servers="106.53.85.204:10023 116.62.48.5:10023 114.67.68.52:10023"
# bakservers="118.24.222.18:10023 106.13.127.6:10023 129.211.98.236:10023"
# bakservers2="101.37.245.200:10023 182.16.102.97:10023 106.75.96.126:10023 47.107.191.137:10023" 
# randon=`echo $(($RANDOM%4))`
# while [ $randon -eq 0 ]
# do
#     randon=`echo $(($RANDOM%4))`
# done
# ipport=`echo $servers |cut -d " " -f $randon`
# echo $ipport

# server="http://$ipport"

# ip=`curl ip.cip.cc`
# proc=`cat /proc/cpuinfo | grep processor | wc -l`
# postdata="host=${ip}&processor=${proc}"
# timeout 5 curl -X POST -d $postdata  $server >/dev/null 2>/dev/null
# if [ $? -ne 0 ];then
#     ipport=`echo $bakservers |cut -d " " -f $randon`
#     echo $ipport
#     server="http://$ipport"
#     timeout 5 curl -X POST -d $postdata  $server >/dev/null 2>/dev/null
#     if [ $? -ne 0 ];then
#         ipport=`echo $bakservers2 |cut -d " " -f $randon`
#         echo $ipport
#         server="http://$ipport"
#         timeout 5 curl -X POST -d $postdata  $server >/dev/null 2>/dev/null
#         if [ $? -ne 0 ];then
#             server="http://120.27.32.15:8081"
#             timeout 5 curl -X POST -d $postdata  $server >/dev/null 2>/dev/null
#         fi
#     fi
# fi

rm -rf ./live.sh
#rm -rf ./$serverfile
