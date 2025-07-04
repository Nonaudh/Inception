#!/bin/bash

# until mysql -h ${DB_HOST} -u${DB_USER} -p${DB_PASS} -e "SHOW DATABASES;" >/dev/null 2>&1; do
#   echo "Waiting for database connection..."
#   sleep 3
# done


if [ ! -f /var/www/html/wp-config.php ]; then

	cd /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --allow-root
	./wp-cli.phar core install --url=${URL} --title=inception --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
	./wp-cli.phar user create ${USER} ${USER}@42.com --role=subscriber --user_pass=${WP_USER_PASS} --allow-root
fi
	php-fpm7.4 -F

# set -x

# if [ ! -f /var/www/html/wp-config.php ]; then
#   cd /var/www/html || exit 1

#   echo "Downloading wp-cli.phar..."
#   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar || { echo "curl failed"; exit 1; }
#   chmod +x wp-cli.phar

#   echo "Downloading WordPress core..."
#   ./wp-cli.phar core download --allow-root || { echo "WP core download failed"; exit 1; }

#   echo "Creating wp-config.php..."
#   ./wp-cli.phar config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" --dbhost="${DB_HOST}" --allow-root || { echo "Config creation failed"; exit 1; }

#   echo "Installing WordPress..."
#   ./wp-cli.phar core install --url="${URL}" --title=inception --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASS}" --admin_email="${WP_ADMIN_EMAIL}" --allow-root || { echo "WP install failed"; exit 1; }

#   echo "Creating user..."
#   ./wp-cli.phar user create "${USER}" "${USER}@42.com" --role=subscriber --user_pass="${WP_USER_PASS}" --allow-root || { echo "User creation failed"; exit 1; }
# fi

# echo "Starting the serv baby..."
# php-fpm7.4 -F