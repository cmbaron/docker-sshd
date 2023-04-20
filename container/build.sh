#!/bin/bash

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

cd "$(dirname "$0")"

DEFAULT_VERSION=$(git describe --exact-match --tags || echo "v0.0.0-$(git log --oneline -n 1 | cut -d" " -f1)")
export BUILD_VERSION="${BUILD_VERSION:-$DEFAULT_VERSION}"

echo "building $BASE_IMAGE"

docker build -t public.ecr.aws/s0y1t3q2/baronos/vscode-remote:$BUILD_VERSION --build-arg BASE_IMAGE=$BASE_IMAGE --build-arg BUILD_OS_VERSION=$BUILD_OS_VERSION . &&
docker tag public.ecr.aws/s0y1t3q2/baronos/vscode-remote:$BUILD_VERSION public.ecr.aws/s0y1t3q2/baronos/vscode-remote:latest

echo $BUILD_VERSION > .latest_version
