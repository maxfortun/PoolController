#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

status=$($BWD/gpio.sh read $PIN_PUMP_PWR)

if [ "$auto" = "true" ]; then
	echo auto
elif [ "$status" = "0" ]; then
	echo on
elif [ "$status" = "1" ]; then
	echo off
else
	echo unknown
fi

