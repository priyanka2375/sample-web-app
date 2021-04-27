FROM quay.io/snehakpersistent/tekton-multi-arch:latest

RUN apt-get -y update \
    && apt-get install -y curl

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get install -y apache2

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
    && sed -i 's/:80/:8080/' /etc/apache2/sites-enabled/000-default.conf 

RUN groupadd --gid 5000 apacheuser \
    && useradd --home-dir /home/apacheuser --create-home --uid 5000 \
        --gid 5000 --shell /bin/sh --skel /dev/null apacheuser

RUN chown -R apacheuser /var/run \
    && mkdir -p /var/run/apache2 \
    && chown -R apacheuser /var/log/apache2 /var/run/apache2

ADD index.html /var/www/html

RUN service apache2 start

EXPOSE 8080

CMD /usr/sbin/apache2ctl -DFOREGROUND

USER apacheuser
