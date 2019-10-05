#!/usr/bin/env bash
# os: ubuntu:21.04,debian:10
# version: 3.6.0,4.0.0
set -xeuo pipefail
cd "$(dirname $0)" || exit 1

OS=${1-'ubuntu:21.04'}
OS_SHORT=${OS/:/}
BAZEL_VERSION=${2-'4.0.0'}

docker buildx build . --network=host --file Dockerfile "${@:3}" \
  --build-arg OS=${OS} \
  --build-arg BAZEL_VERSION=${BAZEL_VERSION} \
  --tag curoky/bazel:${OS_SHORT}-${BAZEL_VERSION}
