FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-relp \
    less \
    nmap \
    ncat \
    iputils-ping
RUN mkdir /usr/games/my-app
RUN mkdir /usr/games/my-app/logs
RUN touch /usr/games/my-app/logs/app-log.log
COPY ./fake-application.sh /usr/games/my-app
RUN mv /etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf.bak
COPY ./rsyslog-sender.conf /etc/rsyslog.d/
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf