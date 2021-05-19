FROM adoptopenjdk/openjdk8:ubuntu-jre
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>" version="1.5.2.1" date="19/05/2021"
ENV SBT_VERSION=1.5.2 PATH=/usr/local/sbt/bin:${PATH}

USER root

RUN /bin/sh -c "curl -sL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar -xz -C /usr/local" 

# User

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

# Define working directory
WORKDIR /home/user

# For caching jar
RUN /bin/sh -c "sbt sbtVersion"
VOLUME [ "/home/user/.cache"]
ENTRYPOINT ["sbt"]

# Then you just have to build the container with this command
# docker build -t sbt:v1.5.2.1 --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .