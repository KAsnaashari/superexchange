#!/usr/bin/env bash
# end_local.sh — run after finishing work locally.
# Commits and pushes code to GitHub.
# Usage: bash end_local.sh ["optional commit message"]

LOCAL="$(cd "$(dirname "$0")" && pwd)"
REPO="$(basename "$LOCAL")"

echo "=== [$REPO] Finishing local work ==="

cd "$LOCAL"

echo ""
echo ">> Changed files:"
git status --short

git add -A

MSG="${1:-local update $(date '+%Y-%m-%d %H:%M')}"
git commit -m "$MSG"

echo ""
echo ">> Pushing to GitHub..."
git push

echo ""
echo "=== Done! ==="
