FROM java8:latest
LABEL Type="service" Name="kafka" Version="0.9.0.1" Description="Kafka Service"

ADD log4j.ctmpl /etc/consul-template/log4j.ctmpl
ADD server.properties.ctmpl /etc/consul-template/server.properties.ctmpl
ADD start-server.sh /start-server.sh

ENV KAFKA_VERSION="0.9.0.1" SCALA_VERSION="2.11"

RUN mkdir -p /opt \
    && wget -q -O - http://apache-mirror.rbc.ru/pub/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | tar -xzf - -C /opt \
    && mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
    && rm -f /opt/kafka/config/* \
    && mkdir -p /opt/kafka/logs \
    && mkdir -p /var/kafka \
    && chmod a+x /start-server.sh

ENV HOME=/opt/kafka \
    PATH=${PATH}:${HOME}/bin \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_CTYPE=ru_RU.UTF-8 \
    LC_TYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LC_COLLATE=en_US.UTF-8 \
    JAVA_HOME=/opt/jdk

VOLUME ["/opt/kafka/config", "/var/kafka", "/opt/kafka/logs"]
EXPOSE 9092
WORKDIR /opt/kafka

CMD ["/start-server.sh"]
