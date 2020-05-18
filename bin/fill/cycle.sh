#!/bin/bash
SWD=$(dirname $0)

for (( i=0; i < 4; i++ )); do
	$SWD/valve_on.sh
	sleep 3600
	$SWD/valve_off.sh
	sleep 3600
done

