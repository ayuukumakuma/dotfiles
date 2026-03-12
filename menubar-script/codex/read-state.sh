#!/bin/bash

set -euo pipefail

state_file="$HOME/.codex/codex_state.json"

if [[ -f "$state_file" ]]; then
  state=$(jq -r '.status // "idle"' "$state_file" 2>/dev/null || echo "idle")
else
  state="idle"
fi

case "$state" in
  "idle")     echo "Codex: ⚪ Idle" ;;
  "working")  echo "Codex: 🔵 Working" ;;
  "complete") echo "Codex: ✅ Complete" ;;
  *)          exit 0 ;;
esac

exit 0
