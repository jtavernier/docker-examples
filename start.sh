docker stop registrator consul
docker rm registrator consul

docker run -d --name=consul -e CONSUL_BIND_INTERFACE=eth0 -p:8500:8500 consul 

docker run -d \
    --name=registrator \
    --net=host \
    --volume=/var/run/docker.sock:/tmp/docker.sock \
    gliderlabs/registrator:latest \
      -internal \
      consul://localhost:8500