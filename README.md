# dotfiles

macOS用の個人的なdotfilesリポジトリです。Nix Flakesとnix-darwinを使用してシステム設定を宣言的に管理しています。

## 🚀 主な機能

- **Nix Flakes** - 再現可能なパッケージ管理
- **nix-darwin** - macOSシステム設定の宣言的管理
- **Fish Shell** - 高機能なシェル環境（Fisherプラグイン管理付き）
- **Homebrew** - GUI アプリケーションとcaskの管理
- **設定ファイル管理** - 各種開発ツールの設定を一元管理

## 📋 必要条件

- macOS (Apple Silicon対応)
- [Nix](https://nixos.org/download#nix-install-macos) (パッケージマネージャー)
- [Homebrew](https://brew.sh/) (macOSパッケージマネージャー)
- Git

## ⚡ クイックスタート

```bash
# 1. リポジトリをクローン
git clone https://github.com/ayuukumakuma/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Nixパッケージをインストール
cd nix
nix build .#my-packages
nix profile install .#my-packages

# 3. nix-darwin設定を適用
nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
cd ..

# 4. Fish shellをデフォルトに設定
./script/set-fish-default.sh

# 5. Gitのローカル個人設定を作成
mkdir -p ~/.config/git
cp git/config.local.example ~/.config/git/config.local
# ~/.config/git/config.local の name/email/signingkey を編集
```

## 📦 インストール

### 1. Nixのインストール

まだNixをインストールしていない場合：

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### 2. Homebrewのインストール

まだHomebrewをインストールしていない場合：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. リポジトリのセットアップ

```bash
# リポジトリをクローン
git clone https://github.com/ayuukumakuma/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Nixパッケージをビルドしてインストール
cd nix
nix build .#my-packages
nix profile install .#my-packages

# nix-darwin設定を初回適用
nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
cd ..

# Fish shellの設定
./script/set-fish-default.sh
```

### 4. Git個人設定の初期化

Gitの個人情報は `~/.config/git/config.local` で管理します（リポジトリには含めません）：

```bash
mkdir -p ~/.config/git
cp git/config.local.example ~/.config/git/config.local
$EDITOR ~/.config/git/config.local
```

### 5. Fish プラグインのインストール

Fish shellに切り替え後：

```bash
# Fisher でプラグインをインストール
fisher update
```

## 🔄 よく使うコマンド

### 更新コマンド

```bash
# すべてを更新（flake入力、プロファイル、nix-darwin）
cd nix && nix run .#update

# 個別の更新
cd nix && nix flake update                                   # flake入力を更新
cd nix && nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin # nix-darwin設定を適用
cd nix && nix profile upgrade nix                            # Nixプロファイルを更新
```

### 開発コマンド

```bash
# Nixファイルをフォーマット
nixfmt-rfc-style <file>

# Fish設定をリロード
reload  # exec $SHELL -l のエイリアス

# Bordersを再起動
launchctl kickstart -k gui/$(id -u)/org.nixos.jankyborders
```

## 📁 ディレクトリ構造

```
.
├── README.md           # このファイル
├── AGENTS.md           # エージェント向けリポジトリ運用ガイド
├── nix/               # Nix設定
│   ├── flake.nix      # メインFlake定義
│   ├── flake.lock     # 依存関係のロックファイル
│   ├── pkgs.nix       # CLIツールのパッケージリスト
│   └── nix-darwin/
│       └── config.nix # macOSシステム設定とHomebrew設定
├── agents/            # スキル・エージェント用アセット
├── codex/             # Codex設定
├── fish/              # Fish shell設定
│   ├── config.fish    # メイン設定ファイル
│   ├── fish_plugins   # Fisherプラグインリスト
│   ├── functions/     # カスタム関数
│   └── conf.d/        # 自動読み込み設定
├── mise/              # mise設定
├── nvim/              # Neovim設定
├── script/            # ユーティリティスクリプト
│   └── set-fish-default.sh # Fishをデフォルトシェルに設定
└── [各種アプリ設定ディレクトリ]
    ├── aerospace/     # AerospaceWMの設定
    ├── claude/        # Claude Codeの設定
    ├── cursor/        # Cursorエディタの設定
    ├── git/          # Git設定
    ├── raycast/      # Raycastの設定
    ├── simple-bar/    # simple-barの設定
    ├── wezterm/       # WezTermターミナルの設定
    └── zellij/        # Zellijの設定
```

## 🛠 管理対象のツール

### Nixでインストールされるツール (`nix/pkgs.nix`)

#### 開発ツール
- `nil` - Nix LSP
- `nixfmt-rfc-style` - Nixフォーマッター
- `git`, `gh` - Gitツール
- `just` - タスクランナー
- `claude-code` - Claude Code CLI
- `mise` - ランタイムバージョン管理

#### CLIユーティリティ
- `fzf` - ファジーファインダー
- `bat` - catの代替（シンタックスハイライト付き）
- `ripgrep` - 高速grep
- `eza` - lsの代替
- `fish` - Fish shell
- `kubectl` - Kubernetes CLI
- `terminal-notifier` - macOS通知
- `jankyborders` - ウィンドウボーダー

### Homebrewでインストールされるツール (`nix/nix-darwin/config.nix`)

#### CLI ツール
- `fisher` - Fish プラグインマネージャー
- `mysql@8.0` - MySQL（Ruby開発用）
- `libyaml`, `pkg-config`, `vips` - ビルドツール

#### GUI アプリケーション
- **エディタ**: Cursor, Zed
- **ターミナル**: WezTerm
- **ブラウザ**: Firefox, Arc
- **開発ツール**: OrbStack, Figma, Sequel Ace
- **ユーティリティ**: Raycast, Stats, Shottr, 1Password
- **ウィンドウ管理**: AeroSpace
- **その他**: Obsidian, Notion, Gather, Kap, KeyCastr

#### フォント
- JetBrains Mono Nerd Font
- Google Sans Code

## ⚙️ カスタマイズ

### パッケージの追加

#### CLIツールを追加する場合
`nix/pkgs.nix`を編集：

```nix
myPackages = with pkgs; [
  # 既存のパッケージ...
  your-new-package  # 追加
];
```

#### GUIアプリケーションを追加する場合
`nix/nix-darwin/config.nix`を編集：

```nix
casks = [
  # 既存のcasks...
  "your-new-app"  # 追加
];
```

変更を適用：

```bash
cd nix && nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
```

### Fish設定の変更

1. `fish/config.fish`を編集して設定を変更
2. `fish/fish_plugins`を編集してプラグインを追加/削除
3. 変更を適用：

```bash
reload  # Fish設定をリロード
fisher update  # プラグインを更新
```

### macOSシステム設定の変更

`nix/nix-darwin/config.nix`の`system.defaults`セクションを編集して、Dock、Finder、その他のシステム設定をカスタマイズできます。

## 🎨 Fish Shellプラグイン

以下のプラグインがFisherを通じて管理されています：

- **tide** - モダンなプロンプトテーマ
- **fzf.fish** - fzfとの統合
- **fish-autols** - ディレクトリ変更時の自動ls
- **done** - 長時間コマンド終了通知
- **pisces** - 括弧の自動ペアリング
- **fish-abbreviation-tips** - 略語のヒント表示
- **z** - ディレクトリジャンプ

## 🔒 セキュリティ設定

このリポジトリでは、個人情報の漏洩を防ぐため、Git個人設定をローカルファイルに分離しています。必要に応じて1Passwordを秘密情報管理に利用できます。

### セキュリティ機能

- **個人情報の分離**: Gitの `user.*` は `~/.config/git/config.local` で管理
- **追跡対象の明確化**: リポジトリには `git/config.local.example` のみ保持
- **秘密情報管理**: APIキーやWebhook等は1Passwordなど外部ストアで管理可能

### 必要な初期設定

1. **ローカルGit設定ファイルの作成**
   ```bash
   mkdir -p ~/.config/git
   cp git/config.local.example ~/.config/git/config.local
   ```

2. **Git個人情報の編集**
   ```bash
   $EDITOR ~/.config/git/config.local
   ```

### 1Passwordでの情報管理

以下の情報は1Passwordで管理することを推奨します：

- **Webhook URL**: 通知用のWebhook URL
- **API キー**: 各種サービスのAPIキー
- **SSH キー**: Git署名用のSSH秘密鍵

### セキュリティベストプラクティス

- ✅ 個人情報はリポジトリにコミットしない
- ✅ 1Passwordを使用してクレデンシャル情報を管理
- ✅ 環境変数や設定ファイルで機密情報を参照
- ✅ 定期的にコミット履歴をチェックし、情報漏洩がないか確認

## 🔧 トラブルシューティング

### Nixコマンドが見つからない

```bash
# Nixのパスを追加
export PATH="$HOME/.nix-profile/bin:$PATH"
```

### Fish shellへの切り替えでエラーが発生

```bash
# Fishのパスを確認
which fish

# /etc/shellsに追加されているか確認
cat /etc/shells | grep fish
```

### 1Password CLIの認証エラー

```bash
# セッションの確認
op account list

# 再認証
op signin
```

### nix-darwin設定の適用でエラー

```bash
# 設定ファイルの構文チェック
cd nix && nix flake check

# ログを確認
cd nix && nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin --show-trace
```
