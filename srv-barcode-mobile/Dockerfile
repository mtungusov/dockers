FROM java-app:latest
LABEL Type="app" Name="barcode-mobile" Version="0.3.10"

COPY app /app
COPY app_runit.sh /etc/service/app/run
COPY app.ctmpl /etc/consul-template/app.ctmpl
RUN chmod a+x /etc/service/app/run

RUN chmod -R 777 /etc/service && touch /etc/envvars && chmod 777 /etc/envvars

CMD ["/start-runit.sh"]
