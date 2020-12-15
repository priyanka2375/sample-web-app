#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create quay.io/snehakpersistent/multi-arch-image:latest \
quay.io/snehakpersistent/multi-arch-image:x86_64 quay.io/snehakpersistent/multi-arch-image:ppc64le

docker manifest inspect quay.io/snehakpersistent/multi-arch-image

docker login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN

docker manifest push quay.io/snehakpersistent/multi-arch-image:latest