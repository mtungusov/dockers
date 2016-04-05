FROM macadmin/alpine:3.3
LABEL Type="service" Name="consul" Version="0.6.3" Description="Consul Service"


ENV CONSUL_VERSION 0.6.3
ENV CONSUL_SHA256 b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250
ENV CONSUL_UI_SHA256 93bbb300cacfe8de90fb3bd5ede7d37ae6ce014898edc520b9c96a676b2bbb72

ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip /tmp/consul.ui.zip
ADD consul.sha256 /tmp/consul.sha256
ADD entrypoint.sh /entrypoint.sh

RUN cd /tmp \
    && sha256sum -c consul.sha256 \
    && cd /bin \
    && unzip /tmp/consul.zip \
    && chmod +x /bin/consul \
    && mkdir -p /etc/consul /var/consul /opt/consul-ui \
    && cd /opt/consul-ui \
    && unzip /tmp/consul.ui.zip \
    && rm -f /tmp/consul.* \
    && chmod +x /entrypoint.sh

VOLUME ["/etc/consul", "/var/consul"]
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

ENTRYPOINT ["/entrypoint.sh"]
