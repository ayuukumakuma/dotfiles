#!/bin/bash

set -euo pipefail

codex_pid=$(ps aux | grep -E "^\S+\s+\S+.*\scodex$" | grep -v grep | awk '{print $2}' | head -1)

if [[ -z "$codex_pid" ]]; then
  osascript -e 'display notification "プロセスが見つかりません" with title "Codex"'
  exit 1
fi

current_pid="$codex_pid"

while [[ -n "$current_pid" && "$current_pid" != "1" ]]; do
  cmd="$(ps -p "$current_pid" -o command= 2>/dev/null || true)"

  if [[ "$cmd" == *".app/"* ]]; then
    bundle_path="$(echo "$cmd" | grep -o '/[^"]*\.app' | head -1)"
    if [[ -n "$bundle_path" && -d "$bundle_path" ]]; then
      open -a "$bundle_path"
      exit 0
    fi
  fi

  current_pid="$(ps -p "$current_pid" -o ppid= 2>/dev/null | tr -d ' ')"
done

osascript -e 'display notification "アプリが見つかりませんでした" with title "Codex"'
exit 1
