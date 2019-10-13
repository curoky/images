# Vcpkg docker images

[![dockeri.co](https://dockeri.co/image/curoky/vcpkg)](https://hub.docker.com/r/curoky/vcpkg)

![build image](https://github.com/curoky/vcpkg-docker/workflows/build%20image/badge.svg)

The unofficial Vcpkg docker image, made with love by the vcpkg user.

## How to use this image

Create a Dockerfile

```docker
FROM curoky/vcpkg:ubuntu20.10

ENV PATH=/opt/vcpkg:$PATH

RUN vcpkg install curl
```

### Image tags

- curoky/vcpkg:debian10
- curoky/vcpkg:ubuntu18.04
- curoky/vcpkg:ubuntu20.04
- curoky/vcpkg:ubuntu20.10
