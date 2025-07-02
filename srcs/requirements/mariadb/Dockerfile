FROM debian:11

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/init.sql /etc/mysql/init.sql
# COPY tools/script.sh /tmp/script.sh
# RUN chmod +x /tmp/script.sh

RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

# ENTRYPOINT ["./tmp/script.sh"]
CMD ["mysqld"]
