---
title: "通知 — cmux docs"
source_url: "https://cmux.com/ja/docs/notifications"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# 通知

cmuxはデスクトップ通知をサポートしており、AIエージェントやスクリプトが注意を必要とするときに通知できます。

## ライフサイクル

1. 受信：通知がパネルに表示され、デスクトップアラートが発火（抑制されていない場合）
2. 未読：ワークスペースタブにバッジを表示
3. 既読：そのワークスペースを表示するとクリア
4. クリア済み：パネルから削除

### 抑制

デスクトップアラートは以下の場合に抑制されます：

* cmuxウィンドウにフォーカスがある
* 通知を送信した特定のワークスペースがアクティブ
* 通知パネルが開いている

### 通知パネル

`⌘⇧I`を押して通知パネルを開きます。通知をクリックするとそのワークスペースにジャンプします。`⌘⇧U`を押すと、最新の未読通知があるワークスペースに直接ジャンプします。

## カスタムコマンド

通知がスケジュールされるたびにシェルコマンドを実行できます。設定 > アプリ > 通知コマンドで設定してください。コマンドは/bin/sh -cで実行され、以下の環境変数が使用可能です：

| 変数 | 説明 |
| --- | --- |
| `CMUX_NOTIFICATION_TITLE` | 通知タイトル（ワークスペース名またはアプリ名） |
| `CMUX_NOTIFICATION_SUBTITLE` | 通知サブタイトル |
| `CMUX_NOTIFICATION_BODY` | 通知本文 |

Examples

```
# Text-to-speech
say "$CMUX_NOTIFICATION_TITLE"

# Custom sound file
afplay /path/to/sound.aiff

# Log to file
echo "$CMUX_NOTIFICATION_TITLE: $CMUX_NOTIFICATION_BODY" >> ~/notifications.log
```

コマンドはシステムサウンドピッカーとは独立して実行されます。カスタムコマンドのみを使用する場合はピッカーを「なし」に設定し、システムサウンドとカスタムアクションの両方を使用する場合は両方を有効にしてください。

## 通知の送信

### CLI

```
cmux notify --title "Task Complete" --body "Your build finished"
cmux notify --title "Claude Code" --subtitle "Waiting" --body "Agent needs input"
```

### OSC 777（シンプル）

RXVTプロトコルはタイトルと本文の固定フォーマットを使用します：

```
printf '\e]777;notify;My Title;Message body here\a'
```

Shell function

```
notify_osc777() {
    local title="$1"
    local body="$2"
    printf '\e]777;notify;%s;%s\a' "$title" "$body"
}

notify_osc777 "Build Complete" "All tests passed"
```

### OSC 99（リッチ）

Kittyプロトコルはサブタイトルと通知IDをサポートします：

```
# Format: ESC ] 99 ; <params> ; <payload> ESC \

# Simple notification
printf '\e]99;i=1;e=1;d=0:Hello World\e\\'

# With title, subtitle, and body
printf '\e]99;i=1;e=1;d=0;p=title:Build Complete\e\\'
printf '\e]99;i=1;e=1;d=0;p=subtitle:Project X\e\\'
printf '\e]99;i=1;e=1;d=1;p=body:All tests passed\e\\'
```

| 機能 | OSC 99 | OSC 777 |
| --- | --- | --- |
| タイトル + 本文 | あり | あり |
| サブタイトル | あり | なし |
| 通知ID | あり | なし |
| 複雑さ | 高い | 低い |

シンプルな通知にはOSC 777を使用してください。サブタイトルや通知IDが必要な場合はOSC 99を使用してください。最も簡単な連携にはCLI（cmux notify）を使用してください。

## Claude Codeフック

cmuxは[Claude Code](https://docs.anthropic.com/en/docs/claude-code)とフックで連携し、タスク完了時に通知します。

### 1. フックスクリプトの作成

~/.claude/hooks/cmux-notify.sh

```
#!/bin/bash
# Skip if not in cmux
[ -S /tmp/cmux.sock ] || exit 0

EVENT=$(cat)
EVENT_TYPE=$(echo "$EVENT" | jq -r '.hook_event_name // "unknown"')
TOOL=$(echo "$EVENT" | jq -r '.tool_name // ""')

case "$EVENT_TYPE" in
    "Stop")
        cmux notify --title "Claude Code" --body "Session complete"
        ;;
    "PostToolUse")
        [ "$TOOL" = "Task" ] && cmux notify --title "Claude Code" --body "Agent finished"
        ;;
esac
```

```
chmod +x ~/.claude/hooks/cmux-notify.sh
```

### 2. Claude Codeの設定

~/.claude/settings.json

```
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/hooks/cmux-notify.sh"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Task",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/hooks/cmux-notify.sh"
          }
        ]
      }
    ]
  }
}
```

フックを適用するにはClaude Codeを再起動してください。

## GitHub Copilot CLI

Copilot CLIは、プロンプト送信、エージェント停止、エラーなどのライフサイクルイベントでシェルコマンドを実行する[フック](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/use-hooks)をサポートしています。

~/.copilot/config.json

```
{
  "hooks": {
    "userPromptSubmitted": [
      {
        "type": "command",
        "bash": "if command -v cmux &>/dev/null; then cmux set-status copilot_cli Running; fi",
        "timeoutSec": 3
      }
    ],
    "agentStop": [
      {
        "type": "command",
        "bash": "if command -v cmux &>/dev/null; then cmux notify --title 'Copilot CLI' --body 'Done'; cmux set-status copilot_cli Idle; fi",
        "timeoutSec": 5
      }
    ],
    "errorOccurred": [
      {
        "type": "command",
        "bash": "if command -v cmux &>/dev/null; then cmux notify --title 'Copilot CLI' --subtitle 'Error' --body 'An error occurred'; cmux set-status copilot_cli Error; fi",
        "timeoutSec": 5
      }
    ],
    "sessionEnd": [
      {
        "type": "command",
        "bash": "if command -v cmux &>/dev/null; then cmux clear-status copilot_cli; fi",
        "timeoutSec": 3
      }
    ]
  }
}
```

リポジトリレベルのフックには、同じ構造で.github/hooks/notify.jsonファイルを作成してください：

.github/hooks/notify.json

```
{
  "version": 1,
  "hooks": {
    "userPromptSubmitted": [ ... ],
    "agentStop": [ ... ]
  }
}
```

## 連携の例

### 長時間コマンド後の通知

~/.zshrc

```
# Add to your shell config
notify-after() {
  "$@"
  local exit_code=$?
  if [ $exit_code -eq 0 ]; then
    cmux notify --title "✓ Command Complete" --body "$1"
  else
    cmux notify --title "✗ Command Failed" --body "$1 (exit $exit_code)"
  fi
  return $exit_code
}

# Usage: notify-after npm run build
```

### Python

python

```
import sys

def notify(title: str, body: str):
    """Send OSC 777 notification."""
    sys.stdout.write(f'\x1b]777;notify;{title};{body}\x07')
    sys.stdout.flush()

notify("Script Complete", "Processing finished")
```

### Node.js

node

```
function notify(title, body) {
  process.stdout.write(`\x1b]777;notify;${title};${body}\x07`);
}

notify('Build Done', 'webpack finished');
```

### tmuxパススルー

cmux内でtmuxを使用する場合、パススルーを有効にしてください：

.tmux.conf

```
set -g allow-passthrough on
```

```
printf '\ePtmux;\e\e]777;notify;Title;Body\a\e\\'
```

[←ブラウザ自動化](https://cmux.com/ja/docs/browser-automation.html)[SSH→](https://cmux.com/ja/docs/ssh.html)
