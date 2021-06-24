#!/bin/sh

/usr/bin/mysqld_safe --datadir='/home/mariadb' &

sleep 10

if ! mysqladmin --wait=60 ping; then
	exit 1
fi

already_exist=$( mariadb -e "SHOW DATABASES" | grep "wordpress" | wc -l )

if [[ $already_exist -eq 1 ]] ; then
	echo "wordpress database already exist in mariadb."
	killall mariadbd
	sleep 5
	/usr/bin/mysqld_safe --datadir='/home/mariadb'
else
	echo "create wordpress in mariadb with 'create_db.sql'"
 	cd /entrypoint ; mariadb -e "$(eval "echo \"$(cat create_db.sql)\"")"
 	killall mariadbd
	sleep 5
	/usr/bin/mysqld_safe --datadir='/home/mariadb'
 fi
