# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clean.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/22 16:44:17 by clorin            #+#    #+#              #
#    Updated: 2021/06/22 16:44:20 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

source srcs/.env

if [[ $(cat /etc/hosts | grep "127.0.0.1 ${DOMAIN_NAME}" | wc -l) -eq 1 ]] ; then
	sudo sed -i "/127.0.0.1 $DOMAIN_NAME/d" /etc/hosts
fi

echo -n "remove data's folder ${PATH_LOGIN}/data..."
sudo rm -rf ${PATH_LOGIN}/data
echo "ok"
