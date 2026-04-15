---
title: "カスタムコマンド — cmux docs"
source_url: "https://cmux.com/ja/docs/custom-commands"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# カスタムコマンド

プロジェクトルートまたは ~/.config/cmux/ に cmux.json ファイルを追加してカスタムコマンドとワークスペースレイアウトを定義します。コマンドはコマンドパレットに表示されます。

## ファイルの場所

cmux は2か所で設定を検索します：

* **プロジェクトごと：** `./cmux.json` — プロジェクトディレクトリに置かれ、優先されます
* **グローバル：** `~/.config/cmux/cmux.json` — すべてのプロジェクトに適用され、ローカルで未定義のコマンドを補完します

ローカルコマンドは同名のグローバルコマンドを上書きします。

変更は自動的に反映されます — 再起動は不要です。

## スキーマ

cmux.json ファイルには commands 配列が含まれます。各コマンドはシンプルなシェルコマンドまたは完全なワークスペース定義です：

cmux.json

```
{
  "commands": [
    {
      "name": "Start Dev",
      "keywords": ["dev", "start"],
      "workspace": { ... }
    },
    {
      "name": "Run Tests",
      "command": "npm test",
      "confirm": true
    }
  ]
}
```

## シンプルコマンド

シンプルコマンドは現在フォーカスされているターミナルでシェルコマンドを実行します：

cmux.json

```
{
  "commands": [
    {
      "name": "Run Tests",
      "keywords": ["test", "check"],
      "command": "npm test",
      "confirm": true
    }
  ]
}
```

### フィールド

* `name` — コマンドパレットに表示されます（必須）
* `description` — 任意の説明
* `keywords` — コマンドパレット用の追加検索キーワード
* `command` — フォーカスされたターミナルで実行するシェルコマンド
* `confirm` — 実行前に確認ダイアログを表示する

シンプルコマンドはフォーカスされたターミナルの現在の作業ディレクトリで実行されます。プロジェクト相対パスに依存するコマンドの場合は、先頭に `cd "$(git rev-parse --show-toplevel)" &&` を付けてリポジトリのルートから実行するか、 `cd /your/path &&` で任意のディレクトリを指定できます。

## ワークスペースコマンド

ワークスペースコマンドは、分割、ターミナル、ブラウザペインのカスタムレイアウトで新しいワークスペースを作成します：

cmux.json

```
{
  "commands": [
    {
      "name": "Dev Environment",
      "keywords": ["dev", "fullstack"],
      "restart": "confirm",
      "workspace": {
        "name": "Dev",
        "cwd": ".",
        "layout": {
          "direction": "horizontal",
          "split": 0.5,
          "children": [
            {
              "pane": {
                "surfaces": [
                  {
                    "type": "terminal",
                    "name": "Frontend",
                    "command": "npm run dev",
                    "focus": true
                  }
                ]
              }
            },
            {
              "pane": {
                "surfaces": [
                  {
                    "type": "terminal",
                    "name": "Backend",
                    "command": "cargo watch -x run",
                    "cwd": "./server",
                    "env": { "RUST_LOG": "debug" }
                  }
                ]
              }
            }
          ]
        }
      }
    }
  ]
}
```

### ワークスペースフィールド

* `name` — ワークスペースのタブ名（デフォルトはコマンド名）
* `cwd` — ワークスペースの作業ディレクトリ
* `color` — ワークスペースのタブカラー
* `layout` — 分割とペインを定義するレイアウトツリー

### 再起動の動作

同名のワークスペースが既に存在する場合の動作を制御します：

* `"ignore"` — 既存のワークスペースに切り替える（デフォルト）
* `"recreate"` — 確認なしに閉じて再作成する
* `"confirm"` — 再作成前にユーザーに確認する

## レイアウトツリー

レイアウトツリーは、再帰的な分割ノードを使用してペインの配置を定義します：

### 分割ノード

スペースを2つの子に分割します：

* `direction` — `"horizontal"` または `"vertical"`
* `split` — 分割位置（0.1〜0.9、デフォルト0.5）
* `children` — 正確に2つの子ノード（分割またはペイン）

### ペインノード

1つ以上のサーフェス（ペイン内のタブ）を含むリーフノード。

## サーフェス定義

ペイン内の各サーフェスはターミナルまたはブラウザです：

* `type` — `"terminal"` または `"browser"`
* `name` — カスタムタブタイトル
* `command` — 作成時に自動実行するシェルコマンド（ターミナルのみ）
* `cwd` — このサーフェスの作業ディレクトリ
* `env` — キーと値のペアとしての環境変数
* `url` — 開くURL（ブラウザのみ）
* `focus` — 作成後にこのサーフェスにフォーカスする

### 作業ディレクトリの解決

* `.` または 省略 — ワークスペースの作業ディレクトリ
* `./subdir` — ワークスペースの作業ディレクトリからの相対パス
* `~/path` — ホームディレクトリに展開
* 絶対パス — そのまま使用

## 完全な例

cmux.json

```
{
  "commands": [
    {
      "name": "Web Dev",
      "description": "Docs site with live preview",
      "keywords": ["web", "docs", "next", "frontend"],
      "restart": "confirm",
      "workspace": {
        "name": "Web Dev",
        "cwd": "./web",
        "color": "#3b82f6",
        "layout": {
          "direction": "horizontal",
          "split": 0.5,
          "children": [
            {
              "pane": {
                "surfaces": [
                  {
                    "type": "terminal",
                    "name": "Next.js",
                    "command": "npm run dev",
                    "focus": true
                  }
                ]
              }
            },
            {
              "direction": "vertical",
              "split": 0.6,
              "children": [
                {
                  "pane": {
                    "surfaces": [
                      {
                        "type": "browser",
                        "name": "Preview",
                        "url": "http://localhost:3777"
                      }
                    ]
                  }
                },
                {
                  "pane": {
                    "surfaces": [
                      {
                        "type": "terminal",
                        "name": "Shell",
                        "env": { "NODE_ENV": "development" }
                      }
                    ]
                  }
                }
              ]
            }
          ]
        }
      }
    },
    {
      "name": "Debug Log",
      "description": "Tail the debug event log from the running dev app",
      "keywords": ["log", "debug", "tail", "events"],
      "restart": "ignore",
      "workspace": {
        "name": "Debug Log",
        "layout": {
          "direction": "horizontal",
          "split": 0.5,
          "children": [
            {
              "pane": {
                "surfaces": [
                  {
                    "type": "terminal",
                    "name": "Events",
                    "command": "tail -f /tmp/cmux-debug.log",
                    "focus": true
                  }
                ]
              }
            },
            {
              "pane": {
                "surfaces": [
                  {
                    "type": "terminal",
                    "name": "Shell"
                  }
                ]
              }
            }
          ]
        }
      }
    },
    {
      "name": "Setup",
      "description": "Initialize submodules and build dependencies",
      "keywords": ["setup", "init", "install"],
      "command": "./scripts/setup.sh",
      "confirm": true
    },
    {
      "name": "Reload",
      "description": "Build and launch the debug app tagged to the current branch",
      "keywords": ["reload", "build", "run", "launch"],
      "command": "./scripts/reload.sh --tag $(git branch --show-current)"
    },
    {
      "name": "Run Unit Tests",
      "keywords": ["test", "unit"],
      "command": "./scripts/test-unit.sh",
      "confirm": true
    }
  ]
}
```

[←設定](https://cmux.com/ja/docs/configuration.html)[キーボードショートカット→](https://cmux.com/ja/docs/keyboard-shortcuts.html)
