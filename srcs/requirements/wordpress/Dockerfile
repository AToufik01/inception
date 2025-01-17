FROM debian:bullseye

RUN apt update && apt install -y curl zip unzip

RUN apt update && apt install -y php7.4-fpm php7.4-mysql

RUN curl -O https://wordpress.org/latest.zip

COPY  ./tools/start.sh /usr/bin/

RUN chmod +x /usr/bin/start.sh

RUN unzip latest.zip && rm latest.zip 

RUN mkdir -p /var/www/wordpress && mv wordpress /var/www/

WORKDIR /var/www/wordpress

EXPOSE 9000

CMD ["start.sh"]