#!/bin/bash
service vsftpd start
sleep 3
# adduser "${USERNAMEFTP}" <<EOF
# ${PASSWORDFTP}
# ${PASSWORDFTP}
# \n
# \n
# \n
# \n
# \n
# Y
# EOF
# chown -R ${USERNAMEFTP}:${USERNAMEFTP} /var/www/wordpress
#!/bin/bash


# Create the user with no prompts
adduser --disabled-password --gecos "" "${USERNAMEFTP}"

# Set the password for the user
echo "${USERNAMEFTP}:${PASSWORDFTP}" | chpasswd

# (Optional) Set ownership of WordPress directory
chown -R ${USERNAMEFTP}:${USERNAMEFTP} /var/www/wordpress
service vsftpd restart

tail -f dev/null
# vsftpd /etc/vsftpd.conf