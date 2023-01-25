FROM	debian:buster

RUN	apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	wget \
	mariadb-client \
	mariadb-server

COPY	./conf/entrypoint.sh /

RUN	chmod +x ./entrypoint.sh

RUN	wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \ 
	&& mkdir -p /var/www/ \
	&& tar -xvf /tmp/wordpress.tar.gz -C /var/www/ \
	&& chmod 755 /var/www/wordpress \
	&& chown root:root /var/www/wordpress

RUN	 wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf 

EXPOSE 9000

ENTRYPOINT ["./entrypoint.sh"]
