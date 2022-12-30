#!/bin/bash
# Script test.sh tests that mbigras/app:latest Docker container can start—for explanation about Bash retry function, see https://news.ycombinator.com/item?id=34161661.

set -o errexit

PORT=${PORT:-8080}
container=$(docker run --detach --rm --env=PORT=$PORT --publish=$PORT:$PORT mbigras/app:latest)

trap "docker stop $container" EXIT

# For explanation about Bash retry function, see https://news.ycombinator.com/item?id=34161661.
function retry {
	local retries=$1
	shift

	local count=0
	until "$@"
	do
		exit=$?
		wait=$((2 ** $count))
		count=$(($count + 1))
		if [ $count -lt $retries ]
		then
			echo "Retry $count/$retries exited $exit, retrying in $wait seconds..."
			sleep $wait
		else
			echo "Retry $count/$retries exited $exit, no more retries left."
			return $exit
		fi
	done
	return 0
}

retry 10 curl --fail http://localhost:$PORT/
