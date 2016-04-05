FROM consul-template:0.12.1

LABEL Description="Alpine 3.3, Runit 2.1.2"

ADD start-runit.sh /start-runit.sh

RUN RUNIT_VERSION="2.1.2" \
    RUNIT_DOWNLOAD_URL="http://smarden.org/runit/runit-${RUNIT_VERSION}.tar.gz" \
    RUNIT_DOWNLOAD_SHA1="398f7bf995acd58797c1d4a7bcd75cc1fc83aa66" \
    && set -x \
    && apk add --no-cache --virtual .build-deps \
      tar \
      gcc \
      linux-headers \
      make \
      musl-dev \
    && cd /tmp \
    && wget "$RUNIT_DOWNLOAD_URL" -O /tmp/runit.tar.gz \
    && echo "$RUNIT_DOWNLOAD_SHA1  runit.tar.gz" | sha1sum -c - \
    && mkdir -p /usr/src/runit \
    && tar -xzf /tmp/runit.tar.gz -C /usr/src/runit --strip-components=2 \
    && rm -f /tmp/runit.tar.gz \
    && cd /usr/src/runit/src \
    && make \
    && cd .. \
    && cat package/commands | xargs -I {} mv -f src/{} /sbin/ \
    && cd / \
    && rm -rf /usr/src/runit \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && mkdir /etc/service \
    && chmod a+x /start-runit.sh

CMD ["/start-runit.sh"]
