# hzulu/hauto
---
This is the 4th iteration of this botnet that has had the same mode of operations to the original findings of zulu, zulu2, and pavlov32.

Currently as of 06/08/2019 there were ~ 30 devices that I observed to have been exploited by this botnet.

the images displayed from shodan look like this:
```
Image: hzulu/hauto
Command: /bin/sh -c 'sh /entry'

Image: sha256:aa1be094716187e4f0ce792034afd39ebabfdaf1362b5ca315f38b5293820c47
Command: /bin/sh -c 'sh /entry'
```

the second Image I believe to be the same image as hzulu/hauto as the 'Command:' field matches the named docker-hub image.

# Things to Note
---
##  Image Contents
---
### New Control server
* no longer using tor. the ip below is now the command and control center
  * file location /ctrl.txt
  * IP: 216.182.107.18
  * IP is owned by syrnganet.com (Possible Insider Threat or Malicious Use of Company Resources)
### Full list of ips.
* This image contained multiple code output and log files describing and showing exploitation and attempts of exploitation across a list of IPs(This is also a log file in itself).
  * Logs can be found in /tmp/sh0dan directory
### Wallets found
* Enclosed in this folder are images of the running wallet on crypto-pool.fr.
  * There are ~31 different wallets that are in use with this botnet.
