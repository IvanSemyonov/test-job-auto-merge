#!/bin/sh

_wxt_message() {
  code=0
  URL="https://api.ciscospark.com/v1/messages/"
  http_status=$(curl -w \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL} \
    -o >(cat >/tmp/curl_body) \
    "$@" ) || code="$?"

  echo "RESPONSE"
  echo $http_status

  if [[ "$http_status" -ne 200 ]] ; then
    response_body="$(cat /tmp/curl_body)"
    echo $response_body
    echo "Error: $response_body"
    exit 1
  else
    exit 0
  fi
}

_wxt_message