#!/bin/sh

if [ -z "$REDIS_URL" ]; then
  if [ -z "$REDIS_USERNAME" ] && [ -z "$REDIS_PASSWORD" ]; then
    export REDIS_URL=redis://$REDIS_HOST:$REDIS_PORT/$REDIS_DATABASE
  else
    export REDIS_URL=redis://$REDIS_USERNAME:$REDIS_PASSWORD@$REDIS_HOST:$REDIS_PORT/$REDIS_DATABASE
  fi
fi

exec node /opt/app/server.js $@
