FROM java8:latest
LABEL Type="service" Name="zookeeper" Version="3.4.6" Description="Zookeeper Service"

ADD log4j.ctmpl /etc/consul-template/log4j.ctmpl
ADD zoo.ctmpl /etc/consul-template/zoo.ctmpl
ADD start-server.sh /start-server.sh

RUN mkdir -p /opt \
    && wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.6 /opt/zookeeper \
    && rm -f /opt/zookeeper/conf/* \
    && mkdir -p /var/zookeeper \
    && chmod a+x /start-server.sh

ENV HOME=/opt/zookeeper \
    PATH=${PATH}:${HOME}/bin \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_CTYPE=ru_RU.UTF-8 \
    LC_TYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LC_COLLATE=en_US.UTF-8 \
    JAVA_HOME=/opt/jdk

VOLUME ["/opt/zookeeper/conf", "/var/zookeeper"]
EXPOSE 2181 2888 3888
WORKDIR /opt/zookeeper

CMD ["/start-server.sh"]
