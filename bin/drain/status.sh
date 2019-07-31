#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

status=$($BWD/gpio.sh read $PIN_FILTER_DRAIN)

if [ "$status" = "0" ]; then
	echo closed
elif [ "$status" = "1" ]; then
	echo open
else
	echo unknown
fi

