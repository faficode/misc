#!/bin/bash

SCRIPT_PATH=$(dirname $(realpath $0))
echo $SCRIPT_PATH

sudo docker run -it --name logstash --rm \
  -v $SCRIPT_PATH/logstash.yml:/usr/share/logstash/config/logstash.yml \
  -v $SCRIPT_PATH/http2duration.conf:/usr/share/logstash/config/pipelines/logstash.conf \
  -p $1:8080 \
  logstash:7.6.2
