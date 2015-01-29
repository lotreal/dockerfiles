#!/bin/bash
PUSH=true
IMAGES="centos java elasticsearch redis logstash logs-indexer logs-collectd"

function buildAll {
  for image in $IMAGES
  do
    NAME=$image make build -n
    if [[ "$PUSH" = true  ]]; then
      NAME=$image make push -n
    fi
  done
}

if [ "$#" -eq 1 ]; then
  echo build $1
else
  buildAll
fi
