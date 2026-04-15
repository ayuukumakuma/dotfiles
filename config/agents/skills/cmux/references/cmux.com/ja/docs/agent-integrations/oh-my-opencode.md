---
title: "oh-my-opencode - cmux — cmux docs"
source_url: "https://cmux.com/ja/docs/agent-integrations/oh-my-opencode"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# oh-my-opencode

cmux omoはoh-my-openagentプラグインを有効にしてcmux対応環境でOpenCodeを起動します。oh-my-openagentは複数のAIモデル（Claude、GPT、Gemini、Grok）を専門エージェントとして並列にオーケストレーションします。エージェントペインはネイティブのcmuxスプリットになります。

[](https://cmux.com/blog/cmux-omo-demo.mp4)

## 使い方

```
cmux omo
cmux omo --continue
cmux omo --model claude-sonnet-4-6
```

omoの後のすべての引数はOpenCodeに転送されます。

## What you get

oh-my-openagent's TmuxSessionManager spawns each background agent in its own pane. With cmux omo, those panes become native cmux splits instead of tmux panes:

* Each subagent (Hephaestus, Atlas, Oracle, etc.) gets its own cmux split, visible in the workspace
* Auto-layout management: agents are arranged in a grid (main-vertical by default) and resized as agents come and go
* Idle agents are automatically cleaned up after 3 consecutive idle polls with no new messages
* If the window is too small for a new agent pane, it queues and retries every 2 seconds until space is available
* Your main session stays in the primary pane while agents work beside it

## 初回実行

初回実行時、cmux omoはoh-my-opencodeプラグインを自動的にセットアップします：

1. ~/.cmuxterm/omo-config/にoh-my-opencodeをプラグイン配列に登録したシャドウ設定を作成
2. oh-my-opencode npmパッケージがない場合、bunまたはnpmでインストール
3. 元の~/.config/opencode/ディレクトリからnode\_modules、package.json、プラグイン設定をシンボリックリンク
4. Enables tmux mode in the oh-my-opencode config (tmux.enabled defaults to false, cmux omo turns it on)

元の~/.config/opencode/設定は変更されません。通常のopencode実行は以前と同じように動作します。

## 仕組み

cmux claude-teamsと同じパターンです。tmux shimがoh-my-openagentのTmuxSessionManagerからのtmuxコマンドを傍受し、cmux APIコールに変換します。

* ~/.cmuxterm/omo-bin/tmuxにtmux shimを作成
* TMUXとTMUX\_PANE環境変数を設定
* OPENCODE\_CONFIG\_DIRをoh-my-opencodeが有効なシャドウ設定に指定
* shimディレクトリをPATHの先頭に追加してopencodeにexec
* Prepends the shim directory to PATH and execs into opencode

## ディレクトリ

| パス | 目的 |
| --- | --- |
| `~/.cmuxterm/omo-bin/` | tmux shimスクリプトを含む |
| `~/.cmuxterm/omo-config/` | oh-my-opencodeプラグインが登録されたOpenCodeのシャドウ設定（元の設定へのシンボリックリンク） |
| `~/.cmuxterm/tmux-compat-store.json` | tmux-compatバッファとフックの永続ストレージ |

## シャドウ設定

cmux omoはシャドウ設定ディレクトリを使用するため、元のOpenCode設定には影響しません：

* ~/.config/opencode/opencode.jsonをコピーし、プラグイン配列にoh-my-opencodeを追加
* 元のディレクトリからnode\_modules、package.json、bun.lockをシンボリックリンク
* opencode起動前にOPENCODE\_CONFIG\_DIRをシャドウディレクトリに設定
* Sets OPENCODE\_CONFIG\_DIR to the shadow directory before launching opencode

## 環境変数

| 変数 | 目的 |
| --- | --- |
| `TMUX` | 現在のcmuxワークスペースとペインをエンコードした偽のtmuxソケットパス |
| `TMUX_PANE` | 現在のcmuxペインにマッピングされた偽のtmuxペイン識別子 |
| `OPENCODE_CONFIG_DIR` | oh-my-opencodeが有効なシャドウ設定ディレクトリを指す |
| `CMUX_SOCKET_PATH` | shimが接続するcmuxコントロールソケットのパス |

[←Claude Code Teams](https://cmux.com/ja/docs/agent-integrations/claude-code-teams.html)[oh-my-codex→](https://cmux.com/ja/docs/agent-integrations/oh-my-codex.html)
