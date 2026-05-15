#!/bin/bash
set -euo pipefail

mode="${1:-full}"
path="${2:-$PWD}"

if ! git -C "$path" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  exit 0
fi

branch="$(git -C "$path" branch --show-current 2>/dev/null || true)"
if [[ -z "$branch" ]]; then
  branch="$(git -C "$path" rev-parse --short HEAD 2>/dev/null || true)"
fi

if [[ -z "$branch" ]]; then
  exit 0
fi

print_branch() {
  printf "  %s" "$branch"
}

print_diff() {
  local added=0
  local modified=0
  local deleted=0
  local status
  local untracked=0

  while IFS= read -r line; do
    status="${line:0:2}"

    case "$status" in
      "??")
        ((untracked += 1))
        continue
        ;;
    esac

    [[ "$status" == *A* ]] && ((added += 1))
    [[ "$status" == *M* || "$status" == *R* || "$status" == *C* ]] && ((modified += 1))
    [[ "$status" == *D* ]] && ((deleted += 1))
  done < <(git -C "$path" status --porcelain=v1 2>/dev/null || true)

  ((added > 0)) && printf " +%d" "$added"
  ((modified > 0)) && printf " ~%d" "$modified"
  ((deleted > 0)) && printf " -%d" "$deleted"
  ((untracked > 0)) && printf " ?%d" "$untracked"
}

case "$mode" in
  branch)
    print_branch
    ;;
  diff)
    print_diff
    ;;
  *)
    print_branch
    print_diff
    ;;
esac
