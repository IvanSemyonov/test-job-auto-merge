#!/bin/sh

_wxt_message() {

  URL="https://api.ciscospark.com/v1/messages/"
  http_response = $(curl -s -o response.txt -w \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL} \
    --data-binary $1 )

  if [[ $response != 200 ]] ; then
    echo "Error: "
    cat response.txt
    exit 1
  else
    exit 0
  fi
}

_wxt_message