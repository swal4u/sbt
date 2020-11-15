FROM adoptopenjdk/openjdk8:ubuntu-jre
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>" version="1.4.1.1" date="15/11/2020"
ENV SBT_VERSION=1.4.1 PATH=/usr/local/sbt/bin:${PATH}

RUN /bin/sh -c "curl -sL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar -xz -C /usr/local"
#groupadd -r sbt && useradd -r -m -g sbt sbt && \
#mkdir /app && chown -R sbt:sbt /usr/local/sbt && chown -R sbt:sbt /app

# Use specific user to reduce vulnerabilities
#USER sbt
#WORKDIR /home/sbt

WORKDIR /app

# For caching jar
RUN /bin/sh -c "sbt sbtVersion"


VOLUME [ "/root/.cache"]
ENTRYPOINT ["sbt"]