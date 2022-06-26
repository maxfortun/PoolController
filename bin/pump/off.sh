#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

if [ "$1" = "auto" ]; then
	auto=$(cat $SWD/auto.status)
	if [ "$auto" != true ]; then
		exit
	fi
fi

. $BWD/pins

$BWD/gpio.sh off $PIN_PUMP_PWR
sleep 2


