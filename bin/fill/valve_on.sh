#!/bin/bash -e
SWD=$(dirname $0)
. $SWD/setenv.sh

curl -X POST \
  -H "Authorization: Bearer $accessToken" \
  -H "Content-Type: application/json" \
  -d '{"entity_id": "switch.backyard_hose"}' \
  "$address/api/services/switch/turn_on"

echo "$(date) Turned on" > $SWD/description/on

