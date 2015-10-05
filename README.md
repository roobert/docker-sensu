# docker-sensu

## About

An experiment in dockerizing Sensu..

## Pre-Requisites

* [docker-redis](http://github.com/roobert/docker-redis)
* [docker-rabbitmq](http://github.com/roobert/docker-rabbitmq)

## Post-Requisites

* [docker-uchiwa](http://github.com/roobert/docker-uchiwa)

## TODO

* config management for /srv/
* dependency management for sensu-server and sensu-cli
* handlers / extensions for sensu-server
* plugins / config for `sensu-client`
* RabbitMQ SSL
* `nginx`
* HA
  * keepalived
  * haproxy
  * redis-sentinel


## Build
```
docker build -t sensu .
```

## Run
```
docker run \
  --name sensu-server \
  -d \
  --link redis \
  --link rabbitmq \
  -e TRANSPORT_NAME=rabbitmq \
  -e RABBITMQ_URL=amqp://rabbitmq:5672 \
  -e REDIS_URL=redis://redis:6379 \
  -e SENSU_SERVICE=server \
  -v ./data:/sensu \
  sensu

docker run \
  --name sensu-api \
  -d \
  --link redis \
  --link rabbitmq \
  -p 4567:4567 \
  -e TRANSPORT_NAME=rabbitmq \
  -e RABBITMQ_URL=amqp://rabbitmq:5672 \
  -e REDIS_URL=redis://redis:6379 \
  -e SENSU_API_PORT=4567 \
  -e SENSU_SERVICE=api \
  sensu
```

## Compose
```
docker-compose up -d
```

## Test
```
docker logs sensu-server
docker exec -it redis redis-cli get leader
```
