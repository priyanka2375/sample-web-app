#!/bin/bash

ARCH=$(uname -m)

sudo podman pull quay.io/snehakpersistent/multi-arch-image:latest
sudo podman rmi $(sudo podman images -f "dangling=true" -q)
sudo podman build -f ./app/Dockerfile -t quay.io/snehakpersistent/sample-php-app:$ARCH .
sudo podman login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN
sudo podman push quay.io/snehakpersistent/sample-php-app:$ARCH
