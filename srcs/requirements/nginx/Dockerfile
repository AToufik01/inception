FROM debian:bullseye

RUN apt update && apt upgrade && apt install nginx openssl curl -y

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/my_key.key \
        -out /etc/nginx/ssl/myrequest.csr -subj "/C=MR/ST=SF/L=khoribga/O=42/OU=42/CN=ataoufik.42.fr/UID=ataoufik"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]