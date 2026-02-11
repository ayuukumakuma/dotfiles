# dotfiles

macOS用の個人的なdotfilesリポジトリです。Nix Flakesとnix-darwinを使用してシステム設定を宣言的に管理しています。

## 🚀 主な機能

- **Nix Flakes** - 再現可能なパッケージ管理
- **nix-darwin + Home Manager** - macOSとユーザー設定の宣言的管理
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

# 2. nix-darwin設定を適用
cd nix
nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
cd ..

# 3. Fish shellをデフォルトに設定
./script/set-fish-default.sh

# 4. Gitのローカル個人設定を作成
mkdir -p ~/.config/git
cp git/config.local.example ~/.config/git/config.local
# ~/.config/git/config.local の name/email/signingkey を編集

# 5. 設定反映（Home Manager）
# 必要に応じて再適用: cd nix && nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
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

# nix-darwin設定を初回適用
cd nix
nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
cd ..

# Fish shellの設定
./script/set-fish-default.sh

```

Home Manager で `~/.config/*` に加えて `~/.aerospace.toml`、`~/.agents`、`~/.claude`、`~/.codex`、Cursor ユーザー設定を `nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin` で管理します。

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
nixfmt <file>

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
│   └── nix-darwin/
│       ├── config.nix       # nix-darwin のモジュール定義
│       ├── home-manager.nix # Home Manager のユーザー設定（home.packages含む）
│       └── ...
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
│   └── set-fish-default.sh     # Fishをデフォルトシェルに設定
└── [各種アプリ設定ディレクトリ]
    ├── aerospace/    # AerospaceWMの設定
    ├── claude/       # Claude Codeの設定
    ├── cursor/       # Cursorエディタの設定
    ├── git/          # Git設定
    ├── raycast/      # Raycastの設定
    ├── simple-bar/   # simple-barの設定
    ├── wezterm/      # WezTermターミナルの設定
    ├── zed/          # zed設定
    └── zellij/       # Zellijの設定
```

## 🛠 管理対象のツール

### Home Managerで管理する設定
- `fish`, `git`, `mise`, `nvim`, `wezterm`, `zed`, `zellij`
- `aerospace/.aerospace.toml` -> `~/.aerospace.toml`
- `agents/` -> `~/.agents`
- `claude/` -> `~/.claude/*`（`settings.local.json` は除く）
- `codex/` -> `~/.codex/*`
- `cursor/settings.json`, `cursor/keybindings.json` -> `~/Library/Application Support/Cursor/User/`

### Home Manager非対象（手動運用）
- `raycast/*.rayconfig`（Raycast の `Import Settings & Data` で取り込み）
- `~/.claude/settings.local.json`（機密・ローカル差分用）
- `simple-bar/`（利用先パス依存のため、必要に応じて手動配置）

### Home ManagerでインストールされるCLIツール (`nix/nix-darwin/home-manager.nix`)

#### 開発ツール
- `nil` - Nix LSP
- `nixfmt` - Nixフォーマッター
- `nixd` - Nix LSP
- `git`, `gh` - Gitツール
- `just` - タスクランナー
- `mise` - ランタイムバージョン管理
- `neovim` - Neovim
- `just-lsp` - Just LSP

#### CLIユーティリティ
- `fzf` - ファジーファインダー
- `bat` - catの代替（シンタックスハイライト付き）
- `ripgrep` - 高速grep
- `eza` - lsの代替
- `fish` - Fish shell
- `kubectl` - Kubernetes CLI
- `jq`, `jnv` - JSONツール
- `tre-command` - tree互換
- `ffmpeg` - メディアツール
- `hyperfine` - ベンチマーク
- `fd` - find互換
- `zellij` - ターミナルマルチプレクサ
- `wget` - ダウンローダ
- `tmux` - ターミナルマルチプレクサ
- `ghq` - リポジトリ管理
- `terminal-notifier` - macOS通知
- `jankyborders` - ウィンドウボーダー

### Homebrewでインストールされるツール (`nix/nix-darwin/homebrew.nix`)

#### CLI ツール
- `fisher` - Fish プラグインマネージャー
- `mas` - Mac App Store CLI
- `mole` - インジケーター
- `im-select` - IM切替
- `git-delta` - diffビューア
- `mysql@8.0` - MySQL（Ruby開発用）
- `libyaml`, `pkg-config`, `vips` - ビルドツール

#### GUI アプリケーション
- **エディタ**: Cursor, Zed
- **ターミナル**: WezTerm
- **ブラウザ**: Firefox, Dia
- **開発ツール**: OrbStack, Sequel Ace, Another Redis Desktop Manager
- **デザイン/制作**: Figma, Affinity
- **ドキュメント/ノート**: Obsidian, Notion
- **ユーティリティ**: Raycast, Stats, Shottr, Scroll Reverser, KeyCastr, Gyazo, Google Drive, Ubersicht, AnkerWork, DeskPad, NotchNook, Cap
- **セキュリティ**: 1Password, 1Password CLI
- **ウィンドウ管理**: AeroSpace
- **ハードウェア**: Logitech G Hub, Logi Options+, HHKB
- **音楽**: Spotify, MusaicFM
- **その他**: codex-app, codex

#### フォント
- HackGen Nerd Font
- Monaspace

## ⚙️ カスタマイズ

### パッケージの追加

#### CLIツールを追加する場合
`nix/nix-darwin/home-manager.nix` の `home.packages` を編集：

```nix
home.packages = with pkgs; [
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

### 新しい設定ディレクトリの追加

新しい設定を追加する場合は、対象ディレクトリを作成して `nix/nix-darwin/home-manager.nix` にマッピングを追記します。

```nix
xdg.configFile = {
  "tool/config.ext".source = ../../tool/config.ext;
};

home.file = {
  ".toolrc".source = ../../tool/.toolrc;
};
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
- **fish-cdf** - ディレクトリ履歴ジャンプ
- **fish-cd-gitroot** - Gitルートへ移動
- **fish-fzf-bd** - FZFで親ディレクトリ移動
- **fzf.fish** - fzfとの統合
- **fish-autols** - ディレクトリ変更時の自動ls
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
