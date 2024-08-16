#!/bin/bash

echo "セットアップを開始します"

# dotfilesのシンボリックリンクを作成する
source ~/dotfiles/link.sh

# homebrewがインストールされていない場合はインストール
if ! type brew >/dev/null 2>&1; then
  echo "Homebrewをインストールします"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrewはすでにインストールされています"
fi

# Brewfileに記載されているパッケージをインストール
source ~/dotfiles/brew-init.sh

# zshをbrewのものに置き換え
source ~/dotfiles/replace-zsh.sh

# gitをbrewのものに置き換え
source ~/dotfiles/replace-git.sh

echo "セットアップが完了しました"
echo "Next..."
echo "1. .envを追加し、環境変数を設定してください。"
echo "2. git/user.confを追加し、ユーザー情報を設定してください。"
echo "3. ターミナルを再起動してください。"
