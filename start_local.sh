#!/usr/bin/env bash
# start_local.sh — run before starting work locally.
# Pulls latest code from GitHub and syncs data folders from Euler.
# Usage: bash start_local.sh

CLUSTER="kasnaashari@euler.ethz.ch"
LOCAL="$(cd "$(dirname "$0")" && pwd)"
REPO="$(basename "$LOCAL")"
REMOTE="/cluster/home/kasnaashari/projects/bin/$REPO"

echo "=== [$REPO] Starting local work ==="

echo ""
echo ">> Pulling latest code from GitHub..."
git -C "$LOCAL" pull

echo ""
echo ">> Syncing data from cluster..."
for folder in results outputs; do
  if ssh "$CLUSTER" "[ -d $REMOTE/$folder ]" 2>/dev/null; then
    echo "   Syncing $folder/..."
    rm -rf "$LOCAL/$folder"
    scp -q -r "$CLUSTER:$REMOTE/$folder/" "$LOCAL/$folder"
    echo "   Done."
  fi
done

echo ""
echo "=== Ready! ==="
