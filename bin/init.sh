#!/bin/bash
set -ex
SWD=$(dirname $0)
cd $SWD

. pins

./gpio.sh exp $PIN_FILTER_DRAIN_SENSOR
./gpio.sh dir $PIN_FILTER_DRAIN_SENSOR in

./gpio.sh exp $PIN_FILTER_DRAIN
./gpio.sh act $PIN_FILTER_DRAIN low
./gpio.sh dir $PIN_FILTER_DRAIN out

./gpio.sh exp $PIN_PUMP_PWR
./gpio.sh act $PIN_PUMP_PWR high
./gpio.sh dir $PIN_PUMP_PWR out


