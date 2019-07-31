#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh off $PIN_FILTER_DRAIN
sleep 30

