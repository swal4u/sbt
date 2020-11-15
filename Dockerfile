FROM adoptopenjdk/openjdk8:ubuntu-jre
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>" version="1.4.1.1" date="15/11/2020"
ENV SBT_VERSION=1.4.1 PATH=/usr/local/sbt/bin:${PATH}

RUN /bin/sh -c "curl -sL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar -xz -C /usr/local"

# For caching jar
WORKDIR /root
RUN /bin/sh -c "sbt -Dsbt.rootdir=true sbtVersion"

VOLUME [ "/root/.cache"]
ENTRYPOINT ["sbt","-Dsbt.rootdir=true"]