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

$BWD/pump/off.sh
$BWD/gpio.sh dir $PIN_SOLAR_HEATER out
$BWD/gpio.sh off $PIN_SOLAR_HEATER
sleep 45
$BWD/pump/on.sh

