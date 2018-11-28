FROM alpine:latest
LABEL maintainer="Daniel Marzini <daniel.marzini@iubenda.com>"
ENV NGINX_VERSION=1.14.1

RUN apk add --update supervisor nginx ca-certificates
RUN mkdir -p /etc/supervisor.d/ /var/log/supervisor/ /var/tmp/nginx/
COPY docker/container/config/supervisor/nginx.ini /etc/supervisor.d
COPY main.go /var/www/main.go

EXPOSE 80/tcp
ENTRYPOINT /usr/bin/supervisord -n -c /etc/supervisord.conf
