FROM debian:12
RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN mkidr -p /etc/nginx/ssl
RUN apt install OpenSSL -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=ahuge.42.fr/UID=ahuge"
