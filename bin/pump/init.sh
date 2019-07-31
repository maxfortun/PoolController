#!/bin/bash

SWD=$(dirname $0)
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/gpio.sh exp $PIN_PUMP_PWR
$BWD/gpio.sh act $PIN_PUMP_PWR high
$BWD/gpio.sh dir $PIN_PUMP_PWR out

