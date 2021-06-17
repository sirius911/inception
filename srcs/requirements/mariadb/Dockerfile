FROM 		alpine:3.13.4

LABEL maintener="clorin@student.42.fr" release-date="2021-06-04" \
	description="MariaDB Server"

RUN		apk add --no-cache mariadb  mariadb-client vim

COPY		conf/ /entrypoint/

COPY		conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN		mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && \
		mkdir -p /home/mariadb && chown -R mysql:mysql /home/mariadb && \
		mariadb-install-db --user=mysql --datadir='/home/mariadb'

WORKDIR		/entrypoint

EXPOSE 3306

ENTRYPOINT ["sh", "script.sh"]
