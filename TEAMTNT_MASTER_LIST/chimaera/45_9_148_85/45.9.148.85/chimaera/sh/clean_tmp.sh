
chattr -ia / /tmp/ /var/ /var/tmp/ 2>/dev/null 
chattr -R -ia /tmp/ /var/tmp/ 2>/dev/null 

rm -fr /tmp/  2>/dev/null 
rm -fr /var/tmp/ 2>/dev/null 

rm -fr /tmp/*  2>/dev/null 
rm -fr /var/tmp/* 2>/dev/null 

rm -fr /tmp/.*  2>/dev/null 
rm -fr /var/tmp/.* 2>/dev/null 

mkdir -p /tmp/ 2>/dev/null 
mkdir -p /var/tmp/ 2>/dev/null 

