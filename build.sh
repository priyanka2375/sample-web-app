#!/bin/bash

ARCH=$(uname -m)

docker build -f ./$ARCH/Dockerfile -t quay.io/snehakpersistent/multi-arch-travis:$ARCH .
docker login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN
docker push quay.io/snehakpersistent/multi-arch-travis:$ARCH