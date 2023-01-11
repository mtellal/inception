FROM	debian:buster

RUN	apt-get update && apt-get -y install \
	nginx \
	openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=IT/CN=mtellal.42.fr" \
	-keyout /etc/ssl/private/mtellal.42.fr.key -out /etc/ssl/certs/mtellal.42.fr.crt

COPY html/index.html /srv
	
COPY .conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
