#!/usr/bin/env bash
set -euo pipefail

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
  echo "[brain] not a git repo"
  exit 1
}

echo "[brain] preflight..."

git fetch origin main

LOCAL="$(git rev-parse HEAD)"
REMOTE="$(git rev-parse origin/main)"

if [ "$LOCAL" = "$REMOTE" ]; then
  echo "[brain] up to date: $(git rev-parse --short HEAD)"
  exit 0
fi

if git merge-base --is-ancestor HEAD origin/main; then
  echo "[brain] behind origin/main -> pulling"
  git pull --ff-only origin main
  echo "[brain] updated: $(git rev-parse --short HEAD)"
  exit 0
fi

echo "[brain] local diverged/conflict risk. Stop."
git status --short
exit 1
