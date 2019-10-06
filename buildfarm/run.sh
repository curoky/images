#!/usr/bin/env bash
set -xeuo pipefail

docker rm buildfarm_server buildfarm_worker --force

# debug
# docker run --rm --entrypoint /bin/bash -it curoky/buildfarm

docker run --rm -d --network=host --name=buildfarm_server \
  curoky/buildfarm server

docker run --rm -d --network=host --name=buildfarm_worker \
  curoky/buildfarm worker
