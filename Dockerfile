FROM adoptopenjdk/openjdk8:ubuntu-jre
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>" version="1.3.7.5" date="22/11/2020"
ENV SBT_VERSION=1.3.7 PATH=/usr/local/sbt/bin:${PATH}

RUN /bin/sh -c "curl -sL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar -xz -C /usr/local" 

# For caching jar
RUN /bin/sh -c "sbt sbtVersion"
VOLUME [ "/root/.cache"]
ENTRYPOINT ["sbt"]