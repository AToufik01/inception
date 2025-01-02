FROM debian:12.8

RUN apt update && apt upgrade && apt install curl zip unzip -y
RUN curl -O https://wordpress.org/latest.zip
RUN unzip latest.zip && rm latest.zip
RUN mkdir -p /var/www/wordpress && mv wordpress /var/www/