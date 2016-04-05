FROM java-app:latest

COPY app /app
COPY app.ctmpl /etc/consul-template/app.ctmpl

COPY app_runit.sh /etc/service/app/run
RUN chmod a+x /etc/service/app/run

RUN chmod -R 777 /etc/service && touch /etc/envvars && chmod 777 /etc/envvars

CMD ["/start-runit.sh"]
