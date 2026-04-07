---
title: "Claude Code Teams - cmux — cmux docs"
source_url: "https://cmux.com/ja/docs/agent-integrations/claude-code-teams"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# Claude Code Teams

cmux claude-teamsはエージェントチームを有効にしてClaude Codeを起動します。Claudeがチームメイトエージェントを生成すると、tmuxペインではなくネイティブのcmuxスプリットとして表示され、サイドバーのメタデータや通知が利用できます。

[](https://cmux.com/blog/cmux-claude-teams-demo.mp4)

## 使い方

```
cmux claude-teams
cmux claude-teams --continue
cmux claude-teams --model sonnet
```

claude-teamsの後のすべての引数はClaude Codeに転送されます。コマンドはteammate modeをautoに設定し、Claudeがcmuxスプリットを使用する環境を構成します。

## 仕組み

cmux claude-teamsはtmux shimスクリプトを作成し、Claude Codeがtmux内で動作していると認識するよう環境を構成します。Claudeがチームメイトペインを管理するためにtmuxコマンドを発行すると、shimがそれをcmuxソケットAPIコールに変換します。

* ~/.cmuxterm/claude-teams-bin/tmuxにtmux shimを作成し、cmux \_\_tmux-compatにリダイレクト
* TMUXとTMUX\_PANE環境変数を設定してtmuxセッションをシミュレート
* shimディレクトリをPATHの先頭に追加し、Claudeが本物のtmuxより先にshimを見つけるようにする
* CLAUDE\_CODE\_EXPERIMENTAL\_AGENT\_TEAMS=1を有効にし、teammate modeをautoに設定

## 環境変数

| 変数 | 目的 |
| --- | --- |
| `TMUX` | 現在のcmuxワークスペースとペインをエンコードした偽のtmuxソケットパス |
| `TMUX_PANE` | 現在のcmuxペインにマッピングされた偽のtmuxペイン識別子 |
| `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` | Claude Codeエージェントチーム機能を有効にする |
| `CMUX_SOCKET_PATH` | shimが接続するcmuxコントロールソケットのパス |

## ディレクトリ

| パス | 目的 |
| --- | --- |
| `~/.cmuxterm/claude-teams-bin/` | tmuxコマンドをcmux APIコールに変換するtmux shimスクリプトを含む |
| `~/.cmuxterm/tmux-compat-store.json` | tmux-compatバッファとフックの永続ストレージ |

## 対応するtmuxコマンド

shimは以下のtmuxコマンドをcmux操作に変換します：

* `new-session`, `new-window` → 新しいcmuxワークスペースを作成
* `split-window` → 現在のcmuxペインを分割
* `send-keys` → cmuxサーフェスにテキストを送信
* `capture-pane` → cmuxサーフェスからターミナルテキストを読み取り
* `select-pane`, `select-window` → cmuxペインまたはワークスペースにフォーカス
* `kill-pane`, `kill-window` → cmuxサーフェスまたはワークスペースを閉じる
* `list-panes`, `list-windows` → cmuxペインまたはワークスペースを一覧表示

[←SSH](https://cmux.com/ja/docs/ssh.html)[oh-my-opencode→](https://cmux.com/ja/docs/agent-integrations/oh-my-opencode.html)
