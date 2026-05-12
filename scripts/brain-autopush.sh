#!/usr/bin/env bash
set -euo pipefail

echo "[brain] autopush..."

git add -f AGENTS.md SOUL.md memories/ skills/ scripts/ docs/ configs/devices/ 2>/dev/null || true

if git diff --cached --quiet; then
  echo "[brain] no shared-brain changes"
  exit 0
fi

git diff --cached --stat

MSG="${1:-update shared brain}"
git commit -m "$MSG"
git push origin main

echo "[brain] pushed: $(git rev-parse --short HEAD)"
