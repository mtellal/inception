#!/bin/bash

/etc/init.d/mysql start 

sleep 1

mysql -e "UPDATE mysql.user SET Password = PASSWORD('root') WHERE User = 'root'"
mysql -u root -proot -e "CREATE DATABASE wordpress"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO \`root\`@'%' IDENTIFIED BY 'root'"
mysql -e "FLUSH PRIVILEGES"

mysqladmin -u root -proot shutdown
mysqld_safe
