#!/usr/bin/env bash
# os: debian:10,ubuntu:21.04
# version: 2.7.18,3.6.12,3.9.1
set -xeuo pipefail
cd "$(dirname $0)" || exit 1

OS=${1-'ubuntu:21.04'}
OS_SHORT=${OS/:/}
PYTHON_VERSION=${2-'3.6.12'}
PYTHON_MAJOR_VERSION=${PYTHON_VERSION%%.*}

docker buildx build . --network=host --file Dockerfile "${@:3}" \
  --build-arg OS=${OS} \
  --build-arg PYTHON_VERSION=${PYTHON_VERSION} \
  --build-arg PYTHON_MAJOR_VERSION=${PYTHON_MAJOR_VERSION} \
  --tag curoky/python:${OS_SHORT}-${PYTHON_VERSION}
