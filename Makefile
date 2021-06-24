# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/22 15:09:50 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 14:06:40 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:	
		@/bin/bash srcs/requirements/tools/build.sh
		@cd srcs/ && docker-compose up -d --build
		@/bin/bash srcs/requirements/tools/control.sh

bonus:	
		@/bin/bash srcs/requirements/tools/build.sh
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml up -d --build
		@/bin/bash srcs/requirements/tools/control.sh

start:
		@cd srcs/ && docker-compose start

start_bonus:
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml start

stop:
		@cd srcs/ && docker-compose stop

ps:
		@cd srcs/ && docker-compose ps

ps_bonus:
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml ps

log:
		@cd srcs/ && docker-compose logs


clean:
		@cd srcs/ && docker-compose down

re:		fclean all

fclean:	clean
		@docker system prune --all --force
		@docker volume rm srcs_dbdata --force
		@docker volume rm srcs_wp_files --force
		@docker volume rm srcs_certs_data --force
		@/bin/bash srcs/requirements/tools/clean.sh

.PHONY: all, start, stop, ps, log, clean, fclean, re, bonus
