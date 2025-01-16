FROM debian:11.11

RUN apt update && apt upgrade && apt install nginx -y

RUN mkdir -p /var/www/html/app

COPY ./app/index.html /var/www/html/app

COPY ./app/docker.png /var/www/html/app

COPY ./app/script.js /var/www/html/app

COPY ./app/styles.css /var/www/html/app

RUN chmod 755 /var/www/html/app

CMD ["nginx", "-g", "daemon off;"]
