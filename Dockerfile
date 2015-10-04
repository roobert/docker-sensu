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

ENV TRANSPORT_NAME=
ENV RABBITMQ_URL=
ENV REDIS_URL=
ENV SENSU_CLIENT_NAME=
ENV SENSU_CLIENT_ADDRESS=
ENV SENSU_CLIENT_SUBSCRIPTIONS=
ENV SENSU_API_PORT=

ENV SENSU_SERVICE=
ENV LOG_LEVEL=info
ENV SENSU_GEMS_VERSION=2.0.0

# use embedded ruby..
ENV PATH /opt/sensu/embedded/bin:$PATH:/sensu/plugins:/sensu/handlers
ENV GEM_PATH /opt/sensu/embedded/lib/ruby/gems/${SENSU_GEMS_VERSION}:$GEM_PATH

# can be used to do things like install dependencies for sensu handlers/plugins
ADD dependencies.sh /tmp/
RUN bash /tmp/dependencies.sh

CMD /opt/sensu/embedded/bin/sensu-${SENSU_SERVICE} --config_dir /sensu/conf.d --extension_dir /sensu/extensions --log_level $LOG_LEVEL
