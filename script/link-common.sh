#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

log_info() {
  printf '[INFO] %s\n' "$1"
}

log_warn() {
  printf '[WARN] %s\n' "$1"
}

log_error() {
  printf '[ERROR] %s\n' "$1" >&2
}

is_dry_run() {
  local dry_run_value="${DOTFILES_DRY_RUN:-}"

  case "$dry_run_value" in
    1|[Tt][Rr][Uu][Ee]|[Yy][Ee][Ss]|[Oo][Nn])
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

resolve_home_path() {
  local path="$1"
  case "$path" in
    "~")
      printf '%s\n' "$HOME"
      ;;
    "~/"*)
      printf '%s/%s\n' "$HOME" "${path#\~/}"
      ;;
    *)
      printf '%s\n' "$path"
      ;;
  esac
}

abs_path_from_parent() {
  local parent="$1"
  local input="$2"

  if [[ "$input" == /* ]]; then
    printf '%s\n' "$input"
    return
  fi

  local input_dir
  input_dir="$(dirname "$input")"
  local input_base
  input_base="$(basename "$input")"

  printf '%s/%s\n' "$(cd "$parent/$input_dir" && pwd -P)" "$input_base"
}

ensure_parent_dir() {
  local dest="$1"
  local parent
  parent="$(dirname "$dest")"

  if [[ ! -d "$parent" ]]; then
    if is_dry_run; then
      log_info "[DRY-RUN] 親ディレクトリを作成予定: $parent"
    else
      mkdir -p "$parent"
      log_info "親ディレクトリを作成しました: $parent"
    fi
  fi
}

backup_if_exists() {
  local path="$1"
  local timestamp
  timestamp="$(date +%Y%m%d%H%M%S)"
  local backup_path="${path}.bak.${timestamp}"
  local index=1

  while [[ -e "$backup_path" || -L "$backup_path" ]]; do
    backup_path="${path}.bak.${timestamp}.${index}"
    index=$((index + 1))
  done

  if is_dry_run; then
    log_info "[DRY-RUN] 既存パスをバックアップ予定: $path -> $backup_path"
  else
    mv "$path" "$backup_path"
    log_warn "既存パスをバックアップしました: $path -> $backup_path"
  fi
}

is_same_symlink_target() {
  local link_path="$1"
  local expected_target="$2"

  if [[ ! -L "$link_path" ]]; then
    return 1
  fi

  local current_target
  current_target="$(readlink "$link_path")"
  local current_target_abs
  current_target_abs="$(abs_path_from_parent "$(dirname "$link_path")" "$current_target")"

  [[ "$current_target_abs" == "$expected_target" ]]
}

create_symlink() {
  local repo_src_rel="$1"
  local home_dest_raw="$2"

  local src_abs="${REPO_ROOT}/${repo_src_rel}"
  local src_abs_resolved
  src_abs_resolved="$(abs_path_from_parent "/" "$src_abs")"

  if [[ ! -e "$src_abs_resolved" && ! -L "$src_abs_resolved" ]]; then
    log_warn "リンク元が見つからないためスキップしました: $repo_src_rel"
    return 0
  fi

  local dest_abs
  dest_abs="$(resolve_home_path "$home_dest_raw")"

  if is_same_symlink_target "$dest_abs" "$src_abs_resolved"; then
    log_info "既にリンク済みです: $dest_abs"
    return 0
  fi

  if [[ -e "$dest_abs" || -L "$dest_abs" ]]; then
    backup_if_exists "$dest_abs"
  fi

  ensure_parent_dir "$dest_abs"
  if is_dry_run; then
    log_info "[DRY-RUN] シンボリックリンク作成予定: $dest_abs -> $src_abs_resolved"
  else
    ln -s "$src_abs_resolved" "$dest_abs"
    log_info "シンボリックリンクを作成しました: $dest_abs -> $src_abs_resolved"
  fi
}
