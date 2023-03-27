FROM ubuntu:focal-20210416
RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-relp \
    less \
    nmap \
    ncat \
    iputils-ping
RUN mv /etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf.bak
RUN mkdir -p /var/logs/rsys
COPY ./rsyslog-aggregator.conf /etc/rsyslog.d/
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf
RUN touch /var/logs/rsys/my-app.log
RUN chown syslog:syslog /var/logs/rsys/my-app.log
RUN echo "service rsyslog restart" >> ~/.bashrc
RUN echo "cd /var/logs/rsys" >> ~/.bashrc