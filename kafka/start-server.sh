#!/bin/bash

export HOME=/opt/kafka

BIN="$HOME/bin/kafka-server-start.sh"
CFG="$HOME/config/server.properties"
LOG="$HOME/config/log4j.properties"
CT="/usr/local/bin/consul-template"
CTCFG="/etc/consul-template"

$CT -template "$CTCFG/log4j.ctmpl:$LOG" -once
$CT -consul=${PUBLIC_IP}:8500 -template "$CTCFG/server.properties.ctmpl:$CFG" -once

export KAFKA_HEAP_OPTS="-Xms4g -Xmx4g -XX:MetaspaceSize=96m -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:G1HeapRegionSize=16M -XX:MinMetaspaceFreeRatio=50 -XX:MaxMetaspaceFreeRatio=80"

exec 2>&1
exec $BIN $CFG
