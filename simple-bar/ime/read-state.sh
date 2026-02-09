#!/bin/bash
set -euo pipefail

PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if ! command -v im-select >/dev/null 2>&1; then
  exit 0
fi

input_id=$(im-select 2>/dev/null || true)

case "$input_id" in
  com.apple.keylayout.*)
    echo "A"
    ;;
  *.Japanese)
    echo "あ"
    ;;
  "")
    exit 0
    ;;
  *)
    echo "?"
    ;;
esac
exit 0
