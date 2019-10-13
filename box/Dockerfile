# https://github.com/docker-library/python
# https://www.python.org/ftp/python/

ARG OS="debian:10"
ARG OS_SHORT="debian10"

# select python version
FROM curoky/python:${OS_SHORT}-3.6.12 AS python3.6

FROM curoky/compile:${OS_SHORT} as builder

RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    wget gcc-multilib ssh vim less \
    libffi-dev zlib1g-dev libssl-dev libevent-dev \
  && rm -rf /var/lib/apt/lists/*

# setup python
COPY --from=python3.6 /opt/python3.6.12 /opt/python3.6.12

RUN ln -sf /opt/python3.6.12/bin/* /usr/bin/ \
  && ln -sf /opt/python3.9.1/bin/* /usr/bin/ \
  && ln -sf /opt/python2.7.18/bin/* /usr/bin/
