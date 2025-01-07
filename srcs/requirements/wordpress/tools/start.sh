#!/bin/bash
mkdir -p /run/php
sleep 5
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp config create --dbname=${NAME_DATABASE} --dbuser=${NAME_USER} --dbpass=${USER_PASSWORD} --dbhost=${DB_HOST} --allow-root
php-fpm7.4 -F



