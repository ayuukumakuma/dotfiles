#!/bin/bash

claude_pid=$(ps aux | grep -E "^\S+\s+\S+.*\sclaude$" | grep -v grep | awk '{print $2}' | head -1)
if [ -z "$claude_pid" ]; then
  osascript -e 'display notification "プロセスが見つかりません" with title "Claude Code"'
  exit 1
fi

# プロセスツリーをたどって親アプリケーションを探す
current_pid=$claude_pid
while [ "$current_pid" != "" ] && [ "$current_pid" != "1" ]; do
  cmd=$(ps -p "$current_pid" -o command= 2>/dev/null)

  # .appを含むパスを見つけたらそれを使用
  if [[ "$cmd" == *".app/"* ]]; then
    bundle_path=$(echo "$cmd" | grep -o '/[^"]*\.app' | head -1)
    if [ -n "$bundle_path" ] && [ -d "$bundle_path" ]; then
      open -a "$bundle_path"
      exit 0
    fi
  fi

  # 親プロセスに移動
  current_pid=$(ps -p "$current_pid" -o ppid= | tr -d ' ')
done

# アプリが見つからない場合
osascript -e 'display notification "アプリが見つかりませんでした" with title "Claude Code"'
exit 1
