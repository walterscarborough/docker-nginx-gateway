# Base Image
FROM nginx:1.10

MAINTAINER Walter Scarborough <walter.scarborough@gmail.com>

RUN mkdir /etc/nginx/sites-available \
    && \
    mkdir /etc/nginx/sites-enabled

RUN apt-get update && apt-get install -y \
    dnsmasq \
    supervisor \

    && \

    apt-get clean \

    && \

    rm -Rf /var/lib/apt/lists/*

# NGINX Setup - General
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Supervisor Setup
COPY docker/supervisor/supervisor.conf /etc/supervisor/conf.d/

#EXPOSE 8080
CMD /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisor.conf
