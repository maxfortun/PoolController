#!/bin/bash
SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

status=$1
[ -z "$status" ] && status=$($SWD/status.sh)

grep "^$status" "$SWD/actions" | sed "s/^$status\s*//g"

