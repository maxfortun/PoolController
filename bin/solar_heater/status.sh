#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

auto=$(cat $SWD/auto.status)
status=$($BWD/gpio.sh read $PIN_SOLAR_HEATER)

if [ "$auto" = "true" ]; then
	echo auto
elif [ "$status" = "0" ]; then
	echo off
elif [ "$status" = "1" ]; then
	echo on
else
	echo unknown 
fi

