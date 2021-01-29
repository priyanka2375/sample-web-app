#!/bin/bash

ARCH=$(uname -m)

sudo podman build --no-cache -f ./$ARCH/Dockerfile -t quay.io/snehakpersistent/multi-arch-image:$ARCH . --format docker
sudo podman login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN
sudo podman push quay.io/snehakpersistent/multi-arch-image:$ARCH
