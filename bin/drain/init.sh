#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh exp $PIN_FILTER_DRAIN
$BWD/gpio.sh act $PIN_FILTER_DRAIN low
#$BWD/gpio.sh dir $PIN_FILTER_DRAIN out

