#!/bin/bash
# Script push.sh pushes mbigras/app Docker image to Docker Hub.

tag=$(git rev-parse --short HEAD)

docker push mbigras/app:$tag mbigras/app:latest
