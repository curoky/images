ARG OS="ubuntu:21.04"
FROM ${OS} as builder

ARG JAVA_VERSION=15.0.2
ARG JAVA_MAJOR_VERSION=11

COPY ./script /script

RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    curl ca-certificates xz-utils \
  && bash /script/install-from-prebuilt.sh ${JAVA_VERSION} \
  && rm -rf /var/lib/apt/lists/*

FROM ${OS}

LABEL Author=cccuroky@gmail.com

ARG JAVA_MAJOR_VERSION

COPY --from=builder /opt/java${JAVA_MAJOR_VERSION} /opt/java${JAVA_MAJOR_VERSION}
