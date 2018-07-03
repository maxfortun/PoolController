#!/bin/bash

SWD=$(dirname ${BASH_SOURCE[0]})
. $SWD/setenv.sh

pinGroupPinOff PUMP POWER
pinGroupPinOn FILTER_IN REVERSE
pinGroupPinOn FILTER_OUT REVERSE
pinGroupPinOn PUMP POWER


