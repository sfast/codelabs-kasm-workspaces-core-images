#!/bin/bash

ORG_NAME=dooqod

podman build \
    -t ${ORG_NAME}/core-ubuntu:focal \
    --build-arg START_PULSEAUDIO=1 \
    --build-arg BASE_IMAGE="ubuntu:20.04" \
    --build-arg START_XFCE4=1 \
    --build-arg BG_IMG=bg_focal.png \
    -f dockerfile-kasm-core-ubuntu .

# podman push ${ORG_NAME}/core-ubuntu:focal