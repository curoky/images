# https://hub.docker.com/r/linuxbrew/linuxbrew/dockerfile
# https://github.com/Homebrew/brew/blob/master/Dockerfile
# https://github.com/Linuxbrew/docker/blob/master/bionic/Dockerfile
# https://github.com/Linuxbrew/docker/blob/master/debian10/Dockerfile
# https://discourse.brew.sh/t/why-do-bottles-need-to-be-in-home-linuxbrew-linuxbrew/4346

ARG OS="ubuntu:21.04"
FROM ${OS}

LABEL Author=cccuroky@gmail.com

ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
  HOMEBREW_NO_ANALYTICS=1 \
  HOMEBREW_NO_AUTO_UPDATE=1

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
    curl git file g++ locales make ca-certificates uuid-runtime \
	&& rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -f UTF-8 en_US.UTF-8 \
  && useradd -m -s /bin/bash linuxbrew \
  && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

WORKDIR /home/linuxbrew
RUN git clone --depth=1 https://github.com/Homebrew/brew \
    /home/linuxbrew/.linuxbrew/Homebrew \
  && mkdir /home/linuxbrew/.linuxbrew/bin \
  && ln -s ../Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/ \
  && brew install-bundler-gems \
  && brew tap homebrew/core \
  && brew tap curoky/tap \
  && brew cleanup \
  && rm -rf ~/.cache \
  && chown -R linuxbrew: /home/linuxbrew/.linuxbrew \
  && chmod -R g+w,o-w /home/linuxbrew/.linuxbrew
