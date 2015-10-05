# docker-sensu

## About

An experiment in dockerizing Sensu..

## Post-Requisites

* [docker-uchiwa](http://github.com/roobert/docker-uchiwa)
* [docker-redis](http://github.com/roobert/docker-redis)
* [docker-rabbitmq](http://github.com/roobert/docker-rabbitmq)
* [docker-sensu-api](http://github.com/roobert/docker-sensu-api)
* [docker-sensu-server](http://github.com/roobert/docker-sensu-server)

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
