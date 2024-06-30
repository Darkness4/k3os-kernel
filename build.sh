#!/bin/sh

set -ex

mkdir -p out/

# Build amd64 kernel
podman run --rm -it \
  -v "$(pwd):/work" \
  -e ARCH=amd64 \
  ghcr.io/darkness4/k3os-kernel:latest-base

mv dist/artifacts/* out/

./scripts/clean

# Build arm64 kernel
podman run --rm -it \
  -v "$(pwd):/work" \
  -e ARCH=arm64 \
  ghcr.io/darkness4/k3os-kernel:latest-base sh -c 'export $(dpkg-architecture -aarm64)
export CROSS_COMPILE=aarch64-linux-gnu-

./scripts/ci
'

mv dist/artifacts/* out/
