#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh dir $PIN_SOLAR_HEATER out
$BWD/gpio.sh on $PIN_SOLAR_HEATER
sleep 30

