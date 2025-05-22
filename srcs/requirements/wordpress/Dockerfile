FROM debian:12
RUN apt update && apt upgrade -y
RUN apt install -y php-fpm php-mysqli curl
COPY /conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY tools/script.sh tmp/.
RUN chmod +x tmp/script.sh
CMD ["tmp/script.sh"]

