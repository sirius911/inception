# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 13:55:07 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 13:55:24 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.13.4

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04"

RUN		apk add --no-cache nginx openssl

RUN		mkdir -p /run/nginx && chown nginx:nginx /run/nginx

COPY	conf/ /entrypoint/

WORKDIR		/entrypoint

EXPOSE		443

ENTRYPOINT 	["sh", "script.sh"]
