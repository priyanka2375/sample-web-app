#!/bin/bash

#export DOCKER_CLI_EXPERIMENTAL=enabled
# Delete manifest if it already exists
manifestcheck=0
sudo podman image inspect quay.io/snehakpersistent/multi-arch-image:latest || manifestcheck=$?
if [[ $manifestcheck == 0 ]]; then 
    sudo podman rmi quay.io/snehakpersistent/multi-arch-image:latest
fi
sudo podman pull quay.io/snehakpersistent/multi-arch-image:x86_64 
sudo podman pull quay.io/snehakpersistent/multi-arch-image:ppc64le
sudo podman manifest create --all quay.io/snehakpersistent/multi-arch-image:latest docker://quay.io/snehakpersistent/multi-arch-image:x86_64 docker://quay.io/snehakpersistent/multi-arch-image:ppc64le

sudo podman manifest inspect quay.io/snehakpersistent/multi-arch-image

sudo podman login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN

sudo podman manifest push --all quay.io/snehakpersistent/multi-arch-image:latest docker://quay.io/snehakpersistent/multi-arch-image:latest --format v2s2
