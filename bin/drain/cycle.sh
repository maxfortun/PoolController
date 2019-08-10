#!/bin/bash
set -x



SWD=$(dirname $(readlink -f $0))
BWD=$(dirname $SWD)

. $BWD/pins

$BWD/pump/off.sh
$BWD/drain/open.sh
$BWD/pump/on.sh
sleep 5
$BWD/pump/off.sh
$BWD/drain/close.sh
$BWD/pump/on.sh
