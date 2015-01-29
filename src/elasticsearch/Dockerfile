FROM lotreal/java

MAINTAINER Luo Tao <lotreal@gmail.com>

ENV ES_PKG_NAME elasticsearch-1.4.2

# Install ElasticSearch.
RUN \
  cd / && \
  curl -o /$ES_PKG_NAME.tar.gz https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

ADD etc/supervisor/conf.d/elasticsearch.conf /etc/supervisor.d/elasticsearch.conf
ADD etc/consul.d/http.json /etc/consul.d/http.json
ADD etc/consul.d/transport.json /etc/consul.d/transport.json
ADD etc/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
