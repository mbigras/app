#!/bin/bash
# Script build.sh builds mbigras/app Docker image—passing in environment variables.

tag=$(git rev-parse --short HEAD)

docker build \
	--build-arg APP=app \
	--build-arg ENV=prod \
	--build-arg VERSION=$tag \
	--tag mbigras/app:$tag \
	.

docker tag mbigras/app:$tag mbigras/app:latest
