# FROM debian:11.11

# RUN apt update && apt upgrade && apt install curl tar -y 
# RUN curl -L https://github.com/portainer/portainer/releases/download/2.25.1/portainer-2.25.1-linux-amd64.tar.gz -o portainer-2.25.1-linux-amd64.tar.gz
# RUN tar -xvzf portainer-2.25.1-linux-amd64.tar.gz
# RUN rm -rf portainer-2.25.1-linux-amd64.tar.gz
# COPY ./tools/portainer.sh .
# RUN chmod +x portainer.sh
# CMD [ "./portainer.sh" ]
FROM debian:11.11

# Install dependencies
RUN apt update && apt upgrade && apt install -y \
    curl \
    tar \
    openssl

# Download and extract Portainer
RUN curl -L https://github.com/portainer/portainer/releases/download/2.25.1/portainer-2.25.1-linux-amd64.tar.gz -o portainer-2.25.1-linux-amd64.tar.gz
RUN tar -xvzf portainer-2.25.1-linux-amd64.tar.gz
RUN rm -rf portainer-2.25.1-linux-amd64.tar.gz

# Generate SSL certificates using OpenSSL
RUN mkdir -p /data/ssl && \
    openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -keyout /data/ssl/private-key.pem -out /data/ssl/certificate.pem \
    -subj "/C=US/ST=State/L=City/O=Company/OU=Department/CN=portainer.local"

# Copy the custom script and set permissions
COPY ./tools/portainer.sh .
RUN chmod +x portainer.sh
EXPOSE 9443
# Command to run Portainer with SSL
CMD [ "./portainer.sh" ]
