# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/22 15:17:39 by clorin            #+#    #+#              #
#    Updated: 2021/06/22 15:17:43 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

source srcs/.env

if [[ $(cat /etc/hosts | grep "127.0.0.1 ${DOMAIN_NAME}" | wc -l) -eq 0 ]] ; then
	echo "127.0.0.1 ${DOMAIN_NAME}" | sudo tee -a /etc/hosts
fi
sudo mkdir -p -v ${PATH_HOST}
sudo mkdir -p -v ${PATH_HOST}/db
sudo mkdir -p -v ${PATH_HOST}/wordpress
