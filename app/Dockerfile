FROM quay.io/snehakpersistent/tekton-multi-arch:latest

RUN apt-get -y update 

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get install -y apache2 sudo

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i 's/Listen 80/Listen 8081/' /etc/apache2/ports.conf \
    && sed -i 's/:80/:8081/' /etc/apache2/sites-enabled/000-default.conf \
    && sudo mkdir -p /var/run/apache2

ADD index.html /var/www/html

RUN service apache2 start

EXPOSE 8081

CMD /usr/sbin/apache2ctl -DFOREGROUND
