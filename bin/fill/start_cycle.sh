#!/bin/bash
SWD=$(dirname $0)

$SWD/stop_cycle.sh
$SWD/cycle.sh id=fill_cycle &

