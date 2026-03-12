#!/bin/bash

set -euo pipefail

state="${1:-idle}"
state_dir="$HOME/.codex"
state_file="${state_dir}/codex_state.json"

mkdir -p "$state_dir"
printf '{"status":"%s","time":"%s"}\n' "$state" "$(date -Iseconds)" > "$state_file"
