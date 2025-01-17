FROM debian:bullseye

RUN apt update && apt upgrade && apt install nginx -y
COPY ./conf/nginx.conf /etc/nginx/conf.d/f.conf
WORKDIR /var/www/html

COPY ./tools/app/ .

RUN chmod 755 /var/www/html

CMD ["nginx", "-g", "daemon off;"]
