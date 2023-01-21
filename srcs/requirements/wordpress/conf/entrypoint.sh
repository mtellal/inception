#!/bin/bash 

sleep 10

mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F
