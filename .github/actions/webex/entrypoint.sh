#!/bin/sh

_wxt_message() {

  URL="https://api.ciscospark.com/v1/messages/"
  response = $(curl -s -w "%{http_code}" \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL} \
    --data-binary $1 )

  body=${res::-3}
  status_code = $(printf "%s" "response" | tail -c 3)

  echo "POST $URL"
  echo "Status: $status_code"

  if [[ "$status_code" -ne 200 ]] ; then
    echo body
    exit 1
  else
    exit 0
  fi
}

_wxt_message