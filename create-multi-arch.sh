#!/bin/bash

#export DOCKER_CLI_EXPERIMENTAL=enabled

podman manifest create quay.io/snehakpersistent/multi-arch-travis:latest \
quay.io/snehakpersistent/multi-arch-travis:x86_64 quay.io/snehakpersistent/multi-arch-travis:ppc64le

podman manifest inspect quay.io/snehakpersistent/multi-arch-travis

podman login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN

podman manifest push quay.io/snehakpersistent/multi-arch-travis:latest