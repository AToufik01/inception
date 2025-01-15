#!/bin/bash
useradd $USERNAME_FTP
echo "$USERNAME_FTP:$PASSWORD_FTP" | chpasswd
mkdir -p $DIR_FTP
chown -R $USERNAME_FTP:$USERNAME_FTP $DIR_FTP
mkdir -p /var/run/vsftpd/empty
vsftpd /etc/vsftpd.conf