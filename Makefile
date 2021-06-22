# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/22 15:09:50 by clorin            #+#    #+#              #
#    Updated: 2021/06/22 15:09:54 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:	
		@/bin/bash srcs/requirements/tools/build.sh
		@cd srcs/ && docker-compose up -d --build

start:
		@cd srcs/ && docker-compose start

stop:
		@cd srcs/ && docker-compose stop

ps:
		@cd srcs/ && docker-compose ps

log:
		@cd srcs/ && docker-compose logs

clean:
		@cd srcs/ && docker-compose down

re:		fclean all

fclean:	clean
		@docker system prune --volumes --all --force
		@/bin/bash srcs/requirements/tools/clean.sh

.PHONY: all, start, stop, ps, log, clean, fclean, re