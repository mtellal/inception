FROM	debian:buster

RUN	apt-get update && apt-get install -y mariadb-server

COPY	./conf/conf.cnf /etc/mysql/mariadb.conf.d/conf.cnf

COPY	./conf/script.sh /home/root/script.sh

RUN	chmod +x /home/root/script.sh

ENTRYPOINT ["/home/root/script.sh"]
