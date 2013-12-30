#!/bin/bash

chown -R redis:redis /var/lib/redis

exec /usr/bin/supervisord -c /etc/supervisord.conf
