#!/bin/bash
service mariadb start
sleep 5
mysql -u root --password=${PASSWORD_ROOT}<<EOF
CREATE DATABASE IF NOT EXISTS ${NAME_DATABASE};
CREATE USER IF NOT EXISTS '${NAME_USER}'@'localhost' IDENTIFIED BY '${USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${NAME_DATABASE}.* TO '${NAME_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF
tail -f /dev/null 
#####
#???#
#####
