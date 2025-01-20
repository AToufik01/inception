FROM debian:bullseye

RUN apt update && apt upgrade && apt install vsftpd ftp -y

COPY  ./tools/adduser.sh /usr/bin/

RUN chmod +x /usr/bin/adduser.sh

CMD [ "adduser.sh" ]