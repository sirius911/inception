FROM debian:buster

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04" \
	description="MariaDB Server"

RUN apt-get update -y \
	&& apt-get install -y mariadb-server mariadb-client mariadb-common vim

RUN mkdir -p /mariadb
RUN mkdir /run/mysqld
RUN chown -R mysql:mysql /run/mysqld/
RUN chown -R mysql:mysql /var/lib/mysql
RUN mysql_install_db --user=mysql --datadir='/mariadb'
COPY script.sh ./script.sh

EXPOSE 3306

CMD ["./script.sh"]
#CMD ["mysqld"]
