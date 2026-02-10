#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# shellcheck source=./link-common.sh
source "${SCRIPT_DIR}/link-common.sh"

LINK_ALL_PATH="${SCRIPT_DIR}/link-all.sh"
README_PATH="${REPO_ROOT}/README.md"

TARGET_DIR=""
README_DESC=""
declare -a SOURCES=()
declare -a DESTINATIONS=()

abort() {
  log_error "$1"
  exit 1
}

make_tmp_file() {
  local prefix="$1"
  mktemp "${TMPDIR:-/tmp}/${prefix}.XXXXXX"
}

validate_dir_name() {
  local dir_name="$1"

  if [[ -z "$dir_name" || "$dir_name" == "." || "$dir_name" == ".." ]]; then
    return 1
  fi

  [[ "$dir_name" =~ ^[a-z0-9][a-z0-9-]*$ ]]
}

validate_source() {
  local source_path="$1"

  # source は対象ディレクトリ配下のみ許可する
  if [[ -z "$source_path" || "$source_path" == /* || "$source_path" == ~* || "$source_path" == *".."* ]]; then
    return 1
  fi

  [[ "$source_path" == "$TARGET_DIR" || "$source_path" == "$TARGET_DIR/"* ]]
}

validate_destination() {
  local destination_path="$1"

  [[ -n "$destination_path" && ( "$destination_path" == "~" || "$destination_path" == "~/"* || "$destination_path" == /* ) ]]
}

ensure_target_directory() {
  local dir_path="${REPO_ROOT}/${TARGET_DIR}"

  if [[ -e "$dir_path" && ! -d "$dir_path" ]]; then
    abort "対象パスは存在しますがディレクトリではありません: ${TARGET_DIR}"
  fi

  if [[ ! -d "$dir_path" ]]; then
    mkdir -p "$dir_path"
    log_info "ディレクトリを作成しました: ${TARGET_DIR}"
  else
    log_warn "ディレクトリは既に存在します: ${TARGET_DIR}"
  fi
}

generate_link_script() {
  local link_script_path="${REPO_ROOT}/${TARGET_DIR}/link.sh"
  local tmp_file

  tmp_file="$(make_tmp_file "link-template")"

  # 収集した source/destination の組を create_symlink 呼び出しとして書き出す
  {
    printf '#!/bin/bash\n\n'
    printf 'set -euo pipefail\n\n'
    printf 'SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"\n'
    printf '# shellcheck source=../script/link-common.sh\n'
    printf 'source "${SCRIPT_DIR}/../script/link-common.sh"\n\n'

    local i
    for i in "${!SOURCES[@]}"; do
      printf 'create_symlink "%s" "%s"\n' "${SOURCES[$i]}" "${DESTINATIONS[$i]}"
    done
  } > "$tmp_file"

  if [[ -e "$link_script_path" || -L "$link_script_path" ]]; then
    backup_if_exists "$link_script_path"
  fi

  mv "$tmp_file" "$link_script_path"
  chmod +x "$link_script_path"
  log_info "テンプレートを生成しました: ${TARGET_DIR}/link.sh"
}

create_target_readme_if_requested() {
  local target_readme_path="${REPO_ROOT}/${TARGET_DIR}/README.md"
  # 既存 README は安全のため上書きしない
  if [[ -e "$target_readme_path" || -L "$target_readme_path" ]]; then
    log_warn "README は既に存在するためスキップしました: ${TARGET_DIR}/README.md"
    return
  fi

  cat > "$target_readme_path" <<EOF
# ${TARGET_DIR}

このディレクトリは ${TARGET_DIR} の設定ファイルを管理します。

## ファイル
- （必要に応じて追記）

## セットアップ
\`\`\`bash
bash "${TARGET_DIR}/link.sh"
\`\`\`
EOF
  log_info "ファイルを作成しました: ${TARGET_DIR}/README.md"
}

update_link_all() {
  if [[ ! -f "$LINK_ALL_PATH" ]]; then
    abort "ファイルが見つかりません: script/link-all.sh"
  fi

  local -a sorted_dirs
  sorted_dirs=()
  while IFS= read -r dir; do
    sorted_dirs+=("$dir")
  done < <(
    {
      awk '
        /^TARGET_DIRS=\(/ { in_array=1; next }
        in_array && /^\)/ { in_array=0; next }
        in_array {
          if (match($0, /"[^"]+"/)) {
            value = substr($0, RSTART + 1, RLENGTH - 2)
            if (value != "") {
              print value
            }
          }
        }
      ' "$LINK_ALL_PATH"
      printf '%s\n' "$TARGET_DIR"
      # 既存 + 新規ディレクトリをマージして重複排除・ソート
    } | awk 'NF { print }' | sort -u
  )

  local array_block_file
  array_block_file="$(make_tmp_file "link-all-array")"

  {
    printf 'TARGET_DIRS=(\n'

    local dir
    for dir in "${sorted_dirs[@]}"; do
      printf '  "%s"\n' "$dir"
    done

    printf ')\n'
  } > "$array_block_file"

  local tmp_file
  tmp_file="$(make_tmp_file "link-all")"

  awk -v array_file="$array_block_file" '
    BEGIN {
      while ((getline line < array_file) > 0) {
        array_block = array_block line "\n"
      }
      close(array_file)
    }
    /^TARGET_DIRS=\(/ {
      printf "%s", array_block
      in_array = 1
      replaced = 1
      next
    }
    in_array && /^\)/ {
      in_array = 0
      next
    }
    !in_array {
      print
    }
    END {
      if (!replaced) {
        printf "\n%s", array_block
      }
    }
  ' "$LINK_ALL_PATH" > "$tmp_file"

  rm -f "$array_block_file"

  if ! cmp -s "$LINK_ALL_PATH" "$tmp_file"; then
    mv "$tmp_file" "$LINK_ALL_PATH"
    chmod +x "$LINK_ALL_PATH"
    log_info 'script/link-all.sh の TARGET_DIRS を更新しました（ソート済み）'
  else
    rm -f "$tmp_file"
    log_info 'script/link-all.sh は最新です'
  fi
}

ensure_readme_usage_section() {
  if [[ ! -f "$README_PATH" ]]; then
    abort 'ファイルが見つかりません: README.md'
  fi

  if grep -q '^### 新しい設定ディレクトリの追加$' "$README_PATH"; then
    return
  fi

  local tmp_file
  tmp_file="$(make_tmp_file "readme-usage")"

  # README のガイド節がない場合だけ Fish設定の直前に挿入する
  awk '
    /^### Fish設定の変更$/ && !inserted {
      print "### 新しい設定ディレクトリの追加"
      print ""
      print "新規ディレクトリと `link.sh` 雛形は以下の対話コマンドで作成できます："
      print ""
      print "```bash"
      print "./script/create-link-template.sh"
      print "```"
      print ""
      print "このコマンドは以下を自動更新します："
      print ""
      print "- 新規設定ディレクトリ"
      print "- `対象ディレクトリ/link.sh`"
      print "- `script/link-all.sh` の `TARGET_DIRS`（アルファベット順）"
      print "- `README.md` のディレクトリ構造"
      print ""
      inserted=1
    }
    { print }
  ' "$README_PATH" > "$tmp_file"

  if ! cmp -s "$README_PATH" "$tmp_file"; then
    mv "$tmp_file" "$README_PATH"
    log_info 'README に使い方セクションを追加しました'
  else
    rm -f "$tmp_file"
  fi
}

update_readme_structure() {
  local tmp_file
  tmp_file="$(make_tmp_file "readme-structure")"

  # ディレクトリ構造のコードブロック内だけを抽出・更新し、
  # 既存エントリと新規エントリを名前順で再構成する
  awk -v dir_name="$TARGET_DIR" -v dir_desc="$README_DESC" '
    {
      lines[NR] = $0
    }
    END {
      section = 0
      apps = 0
      code_end = 0

      for (i = 1; i <= NR; i++) {
        if (lines[i] ~ /^## 📁 ディレクトリ構造$/) {
          section = i
          break
        }
      }

      if (section == 0) {
        for (i = 1; i <= NR; i++) {
          print lines[i]
        }
        exit
      }

      for (i = section; i <= NR; i++) {
        if (lines[i] ~ /^└── \[各種アプリ設定ディレクトリ\]$/) {
          apps = i
          break
        }
      }

      if (apps == 0) {
        for (i = 1; i <= NR; i++) {
          print lines[i]
        }
        exit
      }

      for (i = apps + 1; i <= NR; i++) {
        if (lines[i] ~ /^```$/) {
          code_end = i
          break
        }
      }

      if (code_end == 0) {
        for (i = 1; i <= NR; i++) {
          print lines[i]
        }
        exit
      }

      count = 0
      for (i = apps + 1; i < code_end; i++) {
        line = lines[i]
        if (line ~ /#[[:space:]]*/) {
          # "    (tree-marker) name/ # desc" を tree-marker 非依存で抽出
          candidate = line
          sub(/^[[:space:]]+[^[:space:]]+[[:space:]]+/, "", candidate)
          hash_pos = index(candidate, "#")
          if (hash_pos > 0) {
            lhs = substr(candidate, 1, hash_pos - 1)
            desc = substr(candidate, hash_pos + 1)

            gsub(/^[[:space:]]+|[[:space:]]+$/, "", lhs)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", desc)
            sub(/\/$/, "", lhs)

            if (lhs != "") {
              name = lhs
              if (!(name in dir_map)) {
                count++
                names[count] = name
              }
              dir_map[name] = desc
            }
          }
        }
      }

      if (!(dir_name in dir_map)) {
        count++
        names[count] = dir_name
      }
      dir_map[dir_name] = dir_desc

      for (i = 1; i <= count; i++) {
        for (j = i + 1; j <= count; j++) {
          if (names[i] > names[j]) {
            temp = names[i]
            names[i] = names[j]
            names[j] = temp
          }
        }
      }

      for (i = 1; i <= apps; i++) {
        print lines[i]
      }

      for (i = 1; i <= count; i++) {
        branch = (i == count) ? "└" : "├"
        printf "    %s── %-13s # %s\n", branch, names[i] "/", dir_map[names[i]]
      }

      for (i = code_end; i <= NR; i++) {
        print lines[i]
      }
    }
  ' "$README_PATH" > "$tmp_file"

  if ! cmp -s "$README_PATH" "$tmp_file"; then
    mv "$tmp_file" "$README_PATH"
    log_info "README のディレクトリ構造を更新しました: ${TARGET_DIR}/"
  else
    rm -f "$tmp_file"
    log_info 'README のディレクトリ構造は最新です'
  fi
}

collect_inputs() {
  while true; do
    read -r -p '新しいディレクトリ名（kebab-case）: ' TARGET_DIR

    if ! validate_dir_name "$TARGET_DIR"; then
      log_warn 'ディレクトリ名が不正です。例: my-tool'
      continue
    fi

    break
  done

  README_DESC="${TARGET_DIR}設定"
  log_info "README説明は自動入力します: ${README_DESC}"

  log_info '最初に紐づけるファイルは1件のみ設定します。'

  local source_path
  while true; do
    read -r -p "リンク元（リポジトリ相対。例: ${TARGET_DIR}/config.toml）: " source_path
    if ! validate_source "$source_path"; then
      log_warn "リンク元が不正です: ${source_path}"
      log_warn "${TARGET_DIR}/ または ${TARGET_DIR} で始まるパスを指定してください"
      continue
    fi
    break
  done

  local destination_path
  while true; do
    read -r -p "リンク先（~ または絶対パス。例: ~/.config/${TARGET_DIR}）: " destination_path
    if ! validate_destination "$destination_path"; then
      log_warn "リンク先が不正です: ${destination_path}"
      log_warn 'リンク先は ~/ , ~ , / のいずれかで始まる必要があります'
      continue
    fi
    break
  done

  SOURCES+=("$source_path")
  DESTINATIONS+=("$destination_path")
  log_info "追加: ${source_path} -> ${destination_path}"
}

print_summary() {
  log_info "対象ディレクトリ: ${TARGET_DIR}/"
  log_info '対応関係:'

  local i
  for i in "${!SOURCES[@]}"; do
    printf '  - %s -> %s\n' "${SOURCES[$i]}" "${DESTINATIONS[$i]}"
  done
}

main() {
  # 対話入力 -> テンプレート生成 -> 集約スクリプト更新 -> ルートREADME更新
  collect_inputs
  print_summary
  ensure_target_directory
  create_target_readme_if_requested
  generate_link_script
  update_link_all
  ensure_readme_usage_section
  update_readme_structure
  log_info 'テンプレート生成が完了しました'
}

main "$@"
