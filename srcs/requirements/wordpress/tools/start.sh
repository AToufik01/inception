#!/bin/bash
mkdir -p /run/php
sleep 5
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf
wp config create --dbname=${NAME_DATABASE} --dbuser=${NAME_USER} --dbpass=${USER_PASSWORD} --dbhost=${DB_HOST} --allow-root
wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMINUSER} --admin_password=${ADMINPASSWORD} --admin_email=${EMAILADMINE} --allow-root
wp user create ${USERNAME} ${EMAILUSR} --role=${ROLE} --user_pass=${USERPASSWORD} --allow-root 

wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp redis enable --allow-root
chown -R www-data:www-data /var/www/wordpress
chmod -R 777 /var/www/wordpress

php-fpm7.4 -F