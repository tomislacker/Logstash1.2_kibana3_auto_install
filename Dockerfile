FROM		ubuntu:latest
MAINTAINER	Ben Tomasik < btomasik [at] telkonet {dot} com>

ENV ES_DEB_URLROOT https://download.elasticsearch.org/elasticsearch/elasticsearch/
ENV ES_DEB_FILE elasticsearch-0.90.7.deb

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get upgrade

#####
# Install git, redis and other dependencies
#####
RUN apt-get install git curl ca-certificates redis-server rubygems ruby1.9.1-dev -y
RUN git clone https://github.com/tomislacker/Logstash1.2_kibana3_auto_install.git /tmp/Logstash1.2_kibana3_auto_install
RUN /tmp/Logstash1.2_kibana3_auto_install/bootstrap

EXPOSE 80
EXPOSE 6379
EXPOSE 9200
CMD /bin/bash /tmp/Logstash1.2_kibana3_auto_install/startStack.sh
