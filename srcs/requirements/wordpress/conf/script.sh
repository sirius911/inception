# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clorin <clorin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/24 13:58:36 by clorin            #+#    #+#              #
#    Updated: 2021/06/24 13:58:39 by clorin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

cd ${WORDPRESS_PATH}

if [ ! -f "wp-config.php" ] ; then
	echo "Downloading wordpress..."
	wp core download --locale=fr_FR
else
	echo "wp-config is present... not downloading wordpress"
fi

#connect mariadb
connected=0
while [[ $connected -eq 0 ]] ; do
	mariadb -h${WORDPRESS_DB_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} &> /dev/null
	[[ $? -eq 0 ]] && { connected=$(( $connected + 1 ));}
	sleep 1
done

#config wordpress
if [ ! -f "wp-config.php" ] ; then
	echo "no wp-config.php --> create config db"
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${WORDPRESS_DB_HOST}
else
	echo "wp-config.php exist... "
fi

# create administrator wordpress
if ! wp core is-installed ; then
	echo "core not installed... core install..."
	wp core install --url=${DOMAIN_NAME} --title="Sirius's blog 42" --admin_user=${WORDPRESS_DB_ADMIN} --admin_password=${WORDPRESS_DB_ADMIN_PASSWORD} --admin_email="${WORDPRESS_DB_ADMIN}@42.fr" --skip-email
else
	echo "core is already installed..."
fi

#create user wordpress
if [[ $(wp user list --field=user_login | grep ${WORDPRESS_DB_USER} | wc -l) -eq 0 ]]; then
	wp user create ${WORDPRESS_DB_USER} "${WORDPRESS_DB_USER}@student.42.fr" --user_pass=${WORDPRESS_DB_USER_PASSWORD} --role=editor
fi

# config www.conf
cp /entrypoint/www.conf /etc/php7/php-fpm.d/

echo "Listing users:"
wp user list

echo "Wordpress info:"
wp --info

#wordpress installed and download finish
touch .installed

echo "Starting php-fpm..."
php-fpm7 -F
