FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    rsyslog \
    rsyslog-relp \
    less \
    nmap \
    ncat \
    iputils-ping
RUN mkdir -p /opt/my-app
RUN mkdir /opt/my-app/logs
RUN touch /opt/my-app/logs/app-log.log
COPY ./fake-application.sh /opt/my-app
RUN mv /etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf.bak
COPY ./rsyslog-sender.conf /etc/rsyslog.d/
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf
RUN echo "service rsyslog restart" >> ~/.bashrc
RUN echo "cd /opt/my-app/" >> ~/.bashrc