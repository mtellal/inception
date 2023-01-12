FROM	debian:buster

RUN	apt-get update && apt-get -y install \
	nginx \
	openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=IT/CN=mtellal.42.fr" \
	-keyout /etc/ssl/private/mtellal.42.fr.key -out /etc/ssl/certs/mtellal.42.fr.crt

RUN	mkdir /var/www/mtellal.42.fr \
	&& cp /var/www/html/index.nginx-debian.html /var/www/mtellal.42.fr/index.html

COPY conf/mtellal.42.fr /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/mtellal.42.fr /etc/nginx/sites-enabled/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
