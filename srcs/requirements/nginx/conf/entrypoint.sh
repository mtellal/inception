#!/bin/bash 

echo "127.0.0.1		mtellal.42.fr" >> /etc/hosts

nginx -g "daemon off;"
