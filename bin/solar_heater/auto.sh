#!/bin/bash

SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

auto=$(cat $SWD/auto.status||true)
[ "$auto" = "true" ] && auto=false || auto=true
echo $auto > $SWD/auto.status 
