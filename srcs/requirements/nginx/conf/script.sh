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

if [ -f "default.conf" ] ; then
	#server_name -> DOMAIN_URL
	sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" default.conf

	#ssl_certificate & ssl_certificate_key ->CERTS_KEY;
	key=$(echo ${CERTS_KEY} | sed 's_/_\\/_g')
	sed -i "s/CERTS_KEY/${key}/g" default.conf
	mv default.conf /etc/nginx/http.d/
else
	echo "Nginx is already configured."
fi

if [ ! -f "$CERTS_KEY" ] ; then
	openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=${DOMAIN_NAME}" -newkey rsa:2048 -keyout ${CERTS_KEY} -out ${CERTS_KEY};
fi

nginx -g "daemon off;"
