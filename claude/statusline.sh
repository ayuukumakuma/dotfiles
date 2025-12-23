#!/usr/bin/env bash

# Color definitions
readonly COLOR_RESET='\033[30m'
readonly COLOR_RED='\033[31m'
readonly COLOR_YELLOW='\033[33m'
readonly COLOR_GREEN='\033[32m'
readonly COLOR_CYAN='\033[36m'

# Token threshold constants
readonly COMPACTION_THRESHOLD=160000


# Get Git branch information
get_git_branch() {
  local git_branch=""

  if git rev-parse &>/dev/null; then
    local branch=$(git branch --show-current)
    if [ -n "$branch" ]; then
      git_branch=" |${COLOR_CYAN} ${branch}${COLOR_RESET}"
    else
      local commit_hash=$(git rev-parse --short HEAD 2>/dev/null)
      if [ -n "$commit_hash" ]; then
        git_branch=" |${COLOR_CYAN} HEAD (${commit_hash})${COLOR_RESET}"
      fi
    fi
  fi

  echo -e "$git_branch"
}

# Get token count and usage percentage
get_token_summary() {
  local transcript_path="$1"

  if [ -z "$transcript_path" ] || [ ! -f "$transcript_path" ]; then
    echo -e "0 tokens. (0%)"
    return
  fi

  # Get last assistant message with usage data using jq
  local total_tokens=$(tail -n 100 "$transcript_path" 2>/dev/null | \
    jq -s 'map(select(.type == "assistant" and .message.usage)) |
    last |
    .message.usage |
    (.input_tokens // 0) +
    (.output_tokens // 0) +
    (.cache_creation_input_tokens // 0) +
    (.cache_read_input_tokens // 0)' 2>/dev/null)

  # Default to 0 if no valid result
  total_tokens=${total_tokens:-0}

  # Calculate percentage
  local percentage=$((total_tokens * 100 / COMPACTION_THRESHOLD))

  # Format token display
  local token_display
  if [ "$total_tokens" -ge 1000 ]; then
    local thousands=$(echo "scale=1; $total_tokens/1000" | bc)
    token_display=$(printf "%.1fK" "$thousands")
  else
    token_display="$total_tokens"
  fi

  # Color coding for percentage
  local color
  if [ "$percentage" -ge 90 ]; then
    color="$COLOR_RED"
  elif [ "$percentage" -ge 70 ]; then
    color="$COLOR_YELLOW"
  else
    color="$COLOR_GREEN"
  fi

  echo -e "${token_display} tokens. (${color}${percentage}%${COLOR_RESET})"
}

# Get Claude API usage cost
get_api_usage() {
  local current_month=$(date +"%Y-%m")
  local usage_cost_output=$(npx --yes ccusage monthly --locale ja-JP --json | jq --arg current_month "$current_month" '.monthly[] | select(.month == $current_month).totalCost' 2>/dev/null)
  local usage_cost="0.00"

  if [ -n "$usage_cost_output" ]; then
    usage_cost=$(printf "%.2f" "$usage_cost_output")
  fi

  echo "\$${usage_cost}"
}

# Main execution
main() {
  # Read JSON input from stdin
  local input=$(cat)

  local model_display=$(echo "$input" | jq -r '.model.display_name')
  local current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
  local transcript_path=$(echo "$input" | jq -r '.transcript_path')

  local git_branch=$(get_git_branch)
  local token_count=$(get_token_summary "$transcript_path")
  local claude_usage=$(get_api_usage)

  echo "󰚩  ${model_display} |   ${current_dir##*/}${git_branch} |   ${token_count} |   ${claude_usage}"
}

main
