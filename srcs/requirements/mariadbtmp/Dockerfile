FROM debian:12
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
RUN chown -R mysql:mysql /var/lib/mysql/
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh .
RUN chmod +x script.sh
RUN mkdir -p /run/mysqld
ENTRYPOINT ["bash", "./script.sh"]
CMD ["mysqld_safe"]