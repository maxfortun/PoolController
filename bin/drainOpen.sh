#!/bin/bash
set -ex
cd $(dirname $0)
. pins
./gpio.sh off $PIN_FILTER_DRAIN
sleep 30

