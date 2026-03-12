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

print_existing_bundle_path() {
  local bundle_path="$1"

  bundle_path="$(printf '%s' "$bundle_path" | xargs || true)"
  [[ -n "$bundle_path" && -d "$bundle_path" ]] || return 1

  printf '%s' "$bundle_path"
}

extract_app_bundle_path_from_command() {
  local command_line="$1"
  local bundle_path=""

  [[ "$command_line" == *".app/"* || "$command_line" == *".app"* ]] || return 1

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

get_frontmost_app_bundle_path() {
  local frontmost_app_path=""

  command -v osascript >/dev/null 2>&1 || return 1

  frontmost_app_path="$(
    osascript -e 'POSIX path of (path to frontmost application)' 2>/dev/null || true
  )"
  if frontmost_app_path="$(print_existing_bundle_path "$frontmost_app_path")"; then
    printf '%s' "$frontmost_app_path"
    return 0
  fi

  frontmost_app_path="$(
    osascript -e 'tell application "System Events" to POSIX path of (application file of first application process whose frontmost is true as alias)' 2>/dev/null || true
  )"

  print_existing_bundle_path "$frontmost_app_path"
}

should_skip_notification() {
  local parent_app_path
  local frontmost_app_path

  if ! parent_app_path="$(find_parent_app_bundle_path)"; then
    return 1
  fi

  if ! frontmost_app_path="$(get_frontmost_app_bundle_path)"; then
    return 1
  fi

  [[ "$parent_app_path" == "$frontmost_app_path" ]]
}

can_play_custom_wav() {
  local wav_path="${CODEX_NOTIFY_WAV:-}"

  [[ -n "$wav_path" ]] || return 1
  command -v afplay >/dev/null 2>&1 || return 1
  [[ -f "$wav_path" ]]
}

play_custom_wav() {
  local wav_path="${CODEX_NOTIFY_WAV:-}"

  afplay -v 0.2 "$wav_path" >/dev/null 2>&1 &
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

  if can_play_custom_wav; then
    terminal-notifier "${notify_args[@]}"
    play_custom_wav || true
    return
  fi

  terminal-notifier "${notify_args[@]}" -sound Glass
}

title="$(extract_json_field "title")"
message="$(extract_json_field "message")"

if [[ -z "$title" ]]; then
  title="Codex"
fi

if [[ -z "$message" ]]; then
  message="Task update"
fi

if should_skip_notification; then
  exit 0
fi

notify
