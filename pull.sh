#!/bin/bash
PUSH=true
IMAGES="centos java elasticsearch redis logstash logs-indexer logs-collectd kibana"

function buildAll {
  for image in $IMAGES
  do
    NAME=$image make pull
  done
}

if [ "$#" -eq 1 ]; then
  echo build $1
else
  buildAll
fi
