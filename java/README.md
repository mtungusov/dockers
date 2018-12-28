# Description

- Alpine 3.4
- with Java 8 (Oracle)
- Based on [anapsix/docker-alpine-java](https://github.com/anapsix/docker-alpine-java)

# Build

```
docker build -t java:8.102.14 .
```

# OpenJDK 11
## JRE 11
docker pull openjdk:11-jre
docker pull openjdk:11-jre-slim

docker run --rm -it openjdk:11-jre-slim java -version
