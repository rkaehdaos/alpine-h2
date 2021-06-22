# alpine-h2
찾다찾다 내가 짜집기해서 만든 h2 도커 서버


## 개요
- 알파인 리눅스에 h2만 똭
- 최소 설치
- 데이터 위치: `/opt/h2-data`

## 도커파일 확인

- [Automated builds](https://hub.docker.com/repository/docker/rkaehdaos/h2) 

- [`latest`, `1.4.200` (*1.4.200/Dockerfile*)]()


## 실행

이미지 받기:

```
docker pull rkaehdaos/h2
```

호스트의 data_dir과 매핑해서 포트 1521 (TCP DB 서버), 81 (웹콘솔) 노출해서 사용:

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data --name=my-h2 
```

추가 커스텀 config 설정으로 연결시 DB 생성을 수락합니다 (기본 값)

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data -e H2_OPTIONS=-ifNotExists --name=my-h2 rkaehdaos/h2
```

- 웹콘솔: http://localhost:81

로그 보기:

```
docker logs -f my-h2
```
