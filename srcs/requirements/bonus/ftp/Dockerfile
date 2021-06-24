# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 14:07:48 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 14:11:26 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.13.4

LABEL 		maintener="clorin@student.42.fr" release-date="2021-06-23"

RUN		apk add --no-cache vsftpd

COPY		conf/ /entrypoint

WORKDIR		/entrypoint

EXPOSE		21

ENTRYPOINT	["sh", "script.sh"]

