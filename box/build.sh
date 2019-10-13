#!/usr/bin/env bash
# os: debian:10
set -xeuo pipefail
cd "$(dirname $0)" || exit 1

OS=${1-'debian:10'}
OS_SHORT=${OS/:/}

docker buildx build . --network=host --file Dockerfile "${@:2}" \
  --build-arg OS=${OS} \
  --build-arg OS_SHORT=${OS_SHORT} \
  --tag curoky/box:${OS_SHORT}
