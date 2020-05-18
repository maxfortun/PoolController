#!/bin/bash -e
SWD=$(dirname $0)
. $SWD/setenv.sh

cat $SWD/description/* 2>/dev/null
 
