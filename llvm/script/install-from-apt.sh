#!/usr/bin/env bash
set -xeuo pipefail

apt-get update
apt-get install --no-install-recommends -y ca-certificates gnupg2 curl

curl -sSL https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
  echo 'deb http://apt.llvm.org/hirsute/ llvm-toolchain-hirsute-12 main' >>/etc/apt/sources.list

apt-get update
apt-get install --no-install-recommends -y clang-12 lld-12

ln -s /usr/bin/ld.lld-12 /usr/bin/ld.lld
