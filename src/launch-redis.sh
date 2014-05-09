#!/bin/bash

chown -R redis:redis /var/lib/redis

exec runuser -s /bin/bash redis -c "/usr/sbin/redis-server /etc/redis.conf"
