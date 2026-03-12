#!/bin/bash
set -euo pipefail

PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

azoo_key_mode="dev.ensan.inputmethod.azooKeyMac.Japanese"
unicode_hex_mode="com.apple.keylayout.UnicodeHexInput"

if ! command -v im-select >/dev/null 2>&1; then
  exit 0
fi

current_mode=$(im-select 2>/dev/null || true)

case "$current_mode" in
  "$azoo_key_mode")
    im-select "$unicode_hex_mode" >/dev/null 2>&1 || true
    ;;
  "$unicode_hex_mode")
    im-select "$azoo_key_mode" >/dev/null 2>&1 || true
    ;;
  *)
    exit 0
    ;;
esac

exit 0
