#!/bin/bash

###
# Little "init" file to be executed within the container upon startup
###

echo "Starting redis..."
start-stop-daemon --start --chuid redis:redis --pidfile /var/run/redis/redis.pid --umask 007 --exec /usr/bin/redis-server -- /etc/redis/redis.conf

echo "Starting logstash"
service logstash start

echo "Starting elasticsearch"
service elasticsearch start

echo "Starting nginx"
service nginx start

