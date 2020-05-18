#!/bin/bash
SWD=$(dirname $0)

while true; do
	$SWD/valve_on.sh
	sleep 3600
	$SWD/valve_off.sh
done

