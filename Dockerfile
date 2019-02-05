FROM openjdk:jre-alpine
WORKDIR /workspace
ARG VERSION=1.0.0
ADD target/hystrix-dashboard-$VERSION.jar /workspace/hystrix-dashboard.jar
COPY /starter.sh /workspace/starter.sh
EXPOSE 7979 7980
RUN apk add curl
RUN apk add --update --no-cache netcat-openbsd
RUN ["chmod", "+x", "/workspace/starter.sh"]
ENTRYPOINT ["sh","/workspace/starter.sh"]