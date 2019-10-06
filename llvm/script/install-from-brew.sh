#!/usr/bin/env bash
set -xeuo pipefail

LLVM_VERSION=${1-'11.0.1'}
LLVM_MAJOR_VERSION=${LLVM_VERSION%%.*}

brew install llvm@11

cp -rL "$(brew --prefix llvm@11)" /opt/llvm${LLVM_MAJOR_VERSION}
