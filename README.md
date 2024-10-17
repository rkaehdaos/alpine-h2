# alpine-h2

[![Build and Push Docker image](https://github.com/rkaehdaos/h2/actions/workflows/build.yml/badge.svg)](https://github.com/rkaehdaos/h2/actions/workflows/build.yml)

- 찾다찾다 내가 짜집기해서 만든 h2 도커 서버
  (I tried to find a simple h2, but I couldn't find it, so I made my own)

## 개요

- only h2database in alpine linux
- minimum size(about 66MB)
- Multiple Arch native image include arm64 which support to Apple silicon
- data location: `/opt/h2-data`
- Github Action build 자동 빌드
  - secret arg : H2_VERSION, H2_RELEASEDATE

## Release Note

- 24-08-11 : 2.3.232 upgrade
- 23-09-27 : 2.2.224 upgrade
- 22-06-24 : 2.1.214 upgrade
- 22-04-29 : 2.1.212 upgrade
- 22-02-22 : 2.1.210 upgrade
- 21.12.06 : 2.0.202 upgrade

## Docker Image

- [Automated builds](https://hub.docker.com/repository/docker/rkaehdaos/h2)

## about running

- pulling image:

```
docker pull rkaehdaos/h2
```

- ex) data_dir volume mapping, TCP DB Port : 1521, Web console port : 81 -> run.sh

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data --name=my-h2
```

- alternative running : Accept DB creation upon connection with additional custom config settings (run2.sh)

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data -e H2_OPTIONS=-ifNotExists --name=my-h2 rkaehdaos/h2
```

- Web Console: `http://localhost:81`

- to watch log:

```
docker logs -f my-h2
```
