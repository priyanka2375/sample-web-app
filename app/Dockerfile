FROM quay.io/snehakpersistent/tekton-multi-arch:latest

RUN apt-get update \
    && apt-get install -y nginx sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN sudo touch /var/log/nginx/error.log \
    && sudo chown -R www-data:www-data /var/log/nginx

ADD index.html /usr/share/nginx/html

EXPOSE 80
CMD ["nginx"]
