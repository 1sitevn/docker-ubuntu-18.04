#!/bin/bash

setsebool -P httpd_can_network_connect 1

rm /etc/nginx/sites-enabled/default

service nginx start
service php7.3-fpm start

git config --global user.name "TungNT"
git config --global user.email "tungnt.blue@gmail.com"

exec $@