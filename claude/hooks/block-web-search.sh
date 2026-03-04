#!/bin/bash
set -euo pipefail

printf '{"hookSpecificOutput": {"permissionDecision": "deny"}, "systemMessage": "WebSearch, WebFetch は無効化されています。代わりに gemini-web-search スキルを使ってください。\nコマンド例: gemini -m \"gemini-3-flash-preview\" --output-format json -p \"google_web_search: <query>. responseフィールドには閲覧したWebサイトのURLを含めること.\" | jq -r .response"}' >&2
exit 2
