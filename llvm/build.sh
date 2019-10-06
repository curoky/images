#!/usr/bin/env bash
# os: ubuntu:21.04,debian:10
# version: 11.0.1

set -xeuo pipefail

cd "$(dirname $0)" || exit 1

OS=${1-'ubuntu:21.04'}
OS_SHORT=${OS/:/}
LLVM_VERSION=${2-'11.0.1'}
LLVM_MAJOR_VERSION=${LLVM_VERSION%%.*}

docker buildx build . --network=host --file Dockerfile "${@:3}" \
  --build-arg OS=${OS} \
  --build-arg LLVM_VERSION=${LLVM_VERSION} \
  --build-arg LLVM_MAJOR_VERSION=${LLVM_MAJOR_VERSION} \
  --tag curoky/llvm:${OS_SHORT}-${LLVM_VERSION}
