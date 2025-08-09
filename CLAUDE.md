# CLAUDE.md

このファイルは、このリポジトリでコードを扱う際の Claude Code (claude.ai/code)へのガイダンスを提供します。

## リポジトリ概要

これは macOS 用の個人的な dotfiles リポジトリで、システム設定に Nix Flakes と nix-darwin を使用しています。主なコンポーネントは以下の通りです：

- **Fish shell 設定** - Fisher で管理されるプラグイン付き
- **Nix パッケージ管理** - Flakes を使用
- **nix-darwin** - macOS システム設定用
- **Homebrew** - GUI アプリケーションと casks の統合

## よく使うコマンド

### Nix/Flake コマンド

- **すべてを更新**: `nix run .#update` - flake の入力、プロファイルパッケージ、nix-darwin 設定を更新
- **nix-darwin 設定を切り替え**: `nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin`
- **flake の入力を更新**: `nix flake update`
- **パッケージ環境をビルド**: `nix build .#my-packages`

### 開発コマンド

- **Nix ファイルをフォーマット**: `nixfmt-rfc-style <file>`
- **Nix 構文をチェック**: `nil` (Nix LSP)

### Fish Shell セットアップ

- **Fish をデフォルトシェルに設定**: `./script/set-fish-default.sh`
- **Fish 設定をリロード**: `reload` (`exec $SHELL -l`のエイリアス)

### セキュリティ関連コマンド

- **1Password CLI サインイン**: `op signin`
- **1Password アカウント追加**: `op account add`
- **Git設定の更新**: `./script/update-git-config-from-1password.sh`
- **Slack Webhook URL更新**: `./script/update-slack-webhook-from-1password.sh`
- **1Password アイテム確認**: `op item get "アイテム名" --vault ボルト名`
- **1Password フィールド読み取り**: `op read "op://ボルト名/アイテム名/フィールド名"`

## アーキテクチャ

### ディレクトリ構造

- `fish/` - Fish shell 設定
  - `config.fish` - メイン設定ファイル
  - `fish_plugins` - Fisher プラグインリスト
  - `functions/` - カスタム関数とプラグイン関数
  - `conf.d/` - 自動的に読み込まれる設定スニペット
- `nix/` - Nix 設定
  - `flake.nix` - メイン flake 定義
  - `pkgs.nix` - パッケージリスト（CLI ツール）
  - `nix-darwin/config.nix` - macOS システム設定と Homebrew パッケージ
- `script/` - セキュリティスクリプトとユーティリティ
  - `set-fish-default.sh` - Fish shell セットアップ
  - `update-git-config-from-1password.sh` - Git設定更新
  - `update-slack-webhook-from-1password.sh` - Webhook URL更新
- `git/` - Git 設定
- `claude/` - Claude Code 設定

### 主要な設定ファイル

1. **nix/flake.nix** - 以下を含む Nix flake を定義：

   - パッケージ出力（`my-packages`）
   - 更新用 app スクリプト
   - nix-darwin 設定

2. **nix/pkgs.nix** - Nix 経由でインストールされる CLI ツールをリスト：

   - 開発ツール（nil、nixfmt-rfc-style）
   - CLI ユーティリティ（fzf、bat、ripgrep、eza）
   - Git ツール（git、gh）
   - Claude Code

3. **nix/nix-darwin/config.nix** - macOS システム設定と Homebrew パッケージ：

   - システム設定（Dock、Finder）
   - Homebrew casks（GUI アプリケーション）
   - フォント設定

4. **fish/config.fish** - 以下を含む Fish shell 設定：
   - Homebrew でインストールした Fisher との統合
   - インタラクティブモード設定
   - コマンドの略語

5. **git/config** - Git 設定：
   - 個人情報（name、email、signingkey）を削除
   - スクリプトによる更新を指示するコメントのみ
   - エイリアス設定やその他の非機密設定は保持

6. **claude/settings.json** - Claude Code 設定：
   - SLACK_WEBHOOK_URL はスクリプトによる更新を指示
   - 権限設定やその他の非機密設定は保持
   - 実際の値は 1Password で管理

7. **script/set-fish-default.sh** - セットアップスクリプト：
   - エラーハンドリング、カラーアウトプット、ユーザー確認機能付き
   - 前提条件チェック機能
   - 堅牢で使いやすい設計

### プラグイン管理

Fish プラグインは Fisher を通じて管理されます。プラグインリストは`fish/fish_plugins`にあります：

- tide（プロンプトテーマ）
- fzf.fish（ファジーファインダー統合）
- fish-autols（ディレクトリ内容の自動リスト表示）
- done（長いコマンドが終了したときの通知）
- pisces（括弧の自動ペア）
- fish-abbreviation-tips
- z（ディレクトリジャンプ）

## セキュリティ設定

このリポジトリでは、情報漏洩防止のため、機密情報を1Passwordで管理する設計を採用しています。

### セキュリティ原則

- **個人情報の分離**: Git設定、API キー、Webhook URL などの個人情報はリポジトリから除外
- **スクリプトベース管理**: 機密情報の設定は専用スクリプトを通じて自動化
- **1Password統合**: 1Password CLI を使用してクレデンシャル情報を安全に管理

### 機密情報の管理対象

1. **Git設定** (`git/config`):
   - ユーザー名、メールアドレス
   - SSH署名キー
   - 現在は`# script/update-git-config-from-1password.sh でユーザー情報を更新する`というコメントのみ

2. **Claude Code設定** (`claude/settings.json`):
   - SLACK_WEBHOOK_URL
   - 現在は`"script/update-slack-webhook-from-1password.sh で更新すること"`という指示のみ

### セキュリティスクリプト

以下のスクリプトが設計されています：

1. **`script/update-git-config-from-1password.sh`**:
   - 1Password から Git ユーザー情報を取得
   - `git/config` ファイルを動的に更新

2. **`script/update-slack-webhook-from-1password.sh`**:
   - 1Password から Slack Webhook URL を取得
   - Claude Code の環境変数を更新

### 1Password CLI 使用方法

```bash
# 1Password CLI の基本操作
op signin                           # サインイン
op item get "Git Config" --vault Personal  # アイテム取得
op read "op://Personal/Git Config/username" # 特定フィールド読み取り
```

### セキュリティベストプラクティス

コードを扱う際は以下の点に注意してください：

- ✅ 個人情報を含むファイルを編集する際は、実際の値をコミットしないよう注意
- ✅ 新しい機密設定を追加する場合は、スクリプトベース管理を検討
- ✅ コミット前に `git diff` で機密情報が含まれていないか確認
- ✅ 1Password からの設定取得を自動化するスクリプトの実装を推奨

### 実装時の参考情報

スクリプト実装時の参考として、以下の情報が有用です：

- 1Password CLI のフィールド参照: `op://vault/item/field`
- 環境変数での設定: `export VAR_NAME=$(op read "op://...")`
- 設定ファイルの動的生成: テンプレート + 1Password 値の組み合わせ
