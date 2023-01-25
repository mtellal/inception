#!/bin/bash 

wp config create --path=/var/www/wordpress --allow-root \
	       	--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306
		
mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F
