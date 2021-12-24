docker rm -f mysql-service:2.0
docker run -it -v "/var/run/docker.sock:/var/run/docker.sock:rw" mysql-service:2.0 /bin/sh