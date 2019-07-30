#!/bin/bash
set -ex
cd $(dirname $0)
. pins
./gpio.sh on $PIN_FILTER_DRAIN
sleep 30

