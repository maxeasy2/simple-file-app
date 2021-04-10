FROM openjdk:11-jdk-slim
MAINTAINER maxeasy2@naver.com

RUN mkdir -p /webapp
RUN chmod 777 /webapp
#RUN mkdir -p /webapp/log
#RUN mkdir -p /webapp/file

#alpine
#RUN apk add --no-cache bash
#RUN apk add curl
#RUN apk add vim
#RUN apk add busybox-extras

COPY "target/simple-file.jar" "/webapp/simple-file.jar"
COPY "startup.sh" "/webapp/startup.sh"

ENTRYPOINT [ "/bin/bash", "/webapp/startup.sh" ]

