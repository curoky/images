ARG OS="ubuntu:21.04"
FROM ${OS} as builder

ARG BAZEL_VERSION=4.0.0

COPY ./script /script

RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    curl ca-certificates unzip \
  && bash /script/install-from-prebuilt.sh ${BAZEL_VERSION}

FROM ${OS}

LABEL Author=cccuroky@gmail.com

ARG BAZEL_VERSION

COPY --from=builder /opt/bazel${BAZEL_VERSION} /opt/bazel${BAZEL_VERSION}
