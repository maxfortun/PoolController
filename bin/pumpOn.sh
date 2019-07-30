#!/bin/bash
set -e
cd $(dirname $0)
. pins
./gpio.sh on $PIN_PUMP_PWR
sleep 2

