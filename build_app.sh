#!/bin/bash

ARCH=$(uname -m)

docker build -f ./app/Dockerfile -t quay.io/snehakpersistent/sample-php-app:$ARCH .
docker login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN
docker push quay.io/snehakpersistent/sample-php-app:$ARCH