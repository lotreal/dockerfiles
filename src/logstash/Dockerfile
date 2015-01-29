FROM lotreal/java

MAINTAINER Luo Tao <lotreal@gmail.com>

ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz /opt/logstash.tgz
# Download version 1.4.2 of logstash
RUN cd /opt && tar -xf logstash.tgz && rm logstash.tgz

# Install contrib plugins
RUN /opt/logstash/bin/plugin install contrib

ADD etc/supervisor.d/logstash.conf /etc/supervisor.d/logstash.conf

