FROM azul/zulu-openjdk-alpine:11
MAINTAINER maxeasy2@naver.com

RUN mkdir -p /webapp/log
RUN mkdir -p /webapp/file
RUN apk add --no-cache bash
RUN apk add curl
RUN apk add vim

COPY "target/simple-file.jar" "/webapp/simple-file.jar"
COPY "startup.sh" "/webapp/startup.sh"

ENTRYPOINT [ "/bin/bash", "/webapp/startup.sh" ]
