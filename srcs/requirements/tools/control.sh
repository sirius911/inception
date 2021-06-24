# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    control.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/22 15:17:39 by clorin            #+#    #+#              #
#    Updated: 2021/06/22 15:17:43 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

source srcs/.env

echo -n "control end of downloading "
while [[ ! -f "${PATH_HOST}/wordpress/.installed" ]] ; do
	echo -n "."
	sleep 1
done

echo "ok"
