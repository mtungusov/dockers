FROM java-app:latest
LABEL Type="app" Name="barcode-1s" Version="0.2.4"

COPY app /app
COPY app_runit.sh /etc/service/app/run
COPY app.ctmpl /etc/consul-template/app.ctmpl
RUN chmod a+x /etc/service/app/run

RUN chmod -R 777 /etc/service && touch /etc/envvars && chmod 777 /etc/envvars

CMD ["/start-runit.sh"]
