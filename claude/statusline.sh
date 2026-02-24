#!/usr/bin/env bash

# --- Colors ---
readonly C_RESET='\033[0m'
readonly C_CYAN='\033[36m'
readonly C_GREEN='\033[32m'
readonly C_YELLOW='\033[33m'
readonly C_RED='\033[31m'
readonly C_DIM='\033[90m'

# --- Cache paths ---
readonly GIT_CACHE="/tmp/claude-statusline-git-cache"
readonly GIT_CACHE_TTL=5
readonly USAGE_CACHE="/tmp/claude-statusline-usage-cache"
readonly USAGE_CACHE_TTL=60

# Return cached content if fresh, or return failure (1) to signal cache miss.
read_cache() {
  local cache_file=$1 ttl=$2
  [[ -f "$cache_file" ]] || return 1
  local now age
  now=$(date +%s)
  age=$(( now - $(stat -f %m "$cache_file" 2>/dev/null || echo 0) ))
  (( age < ttl )) && cat "$cache_file" && return 0
  return 1
}

# Map percentage to color escape code.
color_for_pct() {
  if (( $1 >= 90 )); then echo "$C_RED"
  elif (( $1 >= 70 )); then echo "$C_YELLOW"
  else echo "$C_GREEN"
  fi
}

get_git_info() {
  local work_dir=$1
  read_cache "$GIT_CACHE" "$GIT_CACHE_TTL" && return

  if ! git -C "$work_dir" rev-parse --is-inside-work-tree &>/dev/null; then
    echo "" > "$GIT_CACHE"
    return
  fi

  local repo branch staged modified
  repo=$(basename "$(git -C "$work_dir" rev-parse --show-toplevel 2>/dev/null)")
  branch=$(git -C "$work_dir" branch --show-current 2>/dev/null)
  branch=${branch:-"HEAD@$(git -C "$work_dir" rev-parse --short HEAD 2>/dev/null || echo 'unknown')"}
  staged=$(git -C "$work_dir" diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  modified=$(git -C "$work_dir" diff --numstat 2>/dev/null | wc -l | tr -d ' ')

  local result="${repo}|${branch}|${staged}|${modified}"
  echo "$result" > "$GIT_CACHE"
  echo "$result"
}

get_usage_info() {
  read_cache "$USAGE_CACHE" "$USAGE_CACHE_TTL" && return

  local token
  token=$(security find-generic-password -s "Claude Code-credentials" \
    -a "$(whoami)" -w 2>/dev/null | jq -r '.claudeAiOauth.accessToken // empty' 2>/dev/null) || true
  [[ -z "$token" ]] && return

  local response
  response=$(curl -s --max-time 5 \
    -H "Authorization: Bearer ${token}" \
    -H "anthropic-beta: oauth-2025-04-20" \
    "https://api.anthropic.com/api/oauth/usage" 2>/dev/null) || true
  [[ -z "$response" ]] && return

  # Parse and round both values in a single jq call
  local parsed
  parsed=$(echo "$response" | jq -r '
    [.five_hour.utilization, .seven_day.utilization]
    | if any(. == null) then empty
      else map(. + 0.5 | floor) | join("|")
      end' 2>/dev/null)
  [[ -z "$parsed" ]] && return

  echo "$parsed" > "$USAGE_CACHE"
  echo "$parsed"
}

colorize_pct() {
  local pct=$1 label=$2
  echo -e "$(color_for_pct "$pct")${label}: ${pct}%${C_RESET}"
}

render_progress_bar() {
  local pct=$1
  local width=20
  local filled=$(( pct * width * 2 / 100 ))
  local full=$(( filled / 2 ))
  local half=$(( filled % 2 ))
  local empty=$(( width - full - half ))
  local color
  color=$(color_for_pct "$pct")

  local bar="${color}"
  local i
  for (( i = 0; i < full; i++ )); do bar+="█"; done
  (( half )) && bar+="▌"
  bar+="${C_RESET}${C_DIM}"
  for (( i = 0; i < empty; i++ )); do bar+="░"; done
  bar+="${C_RESET}"

  echo -e "${bar} ${pct}%"
}

main() {
  local input
  input=$(cat)

  # Parse all needed fields in a single jq call
  local parsed
  parsed=$(echo "$input" | jq -r '[
    (.model.display_name // "Claude"),
    (.context_window.used_percentage // ""),
    (.workspace.current_dir // "")
  ] | join("|")')
  local model_name pct work_dir
  IFS='|' read -r model_name pct work_dir <<< "$parsed"

  # Line 1: model + git info
  local line1="${C_CYAN}[${model_name}]${C_RESET}"

  if [[ -n "$work_dir" ]]; then
    local git_info
    git_info=$(get_git_info "$work_dir")
    if [[ -n "$git_info" ]]; then
      local repo branch staged modified
      IFS='|' read -r repo branch staged modified <<< "$git_info"
      line1+=" 📁 ${repo} | 🌿 ${branch}"
      (( staged > 0 ))   && line1+=" ${C_GREEN}+${staged}${C_RESET}"
      (( modified > 0 )) && line1+=" ${C_YELLOW}~${modified}${C_RESET}"
    fi
  fi

  echo -e "$line1"

  # Line 2: progress bar + rate limit
  if [[ -n "$pct" ]]; then
    local line2
    line2=$(render_progress_bar "$pct")

    local usage_info
    usage_info=$(get_usage_info)
    if [[ -n "$usage_info" ]]; then
      local five_hour_pct seven_day_pct
      IFS='|' read -r five_hour_pct seven_day_pct <<< "$usage_info"
      line2+=" | $(colorize_pct "$five_hour_pct" "5h")"
      line2+=" | $(colorize_pct "$seven_day_pct" "7d")"
    fi

    echo -e "$line2"
  fi
}

main
