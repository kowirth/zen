#!/bin/bash

set -euo pipefail

docker-compose down -t 1
if [[ "$#" -gt 0 ]]; then
  docker-compose up -d $*
else
  docker-compose up -d --build
fi
container_id=$(docker ps -a --filter "ancestor=zen-python-app" -n 1 --format "{{.ID}}")
docker exec "${container_id}" python3 /app/app.py