---
title: "oh-my-codex - cmux — cmux docs"
source_url: "https://cmux.com/ja/docs/agent-integrations/oh-my-codex"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# oh-my-codex

cmux omxはOh My Codex (OMX)をcmux対応環境で起動します。OMXは30以上の専門エージェントロール、ワークフロースキル、tmuxベースの並列チーム実行を持つOpenAI Codex CLIのマルチエージェントオーケストレーションレイヤーです。チームペインやHUDはネイティブのcmuxスプリットになります。

## 使い方

```
cmux omx
cmux omx --madmax --high
cmux omx team
```

omxの後のすべての引数はomx CLIに転送されます。

## 機能

OMXのチームモードとHUDはtmuxでペイン管理します。cmux omxではネイティブcmuxスプリットになります：

* チームワーカーペイン（Codex/Claudeセッション）がワークスペース内のcmuxスプリットとして表示
* HUDステータス表示がスプリットペインでモデル、ブランチ、コンテキスト、トークン使用量を表示
* 自動レイアウト管理がエージェントペインをメインバーティカルグリッドに配置
* ワーカーが横で動作している間、メインセッションはプライマリペインに維持

## 前提条件

```
npm install -g @openai/codex oh-my-codex
omx setup
omx doctor
```

OMXにはOpenAI Codex CLIと有効なCodex認証設定が必要です。omx doctorでインストールを確認してください。

## 仕組み

他のcmuxエージェント連携と同じパターンです。tmux shimがOMXからのtmuxコマンドを傍受し、cmux APIコールに変換します。

* ~/.cmuxterm/omx-bin/tmuxにtmux shimを作成
* TMUXとTMUX\_PANE環境変数を設定
* shimディレクトリをPATHの先頭に追加
* すべての引数を転送してomxにexec

## ディレクトリ

| パス | 目的 |
| --- | --- |
| `~/.cmuxterm/omx-bin/` | tmux shimスクリプトを含む |
| `~/.cmuxterm/tmux-compat-store.json` | tmux-compatバッファとフックの永続ストレージ |

## 環境変数

| 変数 | 目的 |
| --- | --- |
| `TMUX` | 現在のcmuxワークスペースとペインをエンコードした偽のtmuxソケットパス |
| `TMUX_PANE` | 現在のcmuxペインにマッピングされた偽のtmuxペイン識別子 |
| `CMUX_SOCKET_PATH` | shimが接続するcmuxコントロールソケットのパス |

[←oh-my-opencode](https://cmux.com/ja/docs/agent-integrations/oh-my-opencode.html)[oh-my-claudecode→](https://cmux.com/ja/docs/agent-integrations/oh-my-claudecode.html)
