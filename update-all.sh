#!/bin/bash

for d in *; do
  if [ -d "$d" ]; then
    ( cd "$d" && pwd && docker-compose pull && docker-compose up -d )
  fi
done

docker system prune --all --force

docker ps
