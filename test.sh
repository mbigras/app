#!/bin/bash
# Script test.sh tests that mbigras/app:latest Docker container can start.

set -o errexit

PORT=${PORT:-8080}
container=$(docker run --detach --env=PORT=$PORT --publish=$PORT:$PORT mbigras/app:latest)

trap "docker stop $container" EXIT

while [[ $(docker inspect $container | jq -r '.[].State.Health.Status') != healthy ]]
do
	if [[ $(docker inspect $container | jq -r '.[].State.Health.Status') == unhealthy ]]
	then
		exit 1
	fi
	sleep 1
done

curl --fail http://localhost:$PORT/
