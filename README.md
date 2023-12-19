# alpine-h2

ㅅㄷㄴㅅ

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
- 23-09-27 : 2.2.224 upgrade
- 22-06-24 : 2.1.214 upgrade
- 22-04-29 : 2.1.212 upgrade
- 22-02-22 : 2.1.210 upgrade
- 21.12.06 : 2.0.202 upgrade

## 도커파일 확인

- [Automated builds](https://hub.docker.com/repository/docker/rkaehdaos/h2)
- [`latest`, `2.2.224` (*2.1.214/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/main/Dockerfile)
- [`2.1.214` (*2.1.214/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/ae47053f0ce4500ab3d0e2722af7184a7a0b7cd5/Dockerfile)
- [`2.1.212` (*2.1.212/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/ba01ab340db8349523997d77929df6c7c97432b3/Dockerfile)
- [`2.1.210` (*2.1.210/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/8194c5672fa6450d6472c22392b4c234f0ca8d63/Dockerfile)
- [`1.4.200` (*1.4.200/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/9045cbe5678ddcf0334a923fccf523191b71dd30/Dockerfile)

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
