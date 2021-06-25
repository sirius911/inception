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

path=$(echo ${PATH_FTP} | sed 's_/_\\/_g')
sed -i "s/PATH_FTP/${path}/g" vsftpd.conf

cert=$(echo ${CERT_KEY} | sed 's_/_\\/_g')
sed -i "s/CERT_KEY/${cert}/g" vsftpd.conf

cp vsftpd.conf /etc/vsftpd

{ echo "user42"; echo "user42"; } | adduser clorinftp

cp vsftpd.user_list /etc/vsftpd

if [ ! -f ${CERT_KEY} ] ; then
	echo -n "Waiting for certificat "
	while [ ! -f ${CERT_KEY} ]; do
		echo -n "."
		sleep 1
	done
	echo "ok"
fi

vsftpd /etc/vsftpd/vsftpd.conf
