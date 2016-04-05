FROM macadmin/ubuntu-min-java:latest
MAINTAINER Mikhail Tungusov <tm@macadmin.ru>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# My build instructions
RUN groupadd -r -g 702 confluent \
    && useradd -c "For Confluent.io" -d /opt/confluent -g confluent -M -r -u 702 -s /bin/nologin confluent \
    && curl -fL http://packages.confluent.io/archive/1.0/confluent-1.0.1-2.10.4.tar.gz \
    | tar xzf - -C /opt \
    && mv /opt/confluent-1.0.1 /opt/confluent \
    && cd /opt/confluent \
    && rm -rf ./bin/windows \
              ./share/doc \
              ./README.archive \
              /etc/service/cron \
              /etc/service/syslog-forwarder \
              /etc/service/syslog-ng \
    && mkdir -p /var/opt/kafka/logs /var/opt/kafka/data

ENV KAFKA_HEAP_OPTS="-Xmx512M -Xms512M"
ENV KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/opt/confluent/etc/kafka/log4j.properties"
ENV PATH=/opt/confluent/bin:$PATH

COPY conf/kafka/log4j.properties /opt/confluent/etc/kafka/log4j.properties
COPY conf/kafka/server.properties.j2 /opt/confluent/etc/kafka/server.properties.j2
COPY script/kafkaStart.sh /opt/confluent/bin/kafkaStart.sh

COPY conf/schema-registry/log4j.properties /opt/confluent/etc/schema-registry/log4j.properties
COPY conf/schema-registry/schema-registry.properties.j2 /opt/confluent/etc/schema-registry/schema-registry.properties.j2
COPY script/schemaRegistryStart.sh /opt/confluent/bin/schemaRegistryStart.sh

RUN chown -R confluent:confluent /opt/confluent /var/opt/kafka

COPY runit/kafka/run /etc/service/kafka/run
COPY runit/kafka/finish /etc/service/kafka/finish
COPY runit/schema-registry/run /etc/service/schema-registry/run

EXPOSE 9092 8081

VOLUME ["/var/opt/kafka"]
