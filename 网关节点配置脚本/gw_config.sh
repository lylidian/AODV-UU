#! /bin/bash
	
if [ $UID -ne 0 ]; then
	echo "must be root"
	exit 1
fi

name=`ifconfig -a | grep "Link" | awk '{print $1}' | grep wl`

if [ ! "$name" ]; then
	echo "not found wireless device"
	exit 1
fi

ifconfig $name down
iwconfig $name mode ad-hoc
iwconfig $name essid adhoc
ifconfig $name 192.168.1.1
ifconfig $name up

aodvd -D


