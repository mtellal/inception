FROM	debian:buster

RUN		apt-get update && apt-get install -y mariadb-server

COPY	./conf/conf.cnf /etc/mysql/mariadb.conf.d/conf.cnf

COPY	./conf/entrypoint.sh /entrypoint.sh

RUN		chmod +x /entrypoint.sh \
		&& chmod 755 /var/lib/mysql

EXPOSE	3306

ENTRYPOINT ["./entrypoint.sh"]
