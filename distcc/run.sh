#!/usr/bin/env bash

set -xeuo pipefail

docker run -d --network=host \
  --restart unless-stopped \
  --shm-size=36g \
  --name distccd curoky/distcc
