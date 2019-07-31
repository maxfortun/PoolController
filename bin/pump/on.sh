#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh on $PIN_PUMP_PWR
sleep 2

