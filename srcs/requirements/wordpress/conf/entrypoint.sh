#!/bin/bash 

wp config create --path=/var/www/wordpress --allow-root \
	       	--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306

wp core install --path=/var/www/wordpress --allow-root \
	--url=https://mtellal.42.fr \
	--title=Inception \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=mez.tellal@gmail.com \
	--skip-email

wp user create --path=/var/www/wordpress --allow-root \
	$WP_USER_LOGIN \
	$WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD

mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F
