#!/bin/bash
set -ex
cd $(dirname $0)
. pins
./pumpOff.sh
./drainOpen.sh
./pumpOn.sh
sleep 5
./pumpOff.sh
./drainClose.sh
./pumpOn.sh
