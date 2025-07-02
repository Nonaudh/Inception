#!/bin/bash

until mysql -h ${DB_HOST} -u${DB_USER} -p${DB_PASS} -e "SHOW DATABASES;" >/dev/null 2>&1; do
  echo "Waiting for database connection..."
  sleep 3
done

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --allow-root
./wp-cli.phar core install --url=${URL} --title=inception --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
./wp-cli.phar user create ${USER} ${USER}@42.com --role=subscriber --user_pass=${WP_USER_PASS} --allow-root

php-fpm7.4 -F
