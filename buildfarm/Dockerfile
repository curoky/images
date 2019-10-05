ARG OS="ubuntu:21.04"
ARG OS_SHORT="ubuntu21.04"

ARG BASE=curoky/compile:${OS_SHORT}

FROM ${BASE} as builder

ENV PATH=/opt/bazel3.6.0/bin:${PATH}

# install bazel and buildfarm
WORKDIR /opt/buildfarm
RUN curl -sSL https://github.com/bazelbuild/bazel-buildfarm/archive/master.tar.gz \
    | tar xz --strip-components=1 -C /opt/buildfarm \
  && bazel build //src/main/java/build/buildfarm:buildfarm-server_deploy.jar \
  && bazel build //src/main/java/build/buildfarm:buildfarm-operationqueue-worker_deploy.jar

FROM ${BASE}

ENV SERVER_HOST="127.0.0.1"
ENV SERVER_PORT="7854"
ENV WORKER_TASK_SIZE="30"

# Install buildfarm
COPY --chown=1000 --from=builder /opt/buildfarm/bazel-bin/src/main/java/build/buildfarm/buildfarm-server_deploy.jar /opt/buildfarm/server.jar
COPY --chown=1000 --from=builder /opt/buildfarm/bazel-bin/src/main/java/build/buildfarm/buildfarm-operationqueue-worker_deploy.jar /opt/buildfarm/worker.jar

COPY --chown=1000 ./conf /conf
COPY --chown=1000 ./entrypoint.sh /entrypoint.sh

RUN useradd -m -s /bin/bash -u 1000 buildfarm \
  && echo 'buildfarm ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER buildfarm
WORKDIR /opt/buildfarm

ENTRYPOINT [ "/entrypoint.sh" ]
