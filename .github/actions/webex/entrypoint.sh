#!/bin/sh

_wxt_message() {

  URL="https://api.ciscospark.com/v1/messages/"
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL} )

  echo "Status: $status_code"

  if [[ "$status_code" -ne 200 ]] ; then
    exit 1
  else
    exit 0
  fi
}

_wxt_message