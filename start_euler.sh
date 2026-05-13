#!/usr/bin/env bash
# start_euler.sh — run before starting work on Euler.
# Pulls latest code from GitHub.
# Usage: bash start_euler.sh

LOCAL="$(cd "$(dirname "$0")" && pwd)"
REPO="$(basename "$LOCAL")"

echo "=== [$REPO] Starting Euler work ==="

echo ""
echo ">> Pulling latest code from GitHub..."
git -C "$LOCAL" pull

echo ""
echo "=== Ready! ==="
