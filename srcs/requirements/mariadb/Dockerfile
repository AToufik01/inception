FROM debian:bullseye

RUN apt update && apt upgrade && apt install mariadb-server -y

COPY  ./tools/db.sh /usr/bin/

COPY ./conf/my_config.cnf /etc/mysql/

RUN chmod +x /usr/bin/db.sh

RUN echo "!include /etc/mysql/my_config.cnf" >> /etc/mysql/my.cnf

CMD ["db.sh"]