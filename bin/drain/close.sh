#!/bin/bash

SWD=$(dirname $0)
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh off $PIN_FILTER_DRAIN
sleep 30

