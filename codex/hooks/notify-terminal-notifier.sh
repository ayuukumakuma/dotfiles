#!/bin/bash

set -euo pipefail

payload="${1:-}"

if ! command -v terminal-notifier >/dev/null 2>&1; then
  exit 0
fi

extract_json_field() {
  local key="$1"

  [[ -z "$payload" ]] && return 0
  command -v jq >/dev/null 2>&1 || return 0
  printf '%s' "$payload" | jq -r --arg key "$key" '.[$key] // empty' 2>/dev/null || true
}

find_parent_app() {
  local pid="$PPID"
  local command_name

  while [[ -n "$pid" && "$pid" -gt 1 ]]; do
    command_name="$(ps -p "$pid" -o comm= 2>/dev/null | xargs || true)"

    case "$command_name" in
      *wezterm-gui*|*WezTerm*)
        printf '%s' "WezTerm"
        return 0
        ;;
      *iTerm2*)
        printf '%s' "iTerm"
        return 0
        ;;
      */Terminal|*Terminal.app/*)
        printf '%s' "Terminal"
        return 0
        ;;
      *Cursor*)
        printf '%s' "Cursor"
        return 0
        ;;
      *Zed*)
        printf '%s' "Zed"
        return 0
        ;;
      *Visual\ Studio\ Code*|*Code*)
        printf '%s' "Visual Studio Code"
        return 0
        ;;
      *Codex*)
        printf '%s' "Codex"
        return 0
        ;;
    esac

    pid="$(ps -p "$pid" -o ppid= 2>/dev/null | xargs || true)"
  done

  return 1
}

notify() {
  if parent_app="$(find_parent_app)"; then
    terminal-notifier \
      -title "$title" \
      -message "$message" \
      -sound default \
      -execute "open -a \"${parent_app}\""
    return
  fi

  terminal-notifier \
    -title "$title" \
    -message "$message" \
    -sound default
}

title="$(extract_json_field "title")"
message="$(extract_json_field "message")"

if [[ -z "$title" ]]; then
  title="Codex"
fi

if [[ -z "$message" ]]; then
  message="Task update"
fi

parent_app=""
notify
