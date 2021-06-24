# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 13:58:15 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 13:58:19 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.13.4

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04"

RUN		apk add --no-cache php7 php7-fpm php7-phar php7-json php7-curl \
		php7-mysqli mariadb-client php7-iconv

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/bin/wp

COPY		conf/ /entrypoint/

WORKDIR		/entrypoint

ENTRYPOINT	["sh", "script.sh"]
