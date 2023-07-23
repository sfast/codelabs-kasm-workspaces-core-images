#!/bin/bash

ORG_NAME=dooqod

IMAGE_NAME=ospod-desk-oracle-ubuntu-x86-64
IMAGE_TAG=8
BASE_IMAGE=docker.io/dooqod/ospod-oraclelinux-x86-64:8
DOCKERFILE=dockerfile-kasm-core-oracle

podman build --no-cache --squash --force-rm --authfile="/home/admin/.docker/authfile.json" \
    -t ${ORG_NAME}/${IMAGE_NAME}:${IMAGE_TAG} \
    --build-arg BASE_IMAGE="${BASE_IMAGE}" \
    --build-arg START_XFCE4=1 \
    --build-arg START_PULSEAUDIO=1 \
    --build-arg VNC_SSL_ONLY="-sslOnly" \
    --build-arg BG_IMG=bg_focal.png \
    -f ${DOCKERFILE} .

# podman push ${ORG_NAME}/ospod-ubuntu-x86-64:focal

# podman push --authfile="/home/admin/.docker/authfile.json" dooqod/ospod-desktop-ubuntu-x86-64:focal docker.io/dooqod/ospod-desktop-ubuntu-x86-64:focal


podman push --authfile="/home/admin/.docker/authfile.json" localhost/dooqod/ospod-desk-oracle-ubuntu-x86-64:8 docker.io/dooqod/ospod-desk-oracle-ubuntu-x86-64:8