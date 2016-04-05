#!/bin/bash

export HOME=/opt/redis

BIN=$HOME/bin/redis-server
CFG=/opt/redis/config/redis.conf
CT="/usr/local/bin/consul-template"
CTCFG="/etc/consul-template"

$CT -template "$CTCFG/redis.ctmpl:$CFG" -once

exec 2>&1
exec $BIN $CFG
