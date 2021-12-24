#!/bin/sh

_wxt_checks() {
  if [ -z "${TOKEN}" ]; then
    _error "TOKEN is not set."
  fi

  if [ -z "${ROOMID}" ]; then
    _error "ROOMID is not set."
  fi

  if [ -z "${MESSAGE}" ]; then
    _error "MESSAGE is not set."
  fi
}

_wxt_message() {
  _wxt_checks

  URL="https://api.ciscospark.com/v1/messages/"
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL} )

  echo "Site status changed to $status_code"

  if [[ "$status_code" -ne 200 ]] ; then
    exit 1
  else
    exit 0
  fi
}

_wxt_message