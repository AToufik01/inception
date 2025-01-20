FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y curl php7.4-fpm php7.4-mysql

WORKDIR /var/www/wordpress

COPY  ./tools/start.sh /usr/bin/

RUN chmod +x /usr/bin/start.sh

EXPOSE 9000

CMD ["start.sh"]