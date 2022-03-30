#!/bin/bash

set -euo pipefail

TAG=node-12-v$1

DOCKER_BUILDKIT=1 docker build -t emilgoldsmith/unsafe-dev-container:$TAG --build-arg NODE_VERSION=12.22.1 --build-arg YARN_VERSION=1.22.5 .

docker push emilgoldsmith/unsafe-dev-container:$TAG
