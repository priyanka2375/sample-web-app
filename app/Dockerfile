FROM quay.io/snehakpersistent/tekton-multi-arch:latest

RUN apt-get -y update \
    && apt-get install -y curl sudo

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get install -y apache2

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
    && sed -i 's/:80/:8080/' /etc/apache2/sites-enabled/000-default.conf 

RUN sudo . /etc/apache2/envvars \
    && sudo service apache2 start

RUN sudo mkdir -p /var/run/apache2 \
    && sudo chgrp -R 0 /var/log/apache2 /var/run/apache2 \
    && sudo chmod -R g=u /var/log/apache2 /var/run/apache2

ADD index.html /var/www/html

RUN sudo service apache2 start

EXPOSE 8080

CMD /usr/sbin/apache2ctl -DFOREGROUND
