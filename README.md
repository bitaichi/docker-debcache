# Dockerfile for using Nginx as debian package cache server

Inspired by https://www.apalrd.net/posts/2024/cluster_debcache/

## How to build

```shell
make build
```

## How to use

First start the container:

```shell
make run
```

Then replace the server in `/etc/apt/sources.list` or `/etc/apt/sources.list.d/debian.sources`:

```shell
sed -i "s/deb.debian.org/your-ip:3142/g" /etc/apt/sources.list.d/debian.sources
```

When used in podman container:

```shell
sed -i "s/deb.debian.org/host.containers.internal:3142/g" /etc/apt/sources.list.d/debian.sources
```
