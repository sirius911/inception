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

openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=clorin.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
mv default.conf /etc/nginx/http.d/
nginx -g "daemon off;"
