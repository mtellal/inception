FROM	debian:buster

RUN	apt-get update && apt-get -y install \
	nginx \
	openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=IT/CN=mtellal.42.fr" \
	-keyout /etc/ssl/private/mtellal.42.fr.key -out /etc/ssl/certs/mtellal.42.fr.crt

COPY	./conf/wordpress /etc/nginx/sites-available/wordpress

COPY	./conf/entrypoint.sh /

RUN	ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/ \
	&& mkdir -p /var/www/wordpress \
	&& chmod +x /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 443
