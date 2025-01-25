#!/bin/bash
useradd $USERNAME_FTP
echo "$USERNAME_FTP:$PASSWORD_FTP" | chpasswd
mkdir -p $DIR_FTP
chown -R $USERNAME_FTP:$USERNAME_FTP $DIR_FTP
mkdir -p /var/run/vsftpd/empty

sed -i 's|listen=NO|listen=YES|' /etc/vsftpd.conf
sed -i 's|listen_ipv6=YES|listen_ipv6=NO|' /etc/vsftpd.conf

echo "write_enable=YES
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40100
">> /etc/vsftpd.conf

vsftpd /etc/vsftpd.conf