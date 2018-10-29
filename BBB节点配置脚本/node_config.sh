#! /bin/bash


if [ ! "$1" ]; then
        echo "error!"
        echo "usage: config.sh ip"
else
        name=`ifconfig -a | grep "Link" | awk '{print $1}' | grep wl`

        ifconfig $name down
        iwconfig $name mode ad-hoc
        iwconfig $name essid adhoc
        ifconfig $name $1
        ifconfig $name up

        aodvd -D -d
fi
