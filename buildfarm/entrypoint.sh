#!/usr/bin/env bash
set -xeuo pipefail

envsubst </conf/worker.conf | tee /conf/worker.conf >/dev/null
envsubst </conf/server.conf | tee /conf/server.conf >/dev/null

type=${1-server}

/usr/bin/java -jar ./${type}.jar /conf/${type}.conf "${@:2}"
