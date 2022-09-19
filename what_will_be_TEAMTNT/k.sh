#!/bin/bash
apt update;
apt install -y git gcc g++ make 
if [ ! -f kang.tar ];then
wget 93.95.229.203/kang.tar
tar -xf kang.tar
cd kang
make
chmod a+x *
fi
cd kang
chmod a+x *
./kangaroo -c 93.95.229.203 -o out -m 9999999999999999999 -ws -d 64 se.txt 
make
./kangaroo -c 93.95.229.203 -o out -m 9999999999999999999 -ws -d 64 se.txt  
