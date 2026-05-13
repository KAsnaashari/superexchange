#!/usr/bin/env bash
# end_euler.sh — run after finishing work on Euler.
# Commits and pushes code to GitHub.
# Usage: bash end_euler.sh ["optional commit message"]

LOCAL="$(cd "$(dirname "$0")" && pwd)"
REPO="$(basename "$LOCAL")"

echo "=== [$REPO] Finishing Euler work ==="

cd "$LOCAL"

echo ""
echo ">> Changed files:"
git status --short

git add -A

MSG="${1:-euler update $(date '+%Y-%m-%d %H:%M')}"
git commit -m "$MSG"

echo ""
echo ">> Pushing to GitHub..."
git push

echo ""
echo "=== Done! ==="
