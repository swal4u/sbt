FROM dhi.io/eclipse-temurin:21-jdk-debian13-dev AS base
LABEL maintainer="Stéphane Walter <stephane.walter@me.com>" version="1.12.2" date="09/02/2026"

RUN apt-get update && apt-get install pass git gnupg2 zip unzip gzip curl clang llvm gcc -y && \
    curl -s "https://get.sdkman.io?ci=true" | bash && \
    source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install scala 2.13.18 && \
    sdk install sbt

FROM base AS builder
WORKDIR /app 
COPY ./app .
RUN /root/.sdkman/candidates/sbt/current/bin/sbt update && \
    /root/.sdkman/candidates/sbt/current/bin/sbt compile

FROM base
ENV PATH="$PATH:/root/.sdkman/candidates/scala/current/bin:/root/.sdkman/candidates/sbt/current/bin"
COPY --from=builder /root/.cache /root/.cache
COPY --from=builder /root/.sbt /root/.sbt
COPY --from=builder /app/target /app/target
RUN ldconfig
WORKDIR /app
ENTRYPOINT ["/root/.sdkman/candidates/sbt/current/bin/sbt"]
#CMD ["compile"]