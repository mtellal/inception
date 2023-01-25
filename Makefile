# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mtellal <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/19 16:15:37 by mtellal           #+#    #+#              #
#    Updated: 2023/01/25 15:25:38 by mtellal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOST_USER	=	mtellal

IMAGES 		= 	$(shell docker images -q)
CONTAINERS 	= 	$(shell docker ps -aq)
VOLUMES 	= 	$(shell docker volume ls -q)

all: compose

compose:
	mkdir -p /home/$(HOST_USER)/data/wordpress
	mkdir -p /home/$(HOST_USER)/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up
down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune --volumes -f

fclean: clean
	sudo rm -rf /home/$(HOST_USER)/data	
	-docker rmi -f $(IMAGES)  
	-docker rm -f $(CONTAINERS)
	-docker volume rm $(VOLUMES)

re: fclean compose
