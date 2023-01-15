
## Documentations:

- https://www.youtube.com/playlist?list=PLlxQJeQRaKDRC_TTW7E0Dz9xZWoxxzH3M - A quoi sert docker ? ( playlist )

- https://store.dockerme.ir/E-Book/Learning_Docker.pdf

- https://www.turnkeylinux.org/blog/alpine-vs-debian - alpine/debian simple conparizon 

- https://stackoverflow.com/questions/37461868/difference-between-run-and-cmd-in-a-dockerfile - CMD/RUN diff 
- https://codewithyury.com/docker-run-vs-cmd-vs-entrypoint/ CMD/RUN/ENTRYPOINT
- -------------------------------------------------
- https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04
-https://www.malekal.com/nginx-comment-activer-un-site-avec-sites-enabled-ou-nginx-modsite/ - sites-enabled/available


### NGINX (  TLSV1.2/3 )

https://www.frameip.com/ssl-tls/ - (fr) tres bon article pour comprendre comment fonctionne ssl-tls

https://social.technet.microsoft.com/wiki/contents/articles/15189.difference-between-self-signed-ssl-certificate-authority.aspx - diff ssl self-signed cert / certificate authority

https://en.wikipedia.org/wiki/Self-signed_certificate - ssl self-signed certificate

- create a certificate with openssl (in host machine in path /etc/ssl/(certs for .crt and private for .key)
- -> configure nginx (ssl directives)
- -> verify the connexion with curl `curl https://localhost` (if error 60 occurs (can't verify certificates etc ... you need to copy the public key of the server in ca-certificates.crt)

(error SSL_ERROR_NO_CYPHER_OVERLAP are from ssl_ciphers) 

- https://www.digitalocean.com/community/tutorials/how-to-create-an-ssl-certificate-on-nginx-for-ubuntu-14-04 - create a certificate with openssl 
- https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm 
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
- https://stackoverflow.com/questions/19414832/how-can-i-pull-the-ssl-certificate-from-a-remote-server
- https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting

https://www.nginx.com/blog/nginx-https-101-ssl-basics-getting-started/#Overview

#### Demonstrate tls1.2/3 only works 
- `openssl s_client -tls1_2 -connect mtellal.42.fr:443` (change `-tls1_2` by `-tls1_1` should not works)
- `curl --tls1.2 https://mtellal.42.fr` get the html page (change `-tls1.2` by `-tls1.1` should fail the handshake)
  - docs for curl (https://developer.ibm.com/articles/what-is-curl-command/)

#### (more docs for nginx and ssl/tls)
- https://knowledge.digicert.com/solution/SO16297.html - certificate chain 
- https://serverfault.com/questions/9708/what-is-a-pem-file-and-how-does-it-differ-from-other-openssl-generated-key-file - format and standard for certificates (pem, crt, key ...)

-----------------------------------------------------------------------------------------------------------------------------

### WORDPRESS PHP

- https://nginx.org/en/docs/http/configuring_https_servers.html - How to config a HTTPS server 
- https://www.linode.com/docs/guides/create-a-self-signed-tls-certificate/ - create a tls certificate
- https://stackoverflow.com/questions/38666191/while-loop-in-bash-that-uses-pgrep-to-check-if-service-exists - looping until ps/service die 
- https://stackoverflow.com/questions/37313780/how-can-i-start-php-fpm-in-a-docker-container-by-default/44409813 - start php-fpm in forground

- https://docs.docker.com/engine/install/ubuntu/ - install docker engine on ubuntu 
- https://docs.docker.com/compose/install/ - install docker compose on ubuntu 
- https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a - wodpress deployement with ngnix, php, mariadb ...
- https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/ - configure ngnix to use tls 1.2/1.3 only
- https://www.php.net/manual/en/install.fpm.configuration.php - php-fpm configuration 
- https://wordpress.org/support/article/backing-up-your-database/ - exporting/backing up data
- https://www.alpinelinux.org/releases/ - alpines os releases
- https://www.adminer.org/#download - adminer download 
- https://www.php.net/manual/en/features.commandline.webserver.php - php built-in server

- https://github.com/dediane/42_Inception - docker basics commands

- https://github.com/EugenieF/42_inception - more docs
- https://github.com/lusehair/42inception - more docs ( docker-compose.yml )

- https://github.com/llescure/42_Inception

- https://github.com/vbachele/Inception

----------------------------------------------------------------------------------------------------------------------------

### MARIADB 

- https://dev.mysql.com/doc/refman/8.0/en/manual-info.html - mysql doc

- https://mariadb.com/kb/en/ - docs "official" mariadb 

http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/

#### remote connection mariadb 
##### docker container
- connect in root `mysql -u root` 
- Grant all privileges $user (root or others) `GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';` or from a script with `echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root`
- flush privileges `FLUSH PRIVILEGES;`

##### remote host
- connect to server from remote host - `mysql -u root (user) -p(password) -P (port bind) -h localhost --protocol=tcp`
