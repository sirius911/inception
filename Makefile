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

stop_bonus:
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml stop

ps:
		@cd srcs/ && docker-compose ps

ps_bonus:
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml ps

logs:
		@cd srcs/ && docker-compose logs

logs_bonus:
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml logs

clean:
		@cd srcs/ && docker-compose down

clean_bonus:
		@cd srcs/ && docker-compose -f docker-compose_bonus.yml down

fclean:		clean
		@docker system prune --all --force
		@docker volume rm srcs_dbdata --force
		@docker volume rm srcs_wp_files --force
		@docker volume rm srcs_certs_data --force
		@/bin/bash srcs/requirements/tools/clean.sh

fclean_bonus:	clean_bonus
		@docker system prune --all --force
		@docker volume rm srcs_dbdata --force
		@docker volume rm srcs_wp_files --force
		@docker volume rm srcs_certs_data --force
		@/bin/bash srcs/requirements/tools/clean.sh

re:		fclean all

re_bonus:	fclean_bonus bonus

.PHONY: all, start, stop, ps, logs, clean, fclean, re, bonus, start_bonus, stop_bonus, ps_bonus, logs_bonus, clean_bonus, fclean_bonus, re_bonus
