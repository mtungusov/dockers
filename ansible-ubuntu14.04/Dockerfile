FROM macadmin/baseimage:latest
MAINTAINER Mikhail Tungusov <tm@macadmin.ru>
LABEL Description="For create images with ansible"

# Install ansible
RUN apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ansible && \
    apt-get clean && rm -rf /tmp/* /var/tmp/* && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
