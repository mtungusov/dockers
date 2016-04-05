# Description
- Alpine 3.3
- Java 8 Oracle JRE
- Zookeeper

# Build
```
docker build -t zookeeper:3.4.6 .
```

# Docker Registry
```
docker tag private.repo/zookeeper:3.4.6 private.repo/zookeeper:latest
docker push private.repo/zookeeper:latest
```

# Env
```
ZOO_ID=5
ZOO_SERVERS=1:srv1,2:srv2,3:srv3
SERVER_JVMFLAGS=-Xms1g -Xmx2g
```

# Run
## Dev
```
docker run --rm -i -t --name zookeeper \
-p 2181:2181 -p 2888:2888 -p 3888:3888 \
-e "SERVER_JVMFLAGS=-Xms1g -Xmx2g" \
private.repo/zookeeper:3.4.6
```

## Prod
```
docker run -d --name zookeeper \
-p 2181:2181 -p 2888:2888 -p 3888:3888 \
-e "ZOO_ID=$ZOO_ID" \
-e "ZOO_SERVERS=$ZOO_SERVERS" \
-e "SERVER_JVMFLAGS=-Xms1g -Xmx2g" \
--restart=always private.repo/zookeeper:3.4.6
```
