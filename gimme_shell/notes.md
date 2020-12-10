

# Notes

gimme shell found again at Tue, 07 Apr 2020 04:35:14 GMT


created date Monday, March 23, 2020 4:32:06 PM.


Status: Up for 46 seconds.

need to verify...looks like a kubernetes dashboard takeover.



```
34.243.39.159

Image: sha256:f39826ae385e029ae634eb6a81091da60dae2e6ee2a19342c2e05ed4c3cb9171
	ID: 1732cba102c12e23c0747dc66fc3544f9a13e50d834ecc1f44cdaeb311688db0
	Command: docker-entrypoint.sh sh -c 'if [ -x /usr/local/bin/bash ]; then
	exec /usr/local/bin/bash 
elif [ -x /usr/bin/bash ]; then
	exec /usr/bin/bash 
elif [ -x /bin/bash ]; then
	exec /bin/bash 
elif [ -x /usr/local/bin/sh ]; then
	exec /usr/local/bin/sh 
elif [ -x /usr/bin/sh ]; then
	exec /usr/bin/sh 
elif [ -x /bin/sh ]; then
	exec /bin/sh 
elif [ -x /busybox/sh ]; then
	exec /busybox/sh 
else
	echo shell not found
	exit 1
fi
```
