# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 14:12:23 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 14:12:57 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

cp vsftpd.conf /etc/vsftpd

{ echo "user42"; echo "user42"; } | adduser clorinftp

cp vsftpd.user_list /etc/vsftpd

vsftpd /etc/vsftpd/vsftpd.conf
