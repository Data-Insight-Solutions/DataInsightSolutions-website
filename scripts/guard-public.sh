#!/usr/bin/env bash
# This repository is PUBLIC. Refuse anything that belongs in the private Reckons.AI workspace:
# the workspace folder itself, graph files (.ttl), review-queue files, and .env.
#   scripts/guard-public.sh          check the staged files (the pre-commit hook)
#   scripts/guard-public.sh --all    check every tracked file (CI)
set -euo pipefail
if [ "${1:-}" = "--all" ]; then files="$(git ls-files)"; else files="$(git diff --cached --name-only --diff-filter=ACMR)"; fi
bad="$(printf '%s\n' "$files" | grep -E '^workspace/|\.ttl$|pending\.jsonl$|decisions\.jsonl$|(^|/)\.env$' || true)"
if [ -n "$bad" ]; then
  echo "guard-public: these files are private and this repository is public:" >&2
  printf '  %s\n' $bad >&2
  echo "Keep them in workspace/ (git-ignored). Publish a page through Reckons.AI instead of committing graph data." >&2
  exit 1
fi
