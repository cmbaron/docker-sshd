#!/bin/sh

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

cd "$(dirname "$0")"

export BUILD_VERSION="${BUILD_VERSION:-$(cat .latest_version)}"
echo $BUILD_VERSION

docker push public.ecr.aws/s0y1t3q2/baronos/vscode-remote:$BUILD_VERSION &&
docker push public.ecr.aws/s0y1t3q2/baronos/vscode-remote:latest
