#!/usr/bin/env bash

PORT=${PORT:-8080}

echo "$(date +"[%Y-%m-%d %H:%M:%S %z]") Starting app $(python -c 'import app; print(app.__version__)')"
exec gunicorn -b 0.0.0.0:$PORT app:app
