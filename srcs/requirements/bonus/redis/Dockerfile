FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install redis-server php-cli php-redis php-fpm -y

COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]