#!/bin/bash -e
SWD=$(dirname $0)
. $SWD/setenv.sh

pid=$(ps auxwww|grep "cycle.sh id=fill_cycle"|grep -v grep||true)

[ -n "$pid" ] && status="on" || status="off"
echo $status

exit

curl -X GET \
  -H "Authorization: Bearer $accessToken" \
  -H "Content-Type: application/json" \
  "$address/api/states/switch.backyard_hose"

