FROM gliderlabs/alpine:3.4
RUN set -x \
    && apk upgrade --update \
    && apk add --no-cache --virtual=build-dependencies wget ca-certificates \
    && export ALPINE_GLIBC_V="2.23-r3" \
    && export ALPINE_GLIBC_BASE_URL="https://github.com/andyshinn/alpine-pkg-glibc/releases/download/$ALPINE_GLIBC_V" \
    && export ALPINE_GLIBC_PACKAGE="glibc-$ALPINE_GLIBC_V.apk" \
    && export ALPINE_GLIBC_BIN_PACKAGE="glibc-bin-$ALPINE_GLIBC_V.apk" \
    && export ALPINE_GLIBC_I18N_PACKAGE="glibc-i18n-$ALPINE_GLIBC_V.apk" \
    && wget "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_I18N_PACKAGE" \
    && apk add --no-cache --allow-untrusted "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_I18N_PACKAGE" \
    && /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib \
    && apk add --no-cache bash \
    && apk del build-dependencies \
    && rm "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_I18N_PACKAGE" \
    && rm -f /root/.wget-hsts \
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && /usr/glibc-compat/bin/localedef -i ru_RU -f UTF-8 ru_RU.UTF-8 \
    # && (/usr/glibc-compat/bin/localedef --force -i POSIX -f UTF-8 C.UTF-8 || true) \
    && echo "export LANG=en_US.UTF-8" > /etc/profile.d/locale.sh \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

ENV GOSU_VERSION 1.9
RUN set -x \
    && apk add --no-cache --virtual .gosu-deps \
        dpkg \
        gnupg \
        openssl \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver eu.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apk del .gosu-deps
