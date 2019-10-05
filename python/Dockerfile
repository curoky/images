# https://github.com/docker-library/python
# https://www.python.org/ftp/python/

ARG OS="debian:10"
FROM ${OS} AS builder

LABEL Author=cccuroky@gmail.com

ARG PYTHON_VERSION="3.6.1"
ARG PYTHON_MAJOR_VERSION="3"

# extra dependencies (over what buildpack-deps already includes)
RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    curl gcc gcc-multilib make ca-certificates \
    libffi-dev zlib1g-dev libssl-dev \
  && rm -rf /var/lib/apt/lists/*

ENV PATH=/opt/python${PYTHON_VERSION}/bin:$PATH

# install python
RUN mkdir /tmp/python \
  && curl -sSL "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz" \
    | tar xz --strip-components=1 -C /tmp/python \
  && cd /tmp/python \
  && (./configure \
    --prefix=/opt/python${PYTHON_VERSION} \
    --enable-shared \
    --with-system-ffi \
    --enable-ipv6 \
     # https://stackoverflow.com/questions/8010384/pyunicodeucs4-fromencodedobject-error
    --enable-unicode=ucs4 \
    LDFLAGS=-Wl,-rpath=/opt/python${PYTHON_VERSION}/lib \
    || cat config.log) \
  && make all install -j "$(nproc)" \
  && rm -rf /tmp/python \
  && python${PYTHON_MAJOR_VERSION} --version

# install pip (https://bootstrap.pypa.io/get-pip.py)
RUN curl -sSL https://raw.githubusercontent.com/pypa/get-pip/20.3.4/get-pip.py --output /tmp/get-pip.py \
  && python${PYTHON_MAJOR_VERSION} /tmp/get-pip.py --no-cache-dir \
  && rm -rf /tmp/get-pip.py \
  && python${PYTHON_MAJOR_VERSION} -m pip --version

FROM ${OS}

LABEL Author=cccuroky@gmail.com

ARG PYTHON_VERSION

COPY --from=builder /opt/python${PYTHON_VERSION} /opt/python${PYTHON_VERSION}
