#!/bin/sh

cd ${WORDPRESS_PATH}

if [ ! -f "wp-config.php" ] ; then
	echo "Downloading wordpress..."
	wp core download --locale=fr_FR 2> /dev/null
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
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${WORDPRESS_DB_HOST}
fi

# create administrator wordpress
if ! wp core is-installed ; then
	wp core install --url=${DOMAIN_NAME} --title="Sirius's blog 42" --admin_user=${WORDPRESS_DB_ADMIN} --admin_password=${WORDPRESS_DB_ADMIN_PASSWORD} --admin_email="${WORDPRESS_DB_ADMIN}@42.fr" --skip-email
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

echo "Starting php-fpm..."
php-fpm7 -F