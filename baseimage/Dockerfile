FROM ubuntu:14.04
MAINTAINER Mikhail Tungusov <tm@macadmin.ru>

# Timezone And Locale
RUN locale-gen en_US.UTF-8 && \
    locale-gen ru_RU.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

# Update And Clean up APT when done.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get clean && rm -rf /tmp/* /var/tmp/*

# Environment
RUN echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' > /etc/environment && \
    echo 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\nLC_ALL="en_US.UTF-8"\nLC_CTYPE="ru_RU.UTF-8"\nLC_COLLATE="en_US.UTF-8"' > /etc/default/locale
