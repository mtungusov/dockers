FROM java8:latest
LABEL Description="Jruby 9.0.5.0"

ENV JRUBY_VERSION=9.0.5.0 \
    JRUBY_SHA256=9ef392bd859690c9a838f6475040345e0c512f7fcc0b37c809a91cf671f5daf3 \
    LANG=C.UTF-8

RUN apk add --update wget ca-certificates \
    && cd /tmp \
    && wget https://s3.amazonaws.com/jruby.org/downloads/${JRUBY_VERSION}/jruby-bin-${JRUBY_VERSION}.tar.gz -O /tmp/jruby-bin-${JRUBY_VERSION}.tar.gz \
    && echo "$JRUBY_SHA256  jruby-bin-${JRUBY_VERSION}.tar.gz" | sha256sum -c - \
    && mkdir -p /opt \
    && tar -zxf jruby-bin-${JRUBY_VERSION}.tar.gz -C /opt \
    && rm /tmp/*.tar.gz \
    && mv /opt/jruby-${JRUBY_VERSION} /opt/jruby \
    && apk del wget ca-certificates \
    && rm -rf /tmp/* /var/cache/apk/* \
    && mkdir -p /opt/gem

ENV JAVA_HOME=/opt/jdk \
    JRUBY_HOME=/opt/jruby \
    GEM_HOME=/opt/gem \
    GEM_PATH=/opt/gem \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_CTYPE=ru_RU.UTF-8 \
    LC_TYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LC_COLLATE=en_US.UTF-8
ENV PATH=${GEM_HOME}/bin:${JRUBY_HOME}/bin:${PATH}

ADD gemrc /etc/gemrc

RUN /opt/jruby/bin/jruby -S gem install bundler \
  && /opt/jruby/bin/jruby -S /opt/gem/bin/bundle config --global path "$GEM_HOME" \
  && /opt/jruby/bin/jruby -S /opt/gem/bin/bundle config --global bin "$GEM_HOME/bin"

ENV BUNDLE_APP_CONFIG $GEM_HOME

CMD [ "irb" ]
