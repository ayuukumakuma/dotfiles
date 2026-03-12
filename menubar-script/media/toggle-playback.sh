#!/bin/bash

set -euo pipefail

PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if ! command -v osascript >/dev/null 2>&1; then
  exit 0
fi

readonly spotify_app="/Applications/Spotify.app"

toggle_spotify() {
  [[ -d "$spotify_app" ]] || return 1

  osascript 2>/dev/null <<'APPLESCRIPT'
try
  tell application "/Applications/Spotify.app"
    playpause
  end tell
  return "ok"
on error
  return ""
end try
APPLESCRIPT
}

for app_path in "$spotify_app"; do
  case "$app_path" in
    "$spotify_app")
      result="$(toggle_spotify || true)"
      ;;
    *)
      result=""
      ;;
  esac

  if [[ "$result" == "ok" ]]; then
    exit 0
  fi
done

exit 0
