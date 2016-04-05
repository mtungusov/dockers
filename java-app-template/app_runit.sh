#!/bin/bash

. /etc/envvars

set -e

export HOME=/app

BIN="java -jar ${HOME}/app.jar -S rackup -o 0.0.0.0 -p 3000"
CFG="${HOME}/config/config.yml"

CTBIN="/usr/local/bin/consul-template"
CTCFG="/etc/consul-template"
${CTBIN} -template "${CTCFG}/app.ctmpl:${CFG}" -once

cd ${HOME}
exec 2>&1
exec ${BIN}
