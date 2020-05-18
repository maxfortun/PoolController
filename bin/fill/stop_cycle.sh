#!/bin/bash
SWD=$(dirname $0)
pid=$(ps auxwww|grep "cycle.sh id=fill_cycle"|grep -v grep|awk '{ print $2 }')
[ -n "$pid" ] && kill -9 "$pid"
$SWD/off.sh
