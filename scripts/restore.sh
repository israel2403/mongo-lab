#!/usr/bin/env bash
set -euo pipefail
file="${1:-}"
[ -f "$file" ] || { echo "Usage: $0 backups/mongodump-YYYYmmdd-HHMMSS.archive.gz"; exit 1; }

: "${MONGO_INITDB_ROOT_USERNAME:=root}"
: "${MONGO_INITDB_ROOT_PASSWORD:=root}"

gunzip -c "$file" | docker compose -f docker-compose.mongo.yml exec -T mongo \
  mongorestore --username "$MONGO_INITDB_ROOT_USERNAME" --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin --archive
