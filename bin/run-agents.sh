#!/bin/bash
/opt/flume/bin/flume-ng agent --conf conf \
        --conf-file /opt/flume/agent/flume-global-agent.properties \
        -Dflume.root.logger=INFO,LOGFILE \
        -Dflume.log.dir=/var/flume/logs \
        -Dflume.log.file=flume-global.log  \
        --name globalAgent &

/opt/flume/bin/flume-ng agent --conf conf \
        --conf-file /opt/flume/agent/flume-ripple-flow-agent.properties \
        -Dflume.root.logger=INFO,LOGFILE \
        -Dflume.log.dir=/var/flume/logs \
        -Dflume.log.file=flume-ripple-flow.log  \
        --name rippleFlowAgent &