#!/bin/bash
# Script push.sh pushes mbigras/app Docker image to Docker Hub.

tag=$(git rev-parse HEAD)

docker push mbigras/app:$tag
docker push mbigras/app:latest
