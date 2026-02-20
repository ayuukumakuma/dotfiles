# nix ディレクトリ運用ガイド

このディレクトリは、`nix-darwin` と `home-manager` を使って macOS 環境を宣言的に管理するための設定をまとめています。

## 前提条件

- macOS（Apple Silicon）
- Nix（flakes 有効）
- Homebrew
- このリポジトリをローカルに clone 済み

`flake.nix` は `local.nix` がなければ `local.nix.example` を読み込みます。実運用では `local.nix` を作成してローカル値で上書きしてください。

## 初回セットアップ

1. `local.nix` を作成

```bash
cd nix
cp local.nix.example local.nix
```

2. `local.nix` を環境に合わせて編集

```nix
{
  darwinConfigName = "your-darwin-config-name";
  userName = "your-user-name";
  homeDirectory = "/Users/your-user-name";
  dotfilesRoot = "/Users/your-user-name/dev/github.com/your-account/dotfiles";
}
```

- `darwinConfigName`: `darwinConfigurations` で使う構成名（`switch --flake path:.#<name>` の `<name>`）
- `userName`: macOS のユーザー名
- `homeDirectory`: ホームディレクトリの絶対パス
- `dotfilesRoot`: この dotfiles リポジトリの絶対パス

3. 設定を適用

```bash
cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
```

## よく使うコマンド

```bash
# flake と設定の妥当性確認
cd nix && nix flake check

# nix-darwin / home-manager 設定の適用
cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>

# flake 入力更新 + check + switch を一括実行
cd nix && nix run path:.#update

# flake 入力のみ更新
cd nix && nix flake update
```

## ディレクトリ構成と責務

- `flake.nix`
  - flake の `inputs` / `outputs` を定義
  - `darwinConfigurations.<darwinConfigName>` を構築
  - `nix-darwin/default.nix` を経由して各モジュールを読み込む
  - `nix run path:.#update` で使う更新アプリを定義
- `flake.lock`
  - 依存関係のロックファイル（手動編集しない）
- `local.nix`
  - ローカル環境固有値（ユーザー名、パスなど）
- `local.nix.example`
  - `local.nix` のテンプレート
- `nix-darwin/default.nix`
  - Nix core / users / macOS / Homebrew / Home Manager のモジュール集約
- `nix-darwin/nix-core.nix`
  - `nixpkgs` の共通設定（`allowUnfree` / overlay）
  - `nix.settings` などの Nix 本体設定
- `nix-darwin/users.nix`
  - macOS ユーザー定義（`users.users.<userName>`）
- `nix-darwin/system.nix`
  - macOS のシステム設定（Dock、Finder、キーボードなど）
- `nix-darwin/homebrew.nix`
  - Homebrew の brew / cask / mas 管理
- `nix-darwin/home-manager/default.nix`
  - Home Manager のユーザー設定エントリ
- `nix-darwin/home-manager/packages.nix`
  - Home Manager 管理のターミナル向けパッケージ
- `nix-darwin/home-manager/files.nix`
  - dotfiles のシンボリックリンク管理（`~/.config` や `~/.codex` など）
  - `direnv/direnvrc` は `pkgs.nix-direnv` の store path を参照するため `text` で生成
- `pkgs/git-cz/default.nix`
  - npm 配布の `git-cz` をラップして `home.packages` で利用可能にする
- `pkgs/tree-sitter-cli/default.nix`
  - `tree-sitter` を Rust ビルドして `home.packages` で利用可能にする
- `pkgs/portless/default.nix`
  - npm 配布の `portless` をラップして `home.packages` で利用可能にする

## 変更時の運用フロー

1. 対象ファイルを編集（例: `nix-darwin/system.nix`）
2. 構文と依存整合を確認

```bash
cd nix && nix flake check
```

3. 変更を適用

```bash
cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
```

4. 反映確認
- GUI 設定: Dock / Finder / キーマップの挙動
- パッケージ: `which` や `--version` で確認
- サービス: 必要に応じて `launchctl list` を確認

## トラブルシュート

### `local.nix` を自分用に設定したい

```bash
cd nix
cp local.nix.example local.nix
```

`local.nix` がなくても `flake.nix` は `local.nix.example` にフォールバックしますが、`darwinConfigName` などは自分の環境値に変更してください。

### `switch` が失敗する

以下の順で切り分けます。

1. `cd nix && nix flake check`
2. `cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>`
3. 依存更新が必要なら `cd nix && nix flake update` 後に再実行

### `does not provide attribute ... darwinConfigurations.<name>.system` が出る

`--flake .#...` は Git Flake として解決され、`local.nix` の扱いが期待とずれる場合があります。  
`--flake path:.#...` を使って再実行してください。

```bash
cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
```

### `Missing local.darwinConfigName` が出る

`local.nix` に `darwinConfigName` が未設定です。以下のように追加してください。

```nix
{
  darwinConfigName = "your-darwin-config-name";
  userName = "your-user-name";
  homeDirectory = "/Users/your-user-name";
  dotfilesRoot = "/Users/your-user-name/dev/github.com/your-account/dotfiles";
}
```

### ファイル競合やバックアップが増える

`home-manager.backupFileExtension = "backup"` が有効です。
既存ファイルが競合した場合は `*.backup` が生成されるため、差分確認後に整理してください。

## 注意点

- `flake.lock` は依存更新時に一緒にコミットする。
- 秘密情報は `nix/` 配下に置かない。
- `local.nix` はローカル専用ファイルとしてコミットしない。
- `local.nix` を ignore に入れると flake の pure 評価で参照できず失敗するため、ignore しない。
- そのため `git status` に `?? nix/local.nix` が表示されるのは想定どおり。
- 新規パッケージ追加時は宣言的管理を優先する。
  - ターミナル向けパッケージは `nix-darwin/home-manager/packages.nix`
  - GUI アプリは `nix-darwin/homebrew.nix`

## パッケージ追加手順

1. 定義ファイルに追加する

- ターミナル向けパッケージ: `nix-darwin/home-manager/packages.nix`
- GUI アプリ（brew/cask/mas）: `nix-darwin/homebrew.nix`
- カスタムパッケージが必要な場合: `pkgs/<name>/default.nix` を作成し、`packages.nix` から `callPackage` で参照する

2. 利用対象として有効化する

- `home.packages`（または brew/cask/mas の対象リスト）に追加する

3. 妥当性確認と適用

```bash
cd nix && nix flake check
cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
```
