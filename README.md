# alpine-h2
찾다찾다 내가 짜집기해서 만든 h2 도커 서버

## 개요
- 알파인 리눅스에 h2database만 똭
- 최소 설치
- 데이터 위치: `/opt/h2-data`

## Release Note
- 22-04-29 : 2.1.212 버전으로 업그레이드
- 22-02-22 : 2.1.210 버전으로 업그레이드
- 21.12.06 : 2.0.202 버전으로 업그레이드
- BuildX를 통해 이제 댜른 OS/ARCH에서도 해당하는 이미지가 다운로드 됩니다
- <img width="347" alt="image" src="https://user-images.githubusercontent.com/13996827/145544874-c9a9edac-ea6f-417c-97ae-e6202997a071.png">


## 도커파일 확인

- [Automated builds](https://hub.docker.com/repository/docker/rkaehdaos/h2) 
- [`latest`, `2.1.212` (*2.1.212/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/main/Dockerfile)
- [`2.1.210` (*2.1.210/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/8194c5672fa6450d6472c22392b4c234f0ca8d63/Dockerfile)
- [`1.4.200` (*1.4.200/Dockerfile*)](https://github.com/rkaehdaos/h2/blob/9045cbe5678ddcf0334a923fccf523191b71dd30/Dockerfile)


## 실행

이미지 받기:

```
docker pull rkaehdaos/h2
```

호스트의 data_dir과 매핑해서 포트 1521 (TCP DB 서버), 81 (웹콘솔) 노출해서 사용(run.sh)

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data --name=my-h2 
```

다른 방법 : 추가 커스텀 config 설정으로 연결시 DB 생성을 수락합니다 (run2.sh)

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data -e H2_OPTIONS=-ifNotExists --name=my-h2 rkaehdaos/h2
```

- 웹콘솔: http://localhost:81

로그 보기:

```
docker logs -f my-h2
```
