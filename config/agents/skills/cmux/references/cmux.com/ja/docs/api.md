---
title: "APIリファレンス — cmux docs"
source_url: "https://cmux.com/ja/docs/api"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# APIリファレンス

cmuxはCLIツールとUnix socketの両方をプログラム制御に提供します。すべてのコマンドは両方のインターフェースから利用可能です。

## Socket

| ビルド | パス |
| --- | --- |
| リリース | `/tmp/cmux.sock` |
| デバッグ | `/tmp/cmux-debug.sock` |
| タグ付きデバッグビルド | `/tmp/cmux-debug-<tag>.sock` |

CMUX\_SOCKET\_PATH環境変数で上書きできます。呼び出しごとに1つの改行区切りJSONリクエストを送信します：

```
{"id":"req-1","method":"workspace.list","params":{}}
// Response:
{"id":"req-1","ok":true,"result":{"workspaces":[...]}}
```

JSON socketリクエストにはmethodとparamsを使用する必要があります。`{"command":"..."}`などのレガシーv1 JSONペイロードはサポートされていません。

## アクセスモード

| モード | 説明 | 有効化方法 |
| --- | --- | --- |
| **Off** | Socketを無効化 | 設定UIまたはCMUX\_SOCKET\_MODE=off |
| **cmux processes only** | cmuxターミナル内で起動されたプロセスのみ接続可能。 | 設定UIのデフォルトモード |
| **allowAll** | ローカルプロセスすべての接続を許可（祖先チェックなし）。 | 環境変数のみで設定：CMUX\_SOCKET\_MODE=allowAll |

共有マシンではオフまたはcmuxプロセスのみを使用してください。

## CLIオプション

| フラグ | 説明 |
| --- | --- |
| `--socket PATH` | カスタムsocketパス |
| `--json` | JSON形式で出力 |
| `--window ID` | 特定のウィンドウを対象にする |
| `--workspace ID` | 特定のワークスペースを対象にする |
| `--surface ID` | 特定のサーフェスを対象にする |
| `--id-format refs|uuids|both` | JSON出力での識別子フォーマットを制御 |

## ワークスペースコマンド

#### list-workspaces

すべてのワークスペースを一覧表示。

CLI

```
cmux list-workspaces
cmux list-workspaces --json
```

Socket

```
{"id":"ws-list","method":"workspace.list","params":{}}
```

#### new-workspace

新しいワークスペースを作成。

CLI

```
cmux new-workspace
```

Socket

```
{"id":"ws-new","method":"workspace.create","params":{}}
```

#### select-workspace

特定のワークスペースに切り替え。

CLI

```
cmux select-workspace --workspace <id>
```

Socket

```
{"id":"ws-select","method":"workspace.select","params":{"workspace_id":"<id>"}}
```

#### current-workspace

現在アクティブなワークスペースを取得。

CLI

```
cmux current-workspace
cmux current-workspace --json
```

Socket

```
{"id":"ws-current","method":"workspace.current","params":{}}
```

#### close-workspace

ワークスペースを閉じる。

CLI

```
cmux close-workspace --workspace <id>
```

Socket

```
{"id":"ws-close","method":"workspace.close","params":{"workspace_id":"<id>"}}
```

## 分割コマンド

#### new-split

新しい分割ペインを作成。方向：left、right、up、down。

CLI

```
cmux new-split right
cmux new-split down
```

Socket

```
{"id":"split-new","method":"surface.split","params":{"direction":"right"}}
```

#### list-surfaces

現在のワークスペースのすべてのサーフェスを一覧表示。

CLI

```
cmux list-surfaces
cmux list-surfaces --json
```

Socket

```
{"id":"surface-list","method":"surface.list","params":{}}
```

#### focus-surface

特定のサーフェスにフォーカス。

CLI

```
cmux focus-surface --surface <id>
```

Socket

```
{"id":"surface-focus","method":"surface.focus","params":{"surface_id":"<id>"}}
```

## 入力コマンド

#### send

フォーカス中のターミナルにテキスト入力を送信。

CLI

```
cmux send "echo hello"
cmux send "ls -la\n"
```

Socket

```
{"id":"send-text","method":"surface.send_text","params":{"text":"echo hello\n"}}
```

#### send-key

キー入力を送信。キー：enter、tab、escape、backspace、delete、up、down、left、right。

CLI

```
cmux send-key enter
```

Socket

```
{"id":"send-key","method":"surface.send_key","params":{"key":"enter"}}
```

#### send-surface

特定のサーフェスにテキストを送信。

CLI

```
cmux send-surface --surface <id> "command"
```

Socket

```
{"id":"send-surface","method":"surface.send_text","params":{"surface_id":"<id>","text":"command"}}
```

#### send-key-surface

特定のサーフェスにキー入力を送信。

CLI

```
cmux send-key-surface --surface <id> enter
```

Socket

```
{"id":"send-key-surface","method":"surface.send_key","params":{"surface_id":"<id>","key":"enter"}}
```

## 通知コマンド

#### notify

通知を送信。

CLI

```
cmux notify --title "Title" --body "Body"
cmux notify --title "T" --subtitle "S" --body "B"
```

Socket

```
{"id":"notify","method":"notification.create","params":{"title":"Title","subtitle":"S","body":"Body"}}
```

#### list-notifications

すべての通知を一覧表示。

CLI

```
cmux list-notifications
cmux list-notifications --json
```

Socket

```
{"id":"notif-list","method":"notification.list","params":{}}
```

#### clear-notifications

すべての通知をクリア。

CLI

```
cmux clear-notifications
```

Socket

```
{"id":"notif-clear","method":"notification.clear","params":{}}
```

## サイドバーメタデータコマンド

任意のワークスペースのサイドバーにステータスピル、プログレスバー、ログエントリを設定します。ビルドスクリプト、CI連携、状態を一目で確認したいAIコーディングエージェントに便利です。

#### set-status

サイドバーのステータスピルを設定。ツールごとに独自のエントリを管理できるよう、一意のキーを使用してください。

CLI

```
cmux set-status build "compiling" --icon hammer --color "#ff9500"
cmux set-status deploy "v1.2.3" --workspace workspace:2
```

Socket

```
set_status build compiling --icon=hammer --color=#ff9500 --tab=<workspace-uuid>
```

#### clear-status

キーを指定してサイドバーのステータスエントリを削除。

CLI

```
cmux clear-status build
```

Socket

```
clear_status build --tab=<workspace-uuid>
```

#### list-status

ワークスペースのすべてのサイドバーステータスエントリを一覧表示。

CLI

```
cmux list-status
```

Socket

```
list_status --tab=<workspace-uuid>
```

#### set-progress

サイドバーにプログレスバーを設定（0.0〜1.0）。

CLI

```
cmux set-progress 0.5 --label "Building..."
cmux set-progress 1.0 --label "Done"
```

Socket

```
set_progress 0.5 --label=Building... --tab=<workspace-uuid>
```

#### clear-progress

サイドバーのプログレスバーをクリア。

CLI

```
cmux clear-progress
```

Socket

```
clear_progress --tab=<workspace-uuid>
```

#### log

サイドバーにログエントリを追加。レベル：info、progress、success、warning、error。

CLI

```
cmux log "Build started"
cmux log --level error --source build "Compilation failed"
cmux log --level success -- "All 42 tests passed"
```

Socket

```
log --level=error --source=build --tab=<workspace-uuid> -- Compilation failed
```

#### clear-log

すべてのサイドバーログエントリをクリア。

CLI

```
cmux clear-log
```

Socket

```
clear_log --tab=<workspace-uuid>
```

#### list-log

サイドバーのログエントリを一覧表示。

CLI

```
cmux list-log
cmux list-log --limit 5
```

Socket

```
list_log --limit=5 --tab=<workspace-uuid>
```

#### sidebar-state

すべてのサイドバーメタデータをダンプ（cwd、gitブランチ、ポート、ステータス、プログレス、ログ）。

CLI

```
cmux sidebar-state
cmux sidebar-state --workspace workspace:2
```

Socket

```
sidebar_state --tab=<workspace-uuid>
```

## ユーティリティコマンド

#### ping

cmuxが実行中で応答可能か確認。

CLI

```
cmux ping
```

Socket

```
{"id":"ping","method":"system.ping","params":{}}
// Response: {"id":"ping","ok":true,"result":{"pong":true}}
```

#### capabilities

利用可能なsocketメソッドと現在のアクセスモードを一覧表示。

CLI

```
cmux capabilities
cmux capabilities --json
```

Socket

```
{"id":"caps","method":"system.capabilities","params":{}}
```

#### identify

フォーカス中のウィンドウ/ワークスペース/ペイン/サーフェスのコンテキストを表示。

CLI

```
cmux identify
cmux identify --json
```

Socket

```
{"id":"identify","method":"system.identify","params":{}}
```

## 環境変数

| 変数 | 説明 |
| --- | --- |
| `CMUX_SOCKET_PATH` | CLIや連携ツールが使用するsocketパスを上書き |
| `CMUX_SOCKET_ENABLE` | socketを強制的に有効/無効化（1/0、true/false、on/off） |
| `CMUX_SOCKET_MODE` | アクセスモードを上書き（cmuxOnly、allowAll、off）。cmux-only/cmux\_onlyやallow-all/allow\_allも使用可能 |
| `CMUX_WORKSPACE_ID` | 自動設定：現在のワークスペースID |
| `CMUX_SURFACE_ID` | 自動設定：現在のサーフェスID |
| `TERM_PROGRAM` | ghosttyに設定 |
| `TERM` | xterm-ghosttyに設定 |

レガシーのCMUX\_SOCKET\_MODE値fullとnotificationsは互換性のため引き続き使用可能です。

## cmuxの検出

bash

```
# Prefer explicit socket path if set
SOCK="${CMUX_SOCKET_PATH:-/tmp/cmux.sock}"
[ -S "$SOCK" ] && echo "Socket available"

# Check for the CLI
command -v cmux &>/dev/null && echo "cmux available"

# In cmux-managed terminals these are auto-set
[ -n "${CMUX_WORKSPACE_ID:-}" ] && [ -n "${CMUX_SURFACE_ID:-}" ] && echo "Inside cmux surface"

# Distinguish from regular Ghostty
[ "$TERM_PROGRAM" = "ghostty" ] && [ -n "${CMUX_WORKSPACE_ID:-}" ] && echo "In cmux"
```

## 使用例

### Pythonクライアント

python

```
import json
import os
import socket

SOCKET_PATH = os.environ.get("CMUX_SOCKET_PATH", "/tmp/cmux.sock")

def rpc(method, params=None, req_id=1):
    payload = {"id": req_id, "method": method, "params": params or {}}
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
        sock.connect(SOCKET_PATH)
        sock.sendall(json.dumps(payload).encode("utf-8") + b"\n")
        return json.loads(sock.recv(65536).decode("utf-8"))

# List workspaces
print(rpc("workspace.list", req_id="ws"))

# Send notification
print(rpc(
    "notification.create",
    {"title": "Hello", "body": "From Python!"},
    req_id="notify"
))
```

### シェルスクリプト

bash

```
#!/bin/bash
SOCK="${CMUX_SOCKET_PATH:-/tmp/cmux.sock}"

cmux_cmd() {
    printf "%s\n" "$1" | nc -U "$SOCK"
}

cmux_cmd '{"id":"ws","method":"workspace.list","params":{}}'
cmux_cmd '{"id":"notify","method":"notification.create","params":{"title":"Done","body":"Task complete"}}'
```

### 通知付きビルドスクリプト

bash

```
#!/bin/bash
npm run build
if [ $? -eq 0 ]; then
    cmux notify --title "✓ Build Success" --body "Ready to deploy"
else
    cmux notify --title "✗ Build Failed" --body "Check the logs"
fi
```

[←キーボードショートカット](https://cmux.com/ja/docs/keyboard-shortcuts.html)[ブラウザ自動化→](https://cmux.com/ja/docs/browser-automation.html)
