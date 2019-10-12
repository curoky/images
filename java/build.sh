#!/usr/bin/env bash
# os: ubuntu:21.04,debian:10
# version: 15.0.2
set -xeuo pipefail

cd "$(dirname $0)" || exit 1

OS=${1-'ubuntu:21.04'}
OS_SHORT=${OS/:/}
JAVA_VERSION=${2-'15.0.2'}
JAVA_MAJOR_VERSION=${JAVA_VERSION%%.*}

docker buildx build . --network=host --file Dockerfile "${@:3}" \
  --build-arg OS=${OS} \
  --build-arg JAVA_VERSION=${JAVA_VERSION} \
  --build-arg JAVA_MAJOR_VERSION=${JAVA_MAJOR_VERSION} \
  --tag curoky/java:${OS_SHORT}-${JAVA_VERSION}
