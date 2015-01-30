#
# Base docker image for Centos 7 that sets up
#
FROM centos:centos7

MAINTAINER Luo Tao <lotreal@gmail.com>

# Install dependencies
RUN yum install -y -q epel-release && \
    yum update -y -q

RUN yum install -y -q bind-utils net-tools nmap supervisor wget tar unzip


# Install consul
ADD https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD usr/bin/scan /usr/bin/scan

# Configuration files
ADD etc/consul.d/consul.json /etc/consul.d/consul.json
ADD etc/supervisord.conf /etc/supervisord.conf
ADD etc/supervisor.d/consul.conf /etc/supervisor.d/consul.conf
# ADD etc/supervisor.d/rsyslog.conf /etc/supervisor.d/rsyslog.conf

# For consul
ENV GOMAXPROCS 10

# Run Supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600/udp
