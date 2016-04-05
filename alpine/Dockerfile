FROM gliderlabs/alpine:3.3
RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
    export ALPINE_GLIBC_V="2.23-r1" && \
    export ALPINE_GLIBC_BASE_URL="https://github.com/andyshinn/alpine-pkg-glibc/releases/download/$ALPINE_GLIBC_V" && \
    export ALPINE_GLIBC_PACKAGE="glibc-$ALPINE_GLIBC_V.apk" && \
    export ALPINE_GLIBC_BIN_PACKAGE="glibc-bin-$ALPINE_GLIBC_V.apk" && \
    export ALPINE_GLIBC_I18N_PACKAGE="glibc-i18n-$ALPINE_GLIBC_V.apk" && \
    wget "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_I18N_PACKAGE" && \
    apk add --no-cache --allow-untrusted "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_I18N_PACKAGE" && \
    apk add --no-cache bash && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    apk del build-dependencies && \
    rm "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" "$ALPINE_GLIBC_I18N_PACKAGE" && \
    rm -f /root/.wget-hsts && \
    /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    /usr/glibc-compat/bin/localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
