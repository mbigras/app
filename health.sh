#!/bin/bash
# Script health.sh checks that you can connect to your app—used by Docker healthcheck.
set -o errexit
curl --fail http://localhost:${PORT:-8080}/
