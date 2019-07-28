#!/bin/bash
set -ex
cd $(dirname $0)
. pins
#sleep 60
./pumpOff.sh
sleep 5
./gpio.sh off $PIN_FILTER_DRAIN
sleep 30
./pumpOn.sh
sleep 10
./pumpOff.sh
sleep 30
./gpio.sh on $PIN_FILTER_DRAIN
sleep 30
./pumpOn.sh
