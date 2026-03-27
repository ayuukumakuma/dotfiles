#!/bin/bash
set -euo pipefail

state_file="$HOME/.config/notify-sound-disabled"

if [[ -f "$state_file" ]]; then
  rm -f "$state_file"
else
  touch "$state_file"
fi
