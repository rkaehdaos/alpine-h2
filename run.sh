#!/usr/bin/env bash
docker run -d \
       -v $PWD/h2-data:/opt/h2-data \
       -p 1521:1521 -p 81:81 --name=my-h2 \
       rkaehdaos/h2
docker logs -f my-h2 2>&1
