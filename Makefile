# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mtellal <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/19 16:15:37 by mtellal           #+#    #+#              #
#    Updated: 2023/01/19 16:26:29 by mtellal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: compose

compose:
	docker compose up -d

clean:
	docker system prune --volumes -f

fclean: clean
	docker rmi $(docker images ls -aq) 
	docker rm $(docker ps -aq)
	docker volume rm $(docker volume ls -q)
