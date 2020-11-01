FROM adoptopenjdk/openjdk11:ubuntu-jre
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>" version="1.4.1.1" date="01/11/2020"
ENV SBT_VERSION=1.4.1 PATH=/usr/local/sbt/bin:${PATH}

RUN /bin/sh -c "curl -sL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar -xz -C /usr/local" && \
groupadd -r sbt && useradd -r -m -g sbt sbt && mkdir /app && chown -R sbt:sbt /usr/local/sbt

# Use specific user to reduce vulnerabilities
USER sbt
WORKDIR /home/sbt

# For caching jar
RUN /bin/sh -c "sbt sbtVersion"
ENTRYPOINT ["sbt"]