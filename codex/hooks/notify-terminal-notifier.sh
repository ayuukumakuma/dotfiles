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

normalize_app_name() {
  local app_name="$1"

  case "$app_name" in
    *wezterm-gui*|*WezTerm*)
      printf '%s' "WezTerm"
      return 0
      ;;
    *iTerm2*|*iTerm*)
      printf '%s' "iTerm"
      return 0
      ;;
    */Terminal|*Terminal.app/*|*Terminal*)
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

  return 1
}

find_parent_app() {
  local pid="$PPID"
  local command_name
  local normalized_name

  while [[ -n "$pid" && "$pid" -gt 1 ]]; do
    command_name="$(ps -p "$pid" -o comm= 2>/dev/null | xargs || true)"

    if normalized_name="$(normalize_app_name "$command_name")"; then
      printf '%s' "$normalized_name"
      return 0
    fi

    pid="$(ps -p "$pid" -o ppid= 2>/dev/null | xargs || true)"
  done

  return 1
}

get_frontmost_app() {
  local frontmost_app
  local normalized_name

  command -v osascript >/dev/null 2>&1 || return 1

  frontmost_app="$(
    osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null || true
  )"
  frontmost_app="$(printf '%s' "$frontmost_app" | xargs || true)"
  [[ -n "$frontmost_app" ]] || return 1

  normalized_name="$(normalize_app_name "$frontmost_app" || true)"
  [[ -n "$normalized_name" ]] || return 1

  printf '%s' "$normalized_name"
}

should_skip_notification() {
  local parent_name
  local frontmost_name

  if ! parent_name="$(find_parent_app)"; then
    return 1
  fi

  if ! frontmost_name="$(get_frontmost_app)"; then
    return 1
  fi

  [[ "$parent_name" == "$frontmost_name" ]]
}

can_play_custom_wav() {
  local wav_path="${CODEX_NOTIFY_WAV:-}"

  [[ -n "$wav_path" ]] || return 1
  command -v afplay >/dev/null 2>&1 || return 1
  [[ -f "$wav_path" ]]
}

play_custom_wav() {
  local wav_path="${CODEX_NOTIFY_WAV:-}"

  afplay -v 0.3 "$wav_path" >/dev/null 2>&1 &
}

notify() {
  local parent_app=""
  local execute_command=""
  local -a notify_args=(
    -title "$title"
    -message "$message"
  )

  if parent_app="$(find_parent_app)"; then
    execute_command="open -a \"${parent_app}\""
    notify_args+=(
      -execute "$execute_command"
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
