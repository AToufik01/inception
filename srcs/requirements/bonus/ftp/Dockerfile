FROM debian:11.11

RUN apt update && apt upgrade && apt install vsftpd ftp -y
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY  ./tools/adduser.sh /usr/bin/

RUN chmod +x /usr/bin/adduser.sh
CMD [ "adduser.sh" ]