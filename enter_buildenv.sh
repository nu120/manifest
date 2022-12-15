#!/bin/sh

docker pull ghcr.io/nu120/buildroot

docker run -it --rm \
    -v $PWD:/opt/buildroot \
    -w /opt/buildroot \
    ghcr.io/nu120/buildroot
