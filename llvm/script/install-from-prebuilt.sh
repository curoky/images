#!/usr/bin/env bash
set -xeuo pipefail

LLVM_VERSION=${1-'11.0.1'}
LLVM_MAJOR_VERSION=${LLVM_VERSION%%.*}

URL=https://github.com/llvm/llvm-project/releases/download/llvmorg-${LLVM_VERSION}/clang+llvm-${LLVM_VERSION}-x86_64-linux-gnu-ubuntu-20.10.tar.xz

mkdir -p /opt/llvm${LLVM_MAJOR_VERSION}
curl -sSL ${URL} | tar -xJv -C /opt/llvm${LLVM_MAJOR_VERSION} --strip-components 1
