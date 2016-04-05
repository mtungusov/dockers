# Description
- Alpine 3.3
- Java 8
- Kafka

# Build
```
docker build -t kafka:0.9.0.1 .
```

# Template
```
export ZOO_SERVERS=1:srv1:2888:3888,2:srv2:2888:3888,3:srv3:2888:3888
consul-template -consul=localhost:8500 -template "server.properties.ctmpl:server.properties" -dry -once
```

# Env
```
ADVERTISED_HOST: the external ip for the container
ADVERTISED_PORT: the external port for Kafka
BROKER_ID: integer
AUTO_CREATE_TOPICS: false
REPLICATION_FACTOR: 1
ZOO_CONNECT: srv1:2181,srv2:2181,srv3:2181
```

# Run
export PUBLIC_IP=$(ifconfig eth1 | awk -F ' *|:' '/inet addr/{print $4}')

## Test Run on Vagrant
docker run --rm -i -t -u "$(id -u):$(id -g)" \
-v /home/vagrant/kafka/data:/var/opt/kafka \
-v /home/vagrant/kafka/config:/opt/kafka/config \
-p 9092:9092 \
-e "BROKER_ID=0" -e "ZOO_CONNECT=$PUBLIC_IP:2181" -e "ADVERTISED_HOST=$PUBLIC_IP" \
private.repo/kafka:0.9.0.0

## Dev
```
docker run --rm -i -t \
-p 9092:9092 \
-e "BROKER_ID=0" \
-e "ADVERTISED_HOST=$PUBLIC_IP" \
-e "AUTO_CREATE_TOPICS=true" \
-e "ZOO_CONNECT=$PUBLIC_IP:2181" \
private.repo/kafka:0.9.0.0 /sbin/my_init -- bash -l
```

```
docker run -d --name kafka \
-p 9092:9092 \
-e "BROKER_ID=0" \
-e "ADVERTISED_HOST=$PUBLIC_IP" \
-e "AUTO_CREATE_TOPICS=true" \
-e "ZOO_CONNECT=$PUBLIC_IP:2181" \
--restart=always private.repo/kafka:0.9.0.0
```

## Prod
export ZK="srv1:2181,srv2:2181,srv3:2181"
export KF="srv1::9092,srv2::9092,srv3::9092"

```
docker run -d --name kafka \
-p 9092:9092 \
-e "BROKER_ID=0" \
-e "ADVERTISED_HOST=$PUBLIC_IP" \
-e "REPLICATION_FACTOR=3" \
-e "ZOO_CONNECT=$ZK" \
--restart=always macadmin/kafka:0.9.0.0
```

```
kafka-console-producer.sh --broker-list $KF --topic test

kafka-console-consumer.sh --zookeeper $ZK --topic test
```
