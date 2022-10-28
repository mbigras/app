#!/bin/bash
# Script login.sh logs in to Docker Hub.

echo $DOCKERHUB_TOKEN | docker login --username $DOCKERHUB_USERNAME --password-stdin
