#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=ahuge --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=ahuge.42.fr --title=inception --admin_user=megatron --admin_password=megapass --admin_email=megatron@42.com --allow-root
./wp-cli.phar user create ahuge ahuge@42.com --role=subscriber --user_pass=ahugepass --allow-root

php-fpm7.4 -F
