#!/bin/bash -e
SWD=$(dirname $0)
. $SWD/setenv.sh

curl -X GET \
  -H "Authorization: Bearer $accessToken" \
  -H "Content-Type: application/json" \
  "$address/api/states/switch.backyard_hose"

