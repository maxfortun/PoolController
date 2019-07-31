#!/bin/bash

SWD=$(dirname $0)
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh dir $PIN_FILTER_DRAIN out
$BWD/gpio.sh on $PIN_FILTER_DRAIN
sleep 30

