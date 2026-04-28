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

print_existing_bundle_path() {
  local bundle_path="$1"

  bundle_path="$(printf '%s' "$bundle_path" | xargs || true)"
  [[ -n "$bundle_path" && -d "$bundle_path" ]] || return 1

  printf '%s' "$bundle_path"
}

extract_app_bundle_path_from_command() {
  local command_line="$1"
  local bundle_path=""

  [[ "$command_line" == *".app"* ]] || return 1

  bundle_path="$(printf '%s\n' "$command_line" | grep -o '/[^"]*\.app' | head -1 || true)"

  print_existing_bundle_path "$bundle_path"
}

find_parent_app_bundle_path() {
  local pid="$PPID"
  local command_line
  local bundle_path

  while [[ -n "$pid" && "$pid" -gt 1 ]]; do
    command_line="$(ps -p "$pid" -o command= 2>/dev/null || true)"

    if bundle_path="$(extract_app_bundle_path_from_command "$command_line")"; then
      printf '%s' "$bundle_path"
      return 0
    fi

    pid="$(ps -p "$pid" -o ppid= 2>/dev/null | xargs || true)"
  done

  return 1
}

notify() {
  local parent_app_bundle_path=""
  local -a notify_args=(
    -title "$title"
    -message "$message"
  )

  if parent_app_bundle_path="$(find_parent_app_bundle_path)"; then
    notify_args+=(
      -execute "open -a \"${parent_app_bundle_path}\""
    )
  fi

  terminal-notifier "${notify_args[@]}"
}

if ! command -v terminal-notifier >/dev/null 2>&1; then
  exit 0
fi

title=""
message=""

if ! build_notification "$event_type"; then
  exit 0
fi

notify
