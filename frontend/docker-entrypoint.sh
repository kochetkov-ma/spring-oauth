#!/bin/sh
set -e

echo "Executing: docker-entrypoint.sh. Environment: BACKEND_HOST=$BACKEND_HOST BACKEND_PORT=$BACKEND_PORT. Arguments: $@"

envsubst '${BACKEND_HOST} ${BACKEND_PORT}' < /default.conf > /etc/nginx/conf.d/default.conf

exec "$@"
