#!/bin/bash

SWD=$(dirname $0)
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh on $PIN_PUMP_PWR
sleep 2

