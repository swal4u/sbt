FROM openjdk:8-jdk-alpine
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>"
LABEL version="0.13.17"
LABEL date="21/01/2020"

ENV SBT_VERSION=1.3.7
ENV SBT_HOME=/usr/local/sbt
ENV PATH=${SBT_HOME}/bin:${PATH}

RUN apk add --update --no-cache curl ca-certificates bash && apk add gcompat libc6-compat
RUN curl -sL /tmp/sbt-${SBT_VERSION}.tgz "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | \
    gunzip | tar -x -C /usr/local && \
    sbt sbtVersion

CMD [ "sbt","package" ]
WORKDIR /root
