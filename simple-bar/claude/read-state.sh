#!/bin/bash
state_file="$HOME/.claude/claude_state.json"
if [[ -f "$state_file" ]]; then
  state=$(jq -r '.status // "idle"' "$state_file" 2>/dev/null || echo "idle")
else
  state="idle"
fi
case "$state" in
  "permission_prompt") echo "🔴 許可待ち" ;;
  "idle_prompt")       echo "🟡 入力待ち" ;;
  "idle")              echo "⚪ 待機中" ;;
  "working")           echo "🔵 作業中" ;;
  "complete")          echo "✅ 完了" ;;
  *)                   exit 0 ;;
esac
exit 0
