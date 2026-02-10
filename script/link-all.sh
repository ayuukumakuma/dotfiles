#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DRY_RUN=false

TARGET_DIRS=(
  "aerospace"
  "agents"
  "claude"
  "codex"
  "cursor"
  "fish"
  "git"
  "mise"
  "nvim"
  "wezterm"
  "zellij"
)

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      ;;
    *)
      printf '[ERROR] 不明なオプションです: %s\n' "$1" >&2
      exit 1
      ;;
  esac
  shift
done

if [[ "$DRY_RUN" == true ]]; then
  printf '[INFO] dry-run モードで実行します\n'
fi

for dir in "${TARGET_DIRS[@]}"; do
  printf '[INFO] %s/link.sh を実行します\n' "$dir"
  if [[ "$DRY_RUN" == true ]]; then
    DOTFILES_DRY_RUN=1 bash "${REPO_ROOT}/${dir}/link.sh"
  else
    bash "${REPO_ROOT}/${dir}/link.sh"
  fi
done

printf '[INFO] 全対象ディレクトリのシンボリックリンク設定が完了しました。\n'
