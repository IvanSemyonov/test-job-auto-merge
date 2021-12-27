#!/bin/sh

_wxt_message() {

  URL="https://api.ciscospark.com/v1/messages/"
  http_response=$(curl -i -o - --silent \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL} )

    http_status=$(echo "http_response" | grep HTTP |  awk '{print $2}')

  if [[ "$http_status" -ne 200 ]] ; then
    response_body=$(echo "$request_cmd" | grep body)
    echo "Error: $(response_body)"
    exit 1
  else
    exit 0
  fi
}

_wxt_message