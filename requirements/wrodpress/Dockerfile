FROM	debian:buster

RUN	apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	wget \
	mariadb-client \
	mariadb-server

RUN	wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \ 
	&& mkdir /var/www/ \
	&& tar -xvf /tmp/wordpress.tar.gz -C /var/www/

EXPOSE 9000
