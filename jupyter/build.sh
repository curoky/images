#!/usr/bin/env bash
set -xeuo pipefail
cd "$(dirname $0)" || exit 1

docker buildx build . --network=host --file Dockerfile "${@:1}" \
  --tag curoky/jupyter
