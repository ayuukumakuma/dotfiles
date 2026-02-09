#!/usr/bin/env bash

readonly COLOR_RESET='\033[0m'
readonly COLOR_YELLOW='\033[33m'
readonly COLOR_RED='\033[31m'

get_repo_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local repo_name
  repo_name=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)")
  [[ -z "$repo_name" ]] && return

  local branch
  branch=$(git branch --show-current 2>/dev/null)
  branch=${branch:-"HEAD@$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"}

  echo -e "📁 ${repo_name} (${branch}) | "
}

get_model_name() {
  local input=$1
  if command -v jq &>/dev/null; then
    echo "$input" | jq -r '.model.display_name // "Claude"' 2>/dev/null
  else
    echo "Claude"
  fi
}

main() {
  local input
  input=$(cat)

  local git_info
  git_info=$(get_repo_info)

  local ccusage_output
  if ccusage_output=$(echo "$input" | bun x ccusage statusline --visual-burn-rate emoji 2>/dev/null) && [[ -n "$ccusage_output" ]]; then
    echo -e "${git_info}${ccusage_output}"
  else
    echo -e "${git_info}🤖 $(get_model_name "$input") | ${COLOR_RED}[Status unavailable]${COLOR_RESET}"
  fi
}

main
