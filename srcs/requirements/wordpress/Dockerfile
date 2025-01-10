FROM debian:11.11

RUN apt update && apt install -y curl zip unzip

RUN apt update && apt install -y php7.4-fpm php7.4-mysql


#check redis connect 
RUN apt install redis-tools -y 
##################################
RUN curl -O https://wordpress.org/latest.zip
COPY  ./tools/start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh
RUN unzip latest.zip && rm latest.zip
RUN mkdir -p /var/www/wordpress && mv wordpress /var/www/

RUN chown -R www-data:www-data /var/www/wordpress &&  chmod -R 755 /var/www/wordpress

WORKDIR /var/www/wordpress
EXPOSE 9000
CMD ["start.sh"]