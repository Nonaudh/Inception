FROM debian:11
RUN apt update && apt upgrade -y
RUN apt install -y php7.4-fpm php7.4-mysql curl
RUN mkdir -p /run/php
COPY /conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY tools/script.sh tmp/.
RUN chmod +x tmp/script.sh
CMD ["tmp/script.sh"]

