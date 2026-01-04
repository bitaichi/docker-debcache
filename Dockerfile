FROM nginx:1.29.4-trixie-perl

COPY debcache.conf /etc/nginx/conf.d/debcache.conf
