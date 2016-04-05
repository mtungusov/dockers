#!/bin/bash

CFG="/etc/consul/config.json"

cat > $CFG <<'EOF'
{
  "disable_update_check": true,
  "data_dir": "/var/consul",
  "server": false,
  "client_addr": "127.0.0.1",
  "advertise_addr": "external_ip",
  "leave_on_terminate": true,
  "ui": false,
  "ui_dir": "/opt/consul-ui",
  "dns_config": {
    "allow_stale": true,
    "max_stale": "1s"
  },
  "datacenter": "my_dc",
  "encrypt": "my_token"
}

EOF

if [ -z "$DATACENTER" ]; then
  echo "ERROR: You must set env DATACENTER"
  exit 1
else
  sed -r -i "s/(\"datacenter\")\:(.*)/\1\: \"$DATACENTER\",/g" $CFG
fi

if [ -z "$TOKEN" ]; then
  echo "ERROR: You must set env TOKEN"
  exit 1
else
  sed -r -i "s/(\"encrypt\")\:(.*)/\1\: \"$TOKEN\"/g" $CFG
fi

if [ -z "$EXTERNAL_IP" ]; then
  echo "ERROR: You must set env EXTERNAL_IP"
  exit 1
else
  sed -r -i "s/(\"advertise_addr\")\:(.*)/\1\: \"$EXTERNAL_IP\",/g" $CFG
fi

if [ "$RUN_MODE_SERVER" ]; then
  sed -r -i "s/(\"server\")\:(.*),/\1\: true,/g" $CFG
  sed -r -i "s/(\"allow_stale\")\:(.*),/\1\: false,/g" $CFG
  sed -r -i "s/(\"leave_on_terminate\")\:(.*),/\1\: false,/g" $CFG
fi

if [ "$CLIENT_ADDR" ]; then
  sed -r -i "s/(\"client_addr\")\:(.*),/\1\: \"$CLIENT_ADDR\",/g" $CFG
fi

if [ "$UI_ENABLE" ]; then
  sed -r -i "s/(\"ui\")\:(.*),/\1\: true,/g" $CFG
fi

exec 2>&1
exec "$@"
