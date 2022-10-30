#!/usr/bin/env bash
# Script entrypoint.sh starts Gunicorn which starts your app.
#
# This script uses the following environment variables.
#
# ADDRESS - Set to 127.0.0.1 by default because if you run this script on your laptop—for example, in a Python virtual environment—then, you don't want your app visible to everyone on the network—for example, at your coffee shop. If you run this script in a Docker container, then set ADDRESS to 0.0.0.0—see https://serverfault.com/a/1084918/374879.
# PORT - Set to 8080 by default because if your run this script on your laptop, then you don't need sudo permissions. However, in a Docker container set 80 because then if you run your app in Docker Compose you don't need to specify a port when you send a request to your app.
exec gunicorn --bind ${ADDRESS:-127.0.0.1}:${PORT:-8080} app:app
