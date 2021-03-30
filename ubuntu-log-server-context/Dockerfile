FROM ubuntu:latest
EXPOSE 9000
RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-relp \
    less \
    nmap \
    ncat \
    iputils-ping
RUN mv /etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf.bak
RUN mkdir /data
RUN mkdir /data/logs
RUN mkdir /data/logs/rsys
RUN mkdir /data/logs/exp
COPY ./rsyslog-aggregator.conf /etc/rsyslog.d/
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf
RUN touch /data/logs/rsys/my-app.log
RUN chown syslog:syslog /data/logs/rsys/my-app.log