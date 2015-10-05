FROM debian:jessie

MAINTAINER Rob Wilson <roobert@gmail.com>

# install wget
RUN apt-get update && apt-get install -y wget

# install sensu repo
RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add -
RUN echo "deb http://repos.sensuapp.org/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list

# upgrade image
RUN apt-get update
RUN apt-get -y upgrade

# install sensu
RUN apt-get install -y sensu
