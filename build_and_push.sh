#!/bin/bash

ORG_NAME=dooqod

IMAGE_NAME=desktop-ubuntu-x86-64
IMAGE_TAG=focal
BASE_IMAGE=docker.io/dooqod/ospod-ubuntu-x86-64:focal
DOCKERFILE=dockerfile-kasm-core-ubuntu

podman build --authfile="/home/admin/.docker/authfile.json" \
    -t ${ORG_NAME}/${IMAGE_NAME}:${IMAGE_TAG} \
    --build-arg BASE_IMAGE="${BASE_IMAGE}" \
    --build-arg START_XFCE4=1 \
    --build-arg START_PULSEAUDIO=1 \
    --build-arg VNC_SSL_ONLY="" \
    --build-arg BG_IMG=bg_focal.png \
    -f ${DOCKERFILE} .

# podman push ${ORG_NAME}/ospod-ubuntu-x86-64:focal