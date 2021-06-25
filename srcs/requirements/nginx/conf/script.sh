# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 13:55:46 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 13:56:03 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -f "$CERTS_KEY" ] ; then
	openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=${DOMAIN_NAME}" -newkey rsa:2048 -keyout ${CERTS_KEY} -out ${CERTS_KEY};
fi

if [ -f "default.conf" ] ; then
	mv default.conf /etc/nginx/http.d/
fi
nginx -g "daemon off;"
