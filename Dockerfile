FROM blalor/supervised:latest
MAINTAINER Brian Lalor <blalor@bravo5.org>

EXPOSE 6379

ADD src /tmp/src/
RUN /tmp/src/config.sh

VOLUME [ "/var/lib/redis" ]
