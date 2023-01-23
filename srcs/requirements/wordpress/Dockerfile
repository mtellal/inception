FROM	debian:buster

RUN	apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	wget \
	mariadb-client \
	mariadb-server

RUN	wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \ 
	&& mkdir -p /var/www/ \
	&& tar -xvf /tmp/wordpress.tar.gz -C /var/www/

COPY	./conf/wp-config.php /var/www/wordpress/wp-config.php

RUN	echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf \
	&& mkdir -p /run/php

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]
