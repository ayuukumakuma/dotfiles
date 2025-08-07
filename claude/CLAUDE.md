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

### プラグイン管理

Fish プラグインは Fisher を通じて管理されます。プラグインリストは`fish/fish_plugins`にあります：

- tide（プロンプトテーマ）
- fzf.fish（ファジーファインダー統合）
- fish-autols（ディレクトリ内容の自動リスト表示）
- done（長いコマンドが終了したときの通知）
- pisces（括弧の自動ペア）
- fish-abbreviation-tips
- z（ディレクトリジャンプ）
