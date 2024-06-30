#!/bin/sh

mkdir -p out

# Build amd64 kernel
podman run --rm -it \
  -v "$(pwd):/work" \
  ghcr.io/darkness4/k3os-kernel:latest-base

# Build arm64 kernel
podman run --rm -it \
  -v "$(pwd):/work" \
  ghcr.io/darkness4/k3os-kernel:latest-base sh -c 'export $(dpkg-architecture -aarm64)
export CROSS_COMPILE=aarch64-linux-gnu-

bash
'
