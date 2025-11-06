#!/usr/bin/env bash
set -euo pipefail
: "${MONGO_INITDB_ROOT_USERNAME:=root}"
: "${MONGO_INITDB_ROOT_PASSWORD:=root}"

docker compose -f docker-compose.mongo.yml exec -it mongo \
  mongosh -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD"