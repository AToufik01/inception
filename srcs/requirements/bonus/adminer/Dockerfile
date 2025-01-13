FROM debian:11.11

RUN apt update && apt upgrade && apt install adminer -y
EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/usr/share/adminer"]