#!/bin/bash

ARCH=$(uname -m)

podman build -f ./$ARCH/Dockerfile -t quay.io/snehakpersistent/multi-arch-travis:$ARCH .
podman login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN
podman push quay.io/snehakpersistent/multi-arch-travis:$ARCH