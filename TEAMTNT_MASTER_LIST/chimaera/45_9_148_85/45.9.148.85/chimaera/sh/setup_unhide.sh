

sleep 1

if [ -x "$(command -v apt-get)" ]; then
export DEBIAN_FRONTEND=noninteractive
apt-get install -y unhide
fi

sleep 1

if [ -x "$(command -v yum)" ]; then
if type amazon-linux-extras 2>/dev/null 1>/dev/null; then amazon-linux-extras install epel -y ; fi
yum install -y epel-release
yum install -y unhide
fi

sleep 1


