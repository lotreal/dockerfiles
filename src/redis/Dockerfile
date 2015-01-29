FROM lotreal/centos

MAINTAINER Luo Tao <lotreal@gmail.com>

RUN \
  /usr/sbin/groupadd -r -g 201 redis && \
  /usr/sbin/useradd -M -r -u 201 -g redis redis -d /var/lib/redis && \
  yum install -y -q redis && \
  touch /var/log/redis/.no-delete && \
  chown -R redis:root /var/log/redis && \
  chmod -R g+rw /var/log/redis

ADD etc/redis/redis.conf /etc/redis/redis.conf
ADD etc/supervisor.d/redis.conf /etc/supervisor.d/redis.conf
ADD etc/consul.d/redis.json /etc/consul.d/redis.json

EXPOSE 6379

VOLUME	["/var/log/redis"]
