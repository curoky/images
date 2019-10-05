#!/usr/bin/env bash
# os: debian:9,debian:10,ubuntu:18.04,ubuntu:20.04,ubuntu:21.04
# Note: in debian:8, ubuntu16.04 gcc to old
set -xeuo pipefail
cd "$(dirname $0)" || exit 1

OS=${1-debian:9}
OS_SHORT=${OS/:/}

docker buildx build . --network=host --file Dockerfile "${@:2}" \
  --build-arg OS=${OS} \
  --tag curoky/vcpkg:${OS_SHORT}
