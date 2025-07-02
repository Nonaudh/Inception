#!/bin/bash

# service mysql start

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p ${SQL_ROOT_PASSWORD} shutdown

# exec mysqld_safe

# Initialise le répertoire de données MariaDB
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Démarre MariaDB en mode bootstrap
mariadbd --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;

# Supprimez l'utilisateur et la base de données par défaut
DROP USER IF EXISTS ''@'localhost';
DROP DATABASE IF EXISTS test;

# Créez la base de données WordPress et l'utilisateur
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';

# Changez le mot de passe de l'utilisateur root
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Exécute MariaDB
exec mariadbd
