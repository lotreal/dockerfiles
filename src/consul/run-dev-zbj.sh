docker run --rm -it -h master \
 -p 8300:8300 \
 -p 8301:8301 \
 -p 8301:8301/udp \
 -p 8302:8302 \
 -p 8302:8302/udp \
 -p 8400:8400 \
 -p 8500:8500 \
 -p 192.168.1.42:53:53/udp \
 -v $(pwd)/etc/consul.d:/etc/consul.d \
 progrium/consul -server -bootstrap -config-dir /etc/consul.d
