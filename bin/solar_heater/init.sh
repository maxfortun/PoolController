#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh exp $PIN_SOLAR_HEATER
$BWD/gpio.sh act $PIN_SOLAR_HEATER low
#$BWD/gpio.sh dir $PIN_SOLAR_HEATER out

