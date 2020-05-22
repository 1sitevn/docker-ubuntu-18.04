FROM ubuntu:18.04

MAINTAINER TungNT<tungnt.blue@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install policycoreutils -y
RUN apt-get install nginx -y
RUN apt-get install iputils-ping vim git software-properties-common -y
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install php7.3-fpm -y
RUN apt-get install php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl -y

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /venv

COPY start.sh /venv

RUN chmod a+x /venv/*

ENTRYPOINT ["/venv/start.sh"]

EXPOSE 80