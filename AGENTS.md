# リポジトリガイドライン

## プロジェクト構成とモジュール構成
- `nix/`: Flake のエントリポイント（`flake.nix`）、ロックファイル、および macOS の system+Homebrew+Home Manager 状態を管理する `nix-darwin/default.nix` / `nix-darwin/system.nix` / `nix-darwin/homebrew.nix` / `nix-darwin/home-manager/default.nix`。
- `fish/`: シェル設定（`config.fish`）、`fish_plugins`、およびカスタム functions/conf.d のスニペット。
- `script/`: ユーティリティ Bash スクリプト（例: `set-fish-default.sh`）。
- ツール設定はトップレベルに配置（例: `aerospace/`、`cursor/`、`wezterm/`、`raycast/`、`git/`、`mise/`、`nvim/`、`lazygit/`、`yazi/`、`claude/`、`codex/`、`zed/`、`zellij/`、`simple-bar/`）。
- エージェント固有のアセットは `agents/` 配下（スキル、プロンプト、補助ドキュメント）。

## ビルド・テスト・開発コマンド
- `cd nix && nix flake check` — flake と darwin 設定を検証。
- `cd nix && nix run nix-darwin -- switch --flake .#<darwinConfigName>` — system/Homebrew 設定を適用。
- `cd nix && nix run .#update` — flake の入力、プロファイル、nix-darwin をまとめて更新。
- `reload`（Fish エイリアス）— ログインシェルを再起動して新しい設定を読み込む。`fish_plugins` を変更した場合は `fisher update` を続けて実行。

## コーディングスタイルと命名規則
- Nix: `nixfmt <file>` を実行。2 スペースインデントを保ち、可能な限り属性セットをソート。
- シェルスクリプト: `#!/bin/bash` + `set -euo pipefail`。`echo -e` より `printf` の長いオプションを優先。
- ファイル名とスコープ名は kebab-case（例: `set-fish-default.sh`）。ツールごとのディレクトリでスコープ化したファイル名を使用。
- 小さく合成可能なスクリプトは `script/` に配置。秘密情報やホスト固有パスの埋め込みは避ける。

## テストガイドライン
- 自動テストは最小限のため、コミット/PR 前に `cd nix && nix flake check` を実行。
- 新規スクリプトでは可能な限り dry-run フラグを追加し、macOS（Apple Silicon）で手動テスト。
- Nix の入力やサービスを変更した後は darwin の switch コマンドを再実行し、サービスをスポットチェック（例: `launchctl list | grep jankyborders`）。

## コミット & PR ガイドライン
- コミットメッセージは Conventional Commits（スコープ付き。例: `chore(nix): ...`、`docs(cursor): ...`、`chore(fish): ...`）。命令形を使用。
- コミットは焦点を絞る。無関係なツール設定と Nix 変更を混ぜない。
- PR には以下を含める: 簡単な概要、影響範囲（Nix/Fish/アプリ設定）、実行したコマンド（`cd nix && nix flake check`、apply switch）、UI 変更がある場合はスクリーンショット。

## セキュリティ & 設定の注意点
- `nix/local.nix` はローカル専用ファイルとしてコミットしない。
- `nix/local.nix` を ignore に入れると flake の pure 評価で参照できず失敗するため、ignore しない。
- そのため `git status` に `?? nix/local.nix` が表示されるのは想定どおり。
- 秘密情報はコミットしない。Git の identity は `~/.config/git/config.local`（テンプレート: `git/config.local.example`）に保持し、その他の認証情報は 1Password CLI（`op signin`）を使用。
- `flake.lock` を唯一の正とし、手動編集は避ける。依存更新時にはロックファイルもコミット。
- 新しい cask やパッケージを追加する場合は `nix/nix-darwin/config.nix` と `nix/nix-darwin/home-manager.nix` を優先して宣言的に管理し、switch コマンドを再実行してシステムに反映。

## エージェントスキル
- 再利用可能なスキルは `agents/skills/` に保存。
- 現在の組み込みスキル: `code-simplifier`、`conventional-commit`、`frontend-design`、`skill-creator`、`skill-installer`。
- タスクで特定のスキルが明示された場合は、そのスキルのワークフローを使用し、変更範囲は要求された領域に限定。
