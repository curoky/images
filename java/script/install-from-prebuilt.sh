#!/usr/bin/env bash
set -xeuo pipefail

JAVA_VERSION=${1-'15.0.2'}
JAVA_MAJOR_VERSION=${JAVA_VERSION%%.*}

URL=https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz

mkdir -p /opt/java${JAVA_MAJOR_VERSION}
curl -sSL ${URL} | tar -xzv -C /opt/java${JAVA_MAJOR_VERSION} --strip-components 1
