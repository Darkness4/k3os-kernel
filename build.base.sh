#!/bin/sh

# Base is used from cross-compilation

podman build \
  -t ghcr.io/darkness4/k3os-kernel:latest-base \
  -f Dockerfile.base .
