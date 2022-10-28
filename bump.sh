#!/bin/bash
# Script bump.sh sets your Docker image tag in your Fly.io configuration file.

if [[ -z $APP || -z $TAG || -z $ENV ]]
then
	echo "bump.sh: error: APP, TAG, and ENV environment variables are required." 1>&2
	exit 1
fi

# APP=${APP:-$(basename "$PWD")}
# TAG=${TAG:-$(git rev-parse feature1)}
# ENV=${ENV:-dev}

fly_config_file="fly.${ENV}.toml"
deploy_unixtime=$(date -u '+%s')

sed "s/^  image = \"mbigras\/app:.*\"$/  image = \"mbigras\/app:$TAG\"/
	s/^  DEPLOY_UNIXTIME = [0-9][0-9]*$/  DEPLOY_UNIXTIME = $deploy_unixtime/" "$fly_config_file" | tee tmp && mv tmp "$fly_config_file"

git --no-pager diff
git add "$fly_config_file"
git commit --message "Deploy $APP to $ENV

App: $APP
Tag: $TAG
Env: $ENV
Notes: Set [skip ci] flag so GitHub Actions ignores this commit."
