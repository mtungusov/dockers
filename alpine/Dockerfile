FROM gliderlabs/alpine:3.3
RUN set -x \
    && apk add --no-cache --virtual=build-dependencies wget ca-certificates \
    && export ALPINE_GLIBC_V="2.23-r1" \
    && export ALPINE_GLIBC_BASE_URL="https://github.com/andyshinn/alpine-pkg-glibc/releases/download/$ALPINE_GLIBC_V" \
    && export ALPINE_GLIBC_PACKAGE="glibc-$ALPINE_GLIBC_V.apk" \
    && export ALPINE_GLIBC_BIN_PACKAGE="glibc-bin-$ALPINE_GLIBC_V.apk" \
    && export ALPINE_GLIBC_I18N_PACKAGE="glibc-i18n-$ALPINE_GLIBC_V.apk" \
    && wget "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_I18N_PACKAGE" \
    && apk add --no-cache --allow-untrusted "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_I18N_PACKAGE" \
    && apk add --no-cache bash \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && apk del build-dependencies \
    && rm "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_I18N_PACKAGE" \
    && rm -f /root/.wget-hsts \
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && /usr/glibc-compat/bin/localedef -i ru_RU -f UTF-8 ru_RU.UTF-8

ENV GOSU_VERSION 1.7
RUN set -x \
    && apk add --no-cache --virtual .gosu-deps \
        dpkg \
        gnupg \
        openssl \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apk del .gosu-deps
