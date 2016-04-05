#!/bin/bash -x

[ -z "$ZOOKEEPER_CONNECTION_STRING" ] && ZOOKEEPER_CONNECTION_STRING="localhost:2181"

cat /opt/confluent/etc/kafka/server.properties.j2 | sed \
  -e "s|{{ZOOKEEPER_CONNECTION_STRING}}|${ZOOKEEPER_CONNECTION_STRING}|g" \
  -e "s|{{KAFKA_BROKER_ID}}|${KAFKA_BROKER_ID:-0}|g" \
   > /opt/confluent/etc/kafka/server.properties

echo "Starting Kafka"
exec /opt/confluent/bin/kafka-server-start /opt/confluent/etc/kafka/server.properties
