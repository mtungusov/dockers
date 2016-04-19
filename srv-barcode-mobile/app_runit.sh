#!/bin/bash

. /etc/envvars

set -e

addgroup -g $GROUP_ID appuser
adduser -h /app -s /sbin/nologin -D -u $USER_ID -G appuser appuser

export HOME=/app

BIN="java -jar ${HOME}/app.jar -S rackup -o 0.0.0.0 -p 3000"
CFG="${HOME}/config/config.yml"

CT="/usr/local/bin/consul-template"
CTCFG="/etc/consul-template"
$CT -consul $EXTERNAL_IP:8500 -template "$CTCFG/app.ctmpl:$CFG" -once

chown -R appuser:appuser ${HOME}

cd ${HOME}
exec 2>&1
exec chpst -uappuser ${BIN}
