FROM debian:11

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/init.sql /etc/mysql/init.sql

RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

ENTRYPOINT ["/bin/sh", "-c", "test -d /var/lib/mysql/mysql || mysql_install_db --user=mysql --ldata=/var/lib/mysql && mysqld"]
