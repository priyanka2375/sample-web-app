FROM quay.io/snehakpersistent/tekton-multi-arch:latest

RUN apt-get -y update \
    && apt-get install -y curl

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get install -y apache2
RUN whoami
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
    && sed -i 's/VirtualHost *:80/VirtualHost *:8080/' /etc/apache2/sites-enabled/000-default.conf 

RUN service apache2 start

RUN apt-get install -y php  php-common php-fpm libapache2-mod-php

ADD index.php /var/www/html

RUN mkdir /run/php-fpm \
    && chgrp -R 0 /var/run/apache2 /run/php-fpm \
    && chmod -R g=u /var/run/apache2 /run/php-fpm \
    && php -v \
    && service apache2 start

EXPOSE 8080

CMD /usr/sbin/apache2ctl -DFOREGROUND

