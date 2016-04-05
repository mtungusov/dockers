FROM macadmin/consul-template:0.12.1
LABEL Type="service" Name="redis" Version="3.0.7" Description="Redis Server"

ENV REDIS_VERSION 3.0.7
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz
ENV REDIS_DOWNLOAD_SHA1 e56b4b7e033ae8dbf311f9191cf6fdf3ae974d1c

ADD redis.ctmpl /etc/consul-template/redis.ctmpl
ADD start-server.sh /start-server.sh

RUN set -x \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    linux-headers \
    make \
    musl-dev \
  && wget "$REDIS_DOWNLOAD_URL" -O redis.tar.gz \
  && echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c - \
  && mkdir -p /usr/src \
  && tar -xzf redis.tar.gz -C /usr/src \
  && mv "/usr/src/redis-$REDIS_VERSION" /usr/src/redis \
  && rm redis.tar.gz \
  && make -C /usr/src/redis \
  && make PREFIX=/opt/redis -C /usr/src/redis install \
  && rm -r /usr/src/redis \
  && apk del .build-deps \
  && mkdir -p /opt/redis/config \
  && chmod a+x /start-server.sh

ENV HOME /opt/redis
ENV PATH ${PATH}:${HOME}/bin

VOLUME ["/var/redis", "/opt/redis/config"]
EXPOSE 6379
WORKDIR /opt/redis

CMD ["/start-server.sh"]
