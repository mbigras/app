#!/bin/bash
# Script deploy.sh deploys your app to Fly.io.

if [[ -z $APP || -z $TAG || -z $ENV ]]
then
	echo "deploy.sh: error: APP, TAG, and ENV environment variables are required." 1>&2
	exit 1
fi

echo Deploying $APP:$TAG to $ENV.
