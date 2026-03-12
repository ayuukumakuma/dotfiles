#!/bin/bash
state_file="$HOME/.claude/claude_state.json"
if [[ -f "$state_file" ]]; then
  state=$(jq -r '.status // "idle"' "$state_file" 2>/dev/null || echo "idle")
else
  state="idle"
fi
case "$state" in
  "permission_prompt") echo "Claude Code: 🔴 Permission" ;;
  "idle_prompt")       echo "Claude Code: 🟡 Waiting" ;;
  "idle")              echo "Claude Code: ⚪ Idle" ;;
  "working")           echo "Claude Code: 🔵 Working" ;;
  "complete")          echo "Claude Code: ✅ Complete" ;;
  *)                   exit 0 ;;
esac
exit 0
