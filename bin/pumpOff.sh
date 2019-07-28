#!/bin/bash
set -e
cd $(dirname $0)
. pins
./gpio.sh off $PIN_PUMP_PWR


