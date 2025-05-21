FROM debian:12
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/init.sql /etc/mysql/init.sql
RUN mkdir /run/mysqld
CMD ["mysqld"]