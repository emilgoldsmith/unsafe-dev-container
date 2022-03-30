#!/bin/bash

set -euo pipefail

NODE_VERSION=16.14.2
YARN_VERSION=1.22.18
TAG=node-$NODE_VERSION-yarn-$YARN_VERSION-v$1
LATEST_TAG=node-16-latest
REPO=emilgoldsmith/unsafe-dev-container

DOCKER_BUILDKIT=1 docker build -t $REPO:$TAG --build-arg NODE_VERSION=$NODE_VERSION --build-arg YARN_VERSION=$YARN_VERSION .

docker push $REPO:$TAG
docker tag $REPO:$TAG $REPO:$LATEST_TAG
docker push $REPO:$LATEST_TAG
