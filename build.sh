#!/usr/bin/bash
docker buildx build \
    --platform linux/amd64,linux/arm64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 \
        --force-rm=true \
        --no-cache=true \
        -t=rkaehdaos/h2:2.1.212 \
        -t=rkaehdaos/h2:latest \
        --push \
        .
