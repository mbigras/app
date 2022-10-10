#!/usr/bin/env bash
# Script entrypoint.sh starts Gunicorn which starts your app.
exec gunicorn -b 0.0.0.0:${PORT:-8080} app:app
