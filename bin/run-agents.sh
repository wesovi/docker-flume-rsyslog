#!/bin/bash

sed -i  -e "s/{ES_PATH}/"${ELASTICSEARCH_9300_SERVICE_HOST}"/g" /opt/flume/agent/flume-ripple-flow-agent.properties
sed -i  -e "s/{ES_PATH}/"${ELASTICSEARCH_9300_SERVICE_HOST}"/g" /opt/flume/agent/flume-global-agent.properties

/opt/flume/bin/flume-ng agent --conf /opt/flume/conf \
        --conf-file /opt/flume/agent/flume-global-agent.properties \
        -Dflume.root.logger=DEBUG,LOGFILE \
        -Dflume.log.dir=/var/flume/logs \
        -Dflume.log.file=flume-global.log  \
        --name globalAgent & \
        -DES_PATH=${ELASTICSEARCH_9300_SERVICE_HOST}:9300 &

/opt/flume/bin/flume-ng agent --conf /opt/flume/conf \
        --conf-file /opt/flume/agent/flume-ripple-flow-agent.properties \
        -Dflume.root.logger=DEBUG,LOGFILE \
        -Dflume.log.dir=/var/flume/logs \
        -Dflume.log.file=flume-ripple-flow.log  \
        --name rippleFlowAgent \
        -DES_PATH=${ELASTICSEARCH_9300_SERVICE_HOST}:9300 &