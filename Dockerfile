FROM openjdk:8

LABEL maintainer="Stéphane Walter <stephane.walter@me.com>"
LABEL REFRESHED_AT="2019-07-30"
LABEL version="SBT with scala 2.11.8"

# We will be running our Spark jobs as `root` user.
USER root

# Working directory is set to the home folder of `vagrant` user.
WORKDIR /root/

# Scala related variables.
ARG SCALA_VERSION=2.11.8
ARG SCALA_BINARY_ARCHIVE_NAME=scala-${SCALA_VERSION}
ARG SCALA_BINARY_DOWNLOAD_URL=http://downloads.lightbend.com/scala/${SCALA_VERSION}/${SCALA_BINARY_ARCHIVE_NAME}.tgz

# SBT related variables.
ARG SBT_VERSION=0.13.17
ARG SBT_BINARY_ARCHIVE_NAME=sbt-$SBT_VERSION
ARG SBT_BINARY_DOWNLOAD_URL=https://piccolo.link/${SBT_BINARY_ARCHIVE_NAME}.tgz

# Configure env variables for Scala, SBT and Spark.
# Also configure PATH env variable to include binary folders of Java, Scala, SBT and Spark.
ENV SCALA_HOME  /usr/local/scala
ENV SBT_HOME    /usr/local/sbt
ENV PATH        $JAVA_HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$PATH

# Download, uncompress and move all the required packages and libraries to their corresponding directories in /usr/local/ folder.
RUN wget -qO - ${SCALA_BINARY_DOWNLOAD_URL} | tar -xz -C /usr/local/ && \
    wget -qO - ${SBT_BINARY_DOWNLOAD_URL} | tar -xz -C /usr/local/  && \
    cd /usr/local/ && \
    ln -s ${SCALA_BINARY_ARCHIVE_NAME} scala

# Declare volumes 
VOLUME ["/root/.sbt"]
VOLUME ["/root/.ivy2"]