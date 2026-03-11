# 開発環境現状確認 2026/03

2026年3月時点のこの開発環境は、単なる shell や editor の設定集ではなく、AI ツール、通知、状態表示、ウィンドウ配置まで含めて制御する repo になっている。  
Nix、Home Manager、Homebrew の役割分担は土台として触れるが、記事の主役はその上に載せている独自の運用レイヤーに置く。  
特に `agents/skills` の多重配布、Claude/Codex の運用設計、`claude_state.json` を起点にした可視化まわりを中心に書く。  

## はじめに: 2026年3月の dotfiles は「設定集」ではなく「開発環境の制御層」になった

従来の dotfiles 紹介のように shell や editor を並べるのではなく、AI クライアントの設定、通知、メニューバー表示、ワークスペース配置まで repo で持つようになった、という変化を最初に置く。  
`nix-darwin + Home Manager + Homebrew + Fish` は導入だけに留め、この repo でしかやっていない接続部分を本題にする。  

## 全体像: Nix、Home Manager、Homebrew で何をどう分担しているか

macOS の system defaults は `nix/nix-darwin/system.nix`、dotfiles 配置は `nix/nix-darwin/home-manager/files.nix`、GUI アプリや一部 CLI は `nix/nix-darwin/homebrew.nix` で分担している。  
`~/.config/*` だけでなく `~/.claude`、`~/.codex`、`~/.agents` まで Home Manager 管理に含めているのが、この repo の土台になっている。  

## この dotfiles の核: AI 開発環境を dotfiles に載せている

`agents/skills` を `~/.claude/skills` と `~/.cursor/skills` に同時に配っていて、スキルをクライアントごとに複製せず 1 箇所で持つ構成にしている。  
AI ツールを個別に設定するのではなく、dotfiles 側に引き戻して運用ルールごと管理する、というのがこの repo のいちばん大きい特徴になっている。  

## Claude と Codex をどう運用しているか

Claude は `claude/settings.json` で default plan mode、強めの deny 設定、hook 実行、独自 status line をまとめて持ち、単なる好み設定ではなく運用ポリシーとして管理している。  
Codex は `codex/config.toml` で `web_search = "live"`、`multi_agent = true`、`js_repl = true`、trusted project 群を明示していて、日常利用前提の設定になっている。  
Claude の `statusline.sh` がモデル名、git 状態、context 使用量、5h/7d usage をまとめて出している点も、この章の見どころとして扱う。  

## CLI の外までつなぐ: 通知、状態表示、メニューバー連携

Claude の hook は `claude/hooks/state-notify.sh` で `~/.claude/claude_state.json` を更新し、`simple-bar/claude/read-state.sh` がそれを読んで「作業中」「許可待ち」などを表示する。  
さらに AeroSpace 側で workspace change と focus change のたびに simple-bar を refresh していて、CLI の状態が macOS の常時表示 UI に流れている。  
Codex と Claude の通知スクリプトは `terminal-notifier` を使いながら、親アプリと前面アプリが同じなら通知を抑制する細かい制御まで入っている。  

## Nix に寄せつつ、Nix だけで閉じない設計

`claude-code-overlay` を使って Claude Code を Nix 側に取り込みつつ、更新速度や相性を見て Codex、agent-browser、im-select などは Homebrew 側で持っている。  
一方で `git-cz`、`portless`、`site2skill` のような手元で使いたい CLI は `nix/pkgs` で自前 package 化して repo の世界に取り込んでいる。  
「全部を Nix に寄せる」より、「宣言的に管理できる範囲を広げつつ、現実的に使えることを優先する」方針が見える構成になっている。  

## Shell、Editor、Window Manager が一続きになった日常導線

Fish は `reload`、`cc`、`co`、`ghq_cd_fzf` などで操作コストを下げつつ、mise や nix 環境と自然につながる入口として使っている。  
AeroSpace では Codex、Claude、ChatGPT、Zed、Slack、Notion などを workspace に自動配置していて、アプリ配置そのものが作業手順の一部になっている。  
Zed 側でも agent 完了音や Ollama の既定モデル設定を入れており、ローカル AI も同じ作業導線の中に置いている。  

## あえて手動運用で残しているもの

Raycast の `.rayconfig`、Cursor 側の設定反映、simple-bar の配置は完全自動化せず、手動運用のまま残している。  
この repo は「全部を宣言的にする」ことよりも、「再現性が高い部分は repo で持ち、残りは割り切る」バランスで組まれている、と書ける章にする。  

## まとめ: 今の開発環境は dotfiles でオーケストレーションする

この repo の主題は shell や editor 単体の設定ではなく、AI ツールの共通化、状態の可視化、Nix と macOS の接続をまとめて管理している点にある。  
2026年3月時点の現状確認として、dotfiles が「設定置き場」から「作業環境の制御レイヤー」に変わったことを最後に回収する。  
