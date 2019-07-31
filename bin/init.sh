#!/bin/bash
SWD=$(dirname $0)
cd $SWD

. pins

#./gpio.sh exp $PIN_FILTER_DRAIN_SENSOR
#./gpio.sh dir $PIN_FILTER_DRAIN_SENSOR in

drain/init.sh
pump/init.sh


