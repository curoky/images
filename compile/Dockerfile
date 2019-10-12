ARG OS="ubuntu:21.04"
ARG OS_SHORT="ubuntu21.04"

FROM curoky/python:${OS_SHORT}-2.7.18 AS python2.7
FROM curoky/python:${OS_SHORT}-3.9.1 AS python3.9
FROM curoky/llvm:${OS_SHORT}-11.0.1 AS llvm11
FROM curoky/homebrew:${OS_SHORT} AS homebrew
FROM curoky/java:${OS_SHORT}-15.0.2 AS java15
FROM curoky/bazel:${OS_SHORT}-3.6.0 AS bazel3.6.0
FROM curoky/bazel:${OS_SHORT}-4.0.0 AS bazel4.0.0

FROM ${OS}

LABEL Author=cccuroky@gmail.com

ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
  HOMEBREW_NO_ANALYTICS=1 \
  HOMEBREW_NO_AUTO_UPDATE=1 \
  DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    gcc g++ \
    ncdu sudo curl git unzip ca-certificates make cmake ninja-build \
    vim \
    # (envsubst): need by snappy
    gettext \
    # need by proxygen
    gperf \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install llvm
COPY --from=llvm11 /opt/llvm11 /opt/llvm11
RUN ln -s /opt/llvm11/bin/* /usr/bin/

# Install python
COPY --from=python2.7 /opt/python2.7.18 /opt/python2.7.18
COPY --from=python3.9 /opt/python3.9.1 /opt/python3.9.1
RUN ln -sf /opt/2.7.18/bin/* /usr/bin/ \
  && ln -sf /opt/python3.9.1/bin/* /usr/bin/ \
  && ln -sf /usr/bin/python3 /usr/bin/python

# Install java
COPY --from=java15 /opt/java15 /opt/java15
RUN ln -sf /opt/java15/bin/* /usr/bin/

# Install homebrew
COPY --from=homebrew /home/linuxbrew /home/linuxbrew

# Install bazel
COPY --from=bazel3.6.0 /opt/bazel3.6.0 /opt/bazel3.6.0
COPY --from=bazel4.0.0 /opt/bazel4.0.0 /opt/bazel4.0.0
RUN ln -s /opt/bazel4.0.0/bin/* /usr/bin/
