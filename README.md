# Dockerfile for using Nginx as debian package cache server

Inspired by https://www.apalrd.net/posts/2024/cluster_debcache/

## Usage

Use podman as docker engine to start the container:

```shell
export CACHE_DIR="$HOME"/container/.cache/debcache
export CONTAINER_TAG=ghcr.io/bitaichi/docker-debcache:main
make prune run
```

Then replace the server in `/etc/apt/sources.list` or `/etc/apt/sources.list.d/debian.sources`:

```shell
sed -i "s/deb.debian.org/<your-ip>:3142/g" /etc/apt/sources.list.d/debian.sources
```

When used in podman container:

```shell
sed -i "s/deb.debian.org/host.containers.internal:3142/g" /etc/apt/sources.list.d/debian.sources
```

## Local build & use

podman is required, currently docker not supported.

To build the image

```shell
make build
```

To start the container:

```shell
make run
```
