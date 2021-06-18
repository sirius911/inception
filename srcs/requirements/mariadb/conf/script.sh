#!/bin/sh

/usr/bin/mysqld_safe --datadir='/home/mariadb'

sleep 10

if ! mysqladmin --wait=60 ping; then
	exit 1
fi

already_exist=$( mariadb -e "SHOW DATABASES" | grep "wordpress" | wc -l )
if [[ $already_exist -eq 1 ]] ; then
	echo "wordpress already exist"
	killall mariadbd
	sleep 5
	/usr/bin/mysqld_safe --datadir='/home/mariadb'
else
 	cd /entrypoint ; mariadb -e "$(eval "echo \"$(cat create_db.sql)\"")"
 	killall mariadbd
	sleep 5
	/usr/bin/mysqld_safe --datadir='/home/mariadb'
 fi