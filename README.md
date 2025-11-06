### How to connect to mongo7 container
```bash
docker compose exec -it mongo \
  mongosh -u "${MONGO_INITDB_ROOT_USERNAME:-root}" \
          -p "${MONGO_INITDB_ROOT_PASSWORD:-root}" \
          --authenticationDatabase admin
```
