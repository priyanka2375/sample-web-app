#!/bin/bash

ARCH=$(uname -m)

podman build -f ./app/Dockerfile -t quay.io/snehakpersistent/sample-php-app:$ARCH .
podman login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN
podman push quay.io/snehakpersistent/sample-php-app:$ARCH