FROM openjdk:jre-alpine

LABEL name ="GeunChang Ahn"
LABEL email = "rkaehdaos@gmail.com"
LABEL version = "${{ secrets.H2VERSION }}"
LABEL description = "${{ secrets.H2VERSION }} upgrade"

ENV DOWNLOAD "https://github.com/h2database/h2database/releases/download/version-${{ secrets.H2VERSION }}/h2-${{ secrets.H2RELEASEDATE }}.zip"
ENV DOWNLOAD "https://github.com/h2database/h2database/releases/download/version-${{ secrets.H2VERSION }}/h2-2022-06-13.zip"

ENV DATA_DIR /opt/h2-data

RUN apk add --no-cache wget

RUN mkdir -p ${DATA_DIR} \
    && wget -O h2.zip ${DOWNLOAD} \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip

COPY h2.server.properties /root/.h2.server.properties

EXPOSE 81 1521

WORKDIR /opt/h2-data

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR} ${H2_OPTIONS}
