ARG OS="ubuntu:20.04"
FROM ${OS}

LABEL Author=cccuroky@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    g++ git curl zip unzip tar make pkg-config ca-certificates \
  && rm -rf /var/lib/apt/lists/*

ENV PATH=/opt/vcpkg:$PATH

# Note: we can use `-useSystemBinaries`.
RUN git clone --depth=1 https://github.com/microsoft/vcpkg /opt/vcpkg \
  && bootstrap-vcpkg.sh -disableMetrics \
  && vcpkg integrate install
