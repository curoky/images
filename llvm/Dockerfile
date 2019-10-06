ARG OS="ubuntu:21.04"
FROM ${OS} as builder

ARG LLVM_VERSION=11.0.1
ARG LLVM_MAJOR_VERSION=11

COPY ./script /script

RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    curl ca-certificates xz-utils \
  && bash /script/install-from-prebuilt.sh ${LLVM_VERSION} \
  && rm -rf /var/lib/apt/lists/*

FROM ${OS}

LABEL Author=cccuroky@gmail.com

ARG LLVM_MAJOR_VERSION

COPY --from=builder /opt/llvm${LLVM_MAJOR_VERSION} /opt/llvm${LLVM_MAJOR_VERSION}
