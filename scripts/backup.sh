#!/usr/bin/env bash
set -euo pipefail
ts="$(date +%Y%m%d-%H%M%S)"
mkdir -p backups

: "${MONGO_INITDB_ROOT_USERNAME:=root}"
: "${MONGO_INITDB_ROOT_PASSWORD:=root}"

docker compose -f docker-compose.mongo.yml exec -T mongo \
  mongodump --username "$MONGO_INITDB_ROOT_USERNAME" --password "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin --archive | gzip > "backups/mongodump-${ts}.archive.gz"

echo "Backup written to backups/mongodump-${ts}.archive.gz"
