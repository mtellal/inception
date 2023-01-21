
# Documentations

--------------------------------------------------------------------------------------------------------------------------

### DOCKER

- https://docs.docker.com/engine/install/ubuntu/ - install docker engine on ubuntu 
- https://docs.docker.com/compose/install/ - install docker compose on ubuntu 
- https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a - wodpress deployement with ngnix, php, mariadb ...
- https://www.youtube.com/playlist?list=PLlxQJeQRaKDRC_TTW7E0Dz9xZWoxxzH3M - A quoi sert docker ? ( playlist )
- https://store.dockerme.ir/E-Book/Learning_Docker.pdf
- https://www.turnkeylinux.org/blog/alpine-vs-debian - alpine/debian simple conparizon 
- https://stackoverflow.com/questions/37461868/difference-between-run-and-cmd-in-a-dockerfile - CMD/RUN diff 
- https://codewithyury.com/docker-run-vs-cmd-vs-entrypoint/ CMD/RUN/ENTRYPOINT
- https://github.com/dediane/42_Inception - docker basics commands
- https://docs.docker.com/develop/
- https://blog.diogomonica.com//2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/
- https://12factor.net/

#### Control startup order
##### Ensure that wordpress wait mariadb
- https://docs.docker.com/compose/startup-order/
- https://dev.to/ku6ryo/frequently-used-2-healthcheck-recipes-for-docker-compose-dependency-resolution-2ad9 - docker healthcheck

</br>

#### PID 1 AND ENTRYPOINT
- https://petermalmgren.com/signal-handling-docker/
- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint
- https://wiki.bash-hackers.org/commands/builtin/exec
- https://docs.docker.com/engine/reference/builder/#entrypoint

</br>

##### Examples of compose files
- https://github.com/docker/awesome-compose 
- https://github.com/docker/awesome-compose/blob/master/official-documentation-samples/wordpress/README.md

--------------------------------------------------------------------------------------------------------------------------

### NGINX + TLSV1.2/3

- => create a certificate with openssl </br>
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private/nginx.key -out /etc/nginx/ssl/nginx.crt`

- => configure nginx (ssl directives) </br>
`ssl_protocols   TLSv1.2;` </br>
`ssl_certificate /etc/ssl/certs/mtellal.42.fr.crt;` </br>
`ssl_certificate_key /etc/ssl/private/mtellal.42.fr.key;`</br>

##### Demonstrate tls1.2/3 only works 
- `openssl s_client -tls1_2 -connect mtellal.42.fr:443` (change `-tls1_2` by `-tls1_1` should not works)
- `curl [--tls1.2 or --tls1.3] [-k (to bypass certificate)] https://mtellal.42.fr` get the html page (change `-tls1.2` by `-tls1.1` should fail the handshake)
  - docs for curl (https://developer.ibm.com/articles/what-is-curl-command/)

#### NGINX

- https://www.nginx.com/blog/regular-expression-tester-nginx/ - reg exp nginx
- https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/ - quick configuration for wordpress
- https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04
- https://www.malekal.com/nginx-comment-activer-un-site-avec-sites-enabled-ou-nginx-modsite/ - sites-enabled/available

#### TLS ( SSL) 

- - https://www.linode.com/docs/guides/create-a-self-signed-tls-certificate/ - create a tls certificate
- https://nginx.org/en/docs/http/configuring_https_servers.html - How to config a HTTPS server 
- https://www.frameip.com/ssl-tls/ - (fr) tres bon article pour comprendre comment fonctionne ssl-tls
- https://social.technet.microsoft.com/wiki/contents/articles/15189.difference-between-self-signed-ssl-certificate-authority.aspx - diff ssl self-signed cert / certificate authority
- https://en.wikipedia.org/wiki/Self-signed_certificate - ssl self-signed certificate
- https://www.digitalocean.com/community/tutorials/how-to-create-an-ssl-certificate-on-nginx-for-ubuntu-14-04 - create a certificate with openssl 
- https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm - openssl quick guide
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
- https://stackoverflow.com/questions/19414832/how-can-i-pull-the-ssl-certificate-from-a-remote-server - pull cert from web server
- https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting
- https://www.nginx.com/blog/nginx-https-101-ssl-basics-getting-started/#Overview
- https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/ - configure ngnix to use tls 1.2/1.3 only

#### (more docs for nginx and ssl/tls)
- https://knowledge.digicert.com/solution/SO16297.html - certificate chain 
- https://serverfault.com/questions/9708/what-is-a-pem-file-and-how-does-it-differ-from-other-openssl-generated-key-file - format and standard for certificates (pem, crt, key ...)

---------------------------------------------------------------------------------------------------------------------------

### MARIADB 

- https://dev.mysql.com/doc/refman/8.0/en/manual-info.html - mysql doc

- https://mariadb.com/kb/en/ - docs "official" mariadb 

http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/

#### remote connection mariadb 
##### docker container
- connect in root `mysql -u root` 
- Grant all privileges $user (root or others) </br>
`GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';` </br>
or from a script with `echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root` </br>
- flush privileges `FLUSH PRIVILEGES;`

##### remote host
- connect to server from remote host - `mysql -u root (user) -p(password) -P (port bind) -h localhost --protocol=tcp`

-----------------------------------------------------------------------------------------------------------------------------

### WORDPRESS PHP

#### Installation

- https://www.digitalocean.com/community/tutorials/install-wordpress-on-ubuntu

- Install wordpress `wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz` 

- Uncompress the tarball `tar -xvf tmp/wordpress.tar.gz -C /var/www/html`
  - x : extract files from an archive
  - v : verbosely list files processed
  - f : --file=archive use archive file or device ARCHIVE
  
- Copy the wordpress folder to `/var/www/html/ path` `cp -R wordpress /var/www/html/`
  - more infos on /var
    - https://www.quora.com/What-is-the-purpose-of-var-on-Linux - purpose of /var/ on linux 
    - http://www.linfo.org/var.html 
    - https://stackoverflow.com/questions/18514447/what-goes-in-var

- Change ownership of ‘wordpress’ directory `chown -R www-data:www-data /var/www/html/wordpress/` 
  - more infos on www-data:
    - https://askubuntu.com/questions/873839/what-is-the-www-data-user

- Change file permission `chmod -R 755 /var/www/html/wordpress/`

- https://make.wordpress.org/cli/handbook/guides/commands-cookbook/
- https://make.wordpress.org/cli/handbook/guides/installing/

#### more docs

- https://stackoverflow.com/questions/37313780/how-can-i-start-php-fpm-in-a-docker-container-by-default/44409813 - start php-fpm in forground
- https://www.php.net/manual/en/install.fpm.configuration.php - php-fpm configuration 
- https://wordpress.org/support/article/backing-up-your-database/ - exporting/backing up data
- https://www.php.net/manual/en/features.commandline.webserver.php - php built-in server

------------------------------------------------------------------------------------------------------------------------------

#### MORE DOCS

processes:
- http://www.linfo.org/process.html - process,life cycle etc...
- https://itsfoss.com/linux-daemons/ - daemons 

- https://stackoverflow.com/questions/38666191/while-loop-in-bash-that-uses-pgrep-to-check-if-service-exists - looping until ps/service die 
- https://www.adminer.org/#download - adminer download 

- https://github.com/EugenieF/42_inception - more docs
- https://github.com/lusehair/42inception - more docs ( docker-compose.yml )

- https://github.com/llescure/42_Inception

- https://github.com/vbachele/Inception
