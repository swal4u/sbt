FROM openjdk:8-jdk-alpine
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>"
LABEL version="1.3.7"
LABEL date="18/04/2020"

ENV SBT_VERSION=1.3.7
ENV SBT_HOME=/usr/local/sbt
ENV PATH=${SBT_HOME}/bin:${PATH}

# Installation with root user

RUN apk add --update --no-cache curl ca-certificates bash && apk add gcompat libc6-compat
RUN curl -sL /tmp/sbt-${SBT_VERSION}.tgz "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | \
    gunzip | tar -x -C /usr/local && \
    mkdir /app

# Change default directory for cache 
COPY sbtops /usr/local/sbt/conf/

# Change default user (use the same uid of user on host)
ARG USER_ID
ARG GROUP_ID
ENV USER=docker

RUN addgroup --gid $GROUP_ID ${USER}
RUN adduser --disabled-password --gecos '' --uid $USER_ID --ingroup ${USER} ${USER}
USER ${USER}

CMD [ "sbt","package" ]

# Volumes for caching
VOLUME [ "/var/.sbt/boot" ]
VOLUME [ "/var/.ivy2" ]