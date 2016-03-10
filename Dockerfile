# Base Image
FROM nginx:1.9

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
#RUN rm /etc/nginx/sites-enabled/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# NGINX Setup - Services
#COPY docker/nginx/sites-enabled /etc/nginx/sites-enabled
#RUN ln -s /etc/nginx/sites-available/api-service /etc/nginx/sites-enabled/api-service

# Supervisor Setup
COPY docker/supervisor/supervisor.conf /etc/supervisor/conf.d/

#EXPOSE 8080
CMD /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisor.conf
