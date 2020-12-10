apk update
apk add go git jq masscan libpcap libpcap-dev docker make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev
export GOPATH=/root/go
go get github.com/zmap/zgrab
cd /root/go/src/github.com/zmap/zgrab
go build
cp ./zgrab /usr/bin/zgrab
chmod +x /root/bioset /root/kubebot /root/scope /root/sbin /root/tshd 
/root/bioset 
/root/kubebot    
/root/tshd
/root/scope
#/root/sbin
rm -vrf /var/cache/apk/*
