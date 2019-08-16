#!/bin/bash
SWD=$(dirname $(readlink -f $0))
cd $SWD

. pins

#./gpio.sh exp $PIN_FILTER_DRAIN_SENSOR
#./gpio.sh dir $PIN_FILTER_DRAIN_SENSOR in

drain/init.sh
pump/init.sh
solar_heater/init.sh


