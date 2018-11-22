FROM alpine:latest
LABEL maintainer="Daniel Marzini <daniel.marzini@iubenda.com>"
ENV NGINX_VERSION=1.14.1

RUN apk add --update supervisor nginx ca-certificates
RUN mkdir -p /etc/supervisor.d/ /var/log/supervisor/ /var/tmp/nginx/

#COPY container/config/nginx/default.conf /etc/nginx/conf.d/default.conf
#COPY container/config/nginx/nginx.conf /etc/nginx/nginx.conf

COPY docker/container/config/supervisor/nginx.ini /etc/supervisor.d

#App Section
#COPY app/ /var/www
#RUN rm -rf /var/www/.git

EXPOSE 80/tcp
ENTRYPOINT /usr/bin/supervisord -n -c /etc/supervisord.conf
