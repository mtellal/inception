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

COPY	./conf/wp-config.php /var/www/wordpress/

COPY	./conf/entrypoint.sh /usr/local/entrypoint.sh

RUN	chmod +x /usr/local/entrypoint.sh \
	&& echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf


EXPOSE 9000

ENTRYPOINT ["/usr/local/entrypoint.sh"]
