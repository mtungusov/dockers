# Description

- Ubuntu 14.04
- Java 8
- [Confluent.io](http://www.confluent.io) Kafka, SchemaRegistry, Kafka REST.

# Build

```
docker build -t macadmin/confluent:dev .
```

# Env

- {{KAFKA_BROKER_ID}}
- {{ZOOKEEPER_CONNECTION_STRING}}


# Run

```
mkdir -p /var/opt/kafka && sudo chown -R 702:702 /var/opt/kafka
```

```
export ZK_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' zookeeper)
export KAFKA_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' confluent)
```

```
docker run --rm --name confluent -p 9092:9092 -p 8081:8081 -ti \
  --env KAFKA_BROKER_ID=0 \
  --env ZOOKEEPER_CONNECTION_STRING=$ZK_IP:2181 \
  -v /var/opt/kafka:/var/opt/kafka \
  macadmin/confluent:dev /sbin/my_init -- bash -l
```

## Create topic

```
docker exec -ti confluent \
  kafka-topics --list --zookeeper $ZK_IP:2181

docker exec -ti confluent \
  kafka-topics --create --topic test --replication-factor 1 --partitions 1 --zookeeper $ZK_IP:2181
```

## In separate terminals:

```
docker exec -ti confluent \
  kafka-console-producer --topic test --broker-list $KAFKA_IP:9092
<type some messages followed by newline>
```

```
docker exec -ti confluent \
  kafka-console-consumer --topic test --from-beginning --zookeeper $ZK_IP:2181
```
