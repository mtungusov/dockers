#!/bin/sh

export HOME="/opt/zookeeper"

BIN="$HOME/bin/zkServer.sh"
CFG="$HOME/conf/zoo.cfg"
LOG="$HOME/conf/log4j.properties"
CT="/usr/local/bin/consul-template"
CTCFG="/etc/consul-template"

$CT -template "$CTCFG/zoo.ctmpl:$CFG" -once
$CT -template "$CTCFG/log4j.ctmpl:$LOG" -once

if [ -n "$ZOO_ID" ]; then
  echo ${ZOO_ID} > /var/zookeeper/myid
fi

exec 2>&1
exec $BIN start-foreground
