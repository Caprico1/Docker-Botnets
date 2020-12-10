#!/bin/sh
export PATH=$PATH:/usr/local/bin/
if [ ! -f "/usr/local/bin/scope" ]; then curl -Lk git.io/scope -o /usr/local/bin/scope ; chmod a+x /usr/local/bin/scope ; fi
if [ ! -f "/usr/bin/scope" ]; then cp /usr/local/bin/scope /usr/bin/scope ; chmod a+x /usr/bin/scope ; fi
scope launch --service-token=1dpk9dcumztyor3n7o8dedh45a6sks31

