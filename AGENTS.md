# リポジトリガイドライン

## プロジェクト構成とモジュール構成
- `nix/`: Flake のエントリポイント（`flake.nix` / `flake.lock` / `local.nix.example` / `local.nix`）と、macOS の system+Homebrew+Home Manager 状態を管理する `nix-darwin/`、カスタム package 定義の `pkgs/` を持つ。
- `config/`: 各種ツール設定を集約するディレクトリ。`config/fish/` にシェル設定、`config/git/` に Git 設定、`config/nvim/` や `config/wezterm/` などにツール別設定を配置し、`config/agents/skills/` に再利用可能なエージェントスキルを保存する。`config/claude/hooks/` と `config/codex/hooks/` もここに含まれる。
- `script/`: ユーティリティ Bash スクリプトを配置するディレクトリ。現状は `set-fish-default.sh` がある。
- `menubar-script/`: `claude/`、`codex/`、`ime/`、`media/`、`notify-sound/` などのメニューバー連携用スクリプト群。
- 補助アセットや生成物として `build/` と `docs/`、運用コマンドの入口としてトップレベルの `justfile` がある。隠しディレクトリとして `.claude/` と `.zed/` も存在する。

## ビルド・テスト・開発コマンド
- `just check` — `nix/` で `nix flake check` を実行し、flake と darwin 設定を検証。
- `just switch` — `nix/local.nix` の `darwinConfigName` を使って system/Homebrew 設定を適用。
- `just update` — `nix/` で flake 入力を更新。
- `just update-and-switch` — flake 更新と darwin 反映を連続で実行。
- `reload`（Fish 略語）— ログインシェルを再起動して新しい設定を読み込む。`fish_plugins` を変更した場合は `fisher update` を続けて実行。

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
- `nix/local.nix` はこのリポジトリで追跡されている設定ファイルで、各環境の値に合わせて編集して使う。
- `nix/local.nix.example` は初期値の参照用テンプレートとして保持し、必要に応じて `nix/local.nix` と見比べて更新する。
- `nix/local.nix` を ignore に入れると flake の pure 評価で参照できず失敗するため、ignore しない。
- 秘密情報はコミットしない。Git の identity は `~/.config/git/config.local`（テンプレート: `config/git/config.local.example`）に保持し、その他の認証情報は 1Password CLI（`op signin`）を使用。
- `flake.lock` を唯一の正とし、手動編集は避ける。依存更新時にはロックファイルもコミット。
- 新しい cask やパッケージを追加する場合は `nix/nix-darwin/homebrew.nix` と `nix/nix-darwin/home-manager/packages.nix` を優先して宣言的に管理し、switch コマンドを再実行してシステムに反映。

## エージェントスキル
- 再利用可能なスキルは `config/agents/skills/` に保存。
- 現在のリポジトリ内スキル: `a-bar`、`cmux`、`code-simplifier`、`conventional-commit`、`difit-review`、`electron`、`empirical-prompt-tuning`、`frontend-design`、`genshijin`、`ghostty`、`grill-me`、`justfile`、`lazy.nvim`、`viteplus`、`wezterm`、`zed`。
- タスクで特定のスキルが明示された場合は、そのスキルのワークフローを使用し、変更範囲は要求された領域に限定。
