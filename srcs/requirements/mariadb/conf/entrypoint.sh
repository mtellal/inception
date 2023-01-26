#!/bin/bash

/etc/init.d/mysql start 

sleep 1

mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User = 'root';"
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`root\`@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe
