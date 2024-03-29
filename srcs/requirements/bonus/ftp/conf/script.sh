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

sed -i "s/FTP_USER/${FTP_USER}/g" vsftpd.conf

path=$(echo ${PATH_FTP} | sed 's_/_\\/_g')
sed -i "s/PATH_FTP/${path}/g" vsftpd.conf

cert=$(echo ${CERTS_KEY} | sed 's_/_\\/_g')
sed -i "s/CERTS_KEY/${cert}/g" vsftpd.conf

cp vsftpd.conf /etc/vsftpd

{ echo "$FTP_PASSWORD"; echo "$FTP_PASSWORD"; } | adduser ${FTP_USER}

sed -i "s/FTP_USER/${FTP_USER}/g" vsftpd.user_list

cp vsftpd.user_list /etc/vsftpd

if [ ! -f ${CERTS_KEY} ] ; then
	echo -n "Waiting for certificat "
	while [ ! -f ${CERTS_KEY} ]; do
		echo -n "."
		sleep 1
	done
	echo "ok"
fi
vsftpd /etc/vsftpd/vsftpd.conf
