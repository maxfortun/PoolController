#!/bin/bash
SWD=$(dirname $0)

while true; do
	$SWD/on.sh
	sleep 3600
	$SWD/off.sh
done

