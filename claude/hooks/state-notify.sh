#!/bin/bash

set -euo pipefail

event_type="${1:-unknown}"
state_dir="$HOME/.claude"
state_file="${state_dir}/claude_state.json"

mkdir -p "$state_dir"
printf '{"status":"%s","time":"%s"}\n' "$event_type" "$(date -Iseconds)" > "$state_file"

build_notification() {
  local event="$1"

  case "$event" in
    permission_prompt)
      title="Claude Code"
      message="Permission request is waiting"
      return 0
      ;;
    idle_prompt)
      title="Claude Code"
      message="Input is required"
      return 0
      ;;
    complete)
      title="Claude Code"
      message="Task completed"
      return 0
      ;;
    *)
      return 1
      ;;
  esac
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
      *Claude*)
        printf '%s' "Claude"
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
      -sound Funk \
      -execute "open -a \"${parent_app}\""
    return
  fi

  terminal-notifier \
    -title "$title" \
    -message "$message" \
    -sound Funk
}

if ! command -v terminal-notifier >/dev/null 2>&1; then
  exit 0
fi

title=""
message=""
parent_app=""

if ! build_notification "$event_type"; then
  exit 0
fi

notify
