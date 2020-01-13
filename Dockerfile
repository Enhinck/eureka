FROM anapsix/alpine-java:8_server-jre_unlimited
MAINTAINER huenbin
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata
COPY target/eureka-service.jar eureka-service.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=docker","eureka-service.jar"]

EXPOSE 8761