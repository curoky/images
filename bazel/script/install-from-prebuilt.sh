#!/usr/bin/env bash
set -xeuo pipefail

BAZEL_VERSION=${1-'4.0.0'}
URL=https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh

curl -sSL ${URL} -o bazel.sh && bash bazel.sh --prefix=/opt/bazel${BAZEL_VERSION}
