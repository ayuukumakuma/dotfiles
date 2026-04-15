#!/bin/bash

set -euo pipefail

event_type="${1:-idle}"
state_dir="$HOME/.codex"
state_file="${state_dir}/codex_state.json"

mkdir -p "$state_dir"
printf '{"status":"%s","time":"%s"}\n' "$event_type" "$(date -Iseconds)" > "$state_file"
