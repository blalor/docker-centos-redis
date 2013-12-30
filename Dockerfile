FROM blalor/centos-supervised:latest

MAINTAINER Brian Lalor <blalor@bravo5.org>

EXPOSE 6379

VOLUME [ "/var/lib/redis" ]

RUN yum install -y redis && yum clean all

## fix up redis config file for Docker-friendliness
RUN sed -i -e 's#daemonize yes#daemonize no#' -e '/bind/d' /etc/redis.conf

ADD program-redis.conf /etc/supervisor.d/
