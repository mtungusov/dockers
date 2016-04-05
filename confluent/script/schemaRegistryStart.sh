#!/bin/bash -x

[ -z "$ZOOKEEPER_CONNECTION_STRING" ] && ZOOKEEPER_CONNECTION_STRING="localhost:2181"

cat /opt/confluent/etc/schema-registry/schema-registry.properties.j2 | sed \
  -e "s|{{ZOOKEEPER_CONNECTION_STRING}}|${ZOOKEEPER_CONNECTION_STRING}|g" \
   > /opt/confluent/etc/schema-registry/schema-registry.properties

echo "Starting Schema Registry"
exec /opt/confluent/bin/schema-registry-start /opt/confluent/etc/schema-registry/schema-registry.properties
