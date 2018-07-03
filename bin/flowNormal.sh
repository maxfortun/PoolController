#!/bin/bash

SWD=$(dirname ${BASH_SOURCE[0]})
. $SWD/setenv.sh

pinGroupPinOff PUMP POWER
pinGroupPinOn FILTER_IN NORMAL
pinGroupPinOn FILTER_OUT NORMAL
pinGroupPinOn PUMP POWER


