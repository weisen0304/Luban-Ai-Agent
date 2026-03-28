#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/frontend/site"
TARGET_DIR="${1:-/var/www/luban-ai-agent/current}"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "source directory not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
rsync -av --delete "$SOURCE_DIR"/ "$TARGET_DIR"/

echo "frontend deployed to: $TARGET_DIR"
