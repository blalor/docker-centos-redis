#!/bin/bash

set -e -x -u

cd /tmp/src

mv program-redis.conf /etc/supervisor.d/
mv launch-redis.sh /usr/local/bin/
mv logstash-forwarder-redis.json /etc/logstash-forwarder.d/redis.json

yum install -y --disablerepo='*' --enablerepo=blalor-yum-el6 redis

## fix up redis config file for Supervisor-friendliness
sed -i \
    -e 's#daemonize yes#daemonize no#' \
    -e '/bind/d' \
    /etc/redis.conf

## cleanup
cd /
yum clean all
rm -rf /var/tmp/yum-root* /tmp/src
