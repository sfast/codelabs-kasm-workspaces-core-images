#!/bin/bash

ORG_NAME=dooqod

IMAGE_NAME=ospod-desktop-ubuntu-x86-64
IMAGE_TAG=bionic
BASE_IMAGE=docker.io/dooqod/ospod-ubuntu-x86-64:bionic
DOCKERFILE="../dockerfile-kasm-core-ubuntu"

podman build --no-cache --squash --force-rm --authfile="/home/admin/.docker/authfile.json" \
    -t ${ORG_NAME}/${IMAGE_NAME}:${IMAGE_TAG} \
    --build-arg BASE_IMAGE="${BASE_IMAGE}" \
    --build-arg START_XFCE4=1 \
    --build-arg START_PULSEAUDIO=1 \
    --build-arg VNC_SSL_ONLY="-sslOnly" \
    --build-arg BG_IMG=bg_bionic.png \
    -f ${DOCKERFILE} .

podman push --authfile="/home/admin/.docker/authfile.json" localhost/dooqod/ospod-desktop-ubuntu-x86-64:bionic docker.io/dooqod/ospod-desktop-ubuntu-x86-64:bionic