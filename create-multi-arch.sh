#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create quay.io/snehakpersistent/multi-arch-travis:latest \
quay.io/snehakpersistent/multi-arch-travis:x86_64 quay.io/snehakpersistent/multi-arch-travis:ppc64le

docker manifest inspect quay.io/snehakpersistent/multi-arch-travis

docker login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN

docker manifest push quay.io/snehakpersistent/multi-arch-travis:latest