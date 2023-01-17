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

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/bin/ 
	&& chmod +x /usr/local/bin/wp-cli.phar 


EXPOSE 9000


ENTRYPOINT ["/etc/init.d/php7.3-fpm", "start;"]
