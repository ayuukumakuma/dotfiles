---
title: "oh-my-claudecode - cmux — cmux docs"
source_url: "https://cmux.com/ja/docs/agent-integrations/oh-my-claudecode"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# oh-my-claudecode

cmux omcはOh My Claude Code (OMC)をcmux対応環境で起動します。OMCは19の専門エージェント、スマートモデルルーティング、tmuxベースのチームパイプラインを持つClaude Codeのマルチエージェントオーケストレーションシステムです。チームペインはネイティブのcmuxスプリットになります。

## 使い方

```
cmux omc
cmux omc team 3:claude "implement feature"
cmux omc --watch
```

omcの後のすべての引数はomc CLIに転送されます。

## 機能

OMCのチームモードはtmuxでペイン管理します。cmux omcではネイティブcmuxスプリットになります：

* チームワーカーペイン（Claude/Codex/Geminiセッション）がワークスペース内のcmuxスプリットとして表示
* HUDモニタリング表示がスプリットペインでライブステータスを表示
* 自動レイアウト管理がエージェントペインをメインバーティカルグリッドに配置
* エージェントが横で動作している間、メインセッションはプライマリペインに維持

## 前提条件

```
npm install -g oh-my-claude-sisyphus
```

OMCにはClaude Code CLIのインストールと認証が必要です。

## 仕組み

cmux claude-teamsと同じパターンです。tmux shimがOMCからのtmuxコマンドを傍受し、cmux APIコールに変換します。

* ~/.cmuxterm/omc-bin/tmuxにtmux shimを作成
* TMUXとTMUX\_PANE環境変数を設定
* shimディレクトリをPATHの先頭に追加
* Claude Code互換性のためNODE\_OPTIONSリストアモジュールを注入
* すべての引数を転送してomcにexec

## ディレクトリ

| パス | 目的 |
| --- | --- |
| `~/.cmuxterm/omc-bin/` | tmux shimスクリプトを含む |
| `~/.cmuxterm/tmux-compat-store.json` | tmux-compatバッファとフックの永続ストレージ |

## 環境変数

| 変数 | 目的 |
| --- | --- |
| `TMUX` | 現在のcmuxワークスペースとペインをエンコードした偽のtmuxソケットパス |
| `TMUX_PANE` | 現在のcmuxペインにマッピングされた偽のtmuxペイン識別子 |
| `CMUX_SOCKET_PATH` | shimが接続するcmuxコントロールソケットのパス |

[←oh-my-codex](https://cmux.com/ja/docs/agent-integrations/oh-my-codex.html)[変更履歴→](https://cmux.com/ja/docs/changelog.html)
