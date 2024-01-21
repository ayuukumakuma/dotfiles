#!/bin/bash

cat << "EOF"
   ##                                  ##     #####            #####               ##       ###      ##      ###
  ####                                 ##    ##   ##            ## ##              ##      ## ##              ##
 ##  ##   ##  ##   ##  ##   ##  ##    ##     #                  ##  ##   ####     #####     #       ###       ##      ####     #####
 ##  ##   ##  ##   ##  ##   ##  ##            #####             ##  ##  ##  ##     ##     ####       ##       ##     ##  ##   ##
 ######   ##  ##   ##  ##   ##  ##                ##            ##  ##  ##  ##     ##      ##        ##       ##     ######    #####
 ##  ##    #####   ##  ##   ##  ##           ##   ##            ## ##   ##  ##     ## ##   ##        ##       ##     ##            ##
 ##  ##       ##    ######   ######           #####            #####     ####       ###   ####      ####     ####     #####   ######
          #####
EOF
echo

# Homebrew
echo "========== Homebrew =========="
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrewがインストールされていません。インストールを開始します。"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrewは既にインストールされています。"
fi
echo

echo "Brewfileに基づいてパッケージをインストールします。"
if brew bundle --file "~/dotfiles/preferences/brew/.Brewfile"; then
  echo "インストールが成功しました。"
else
  echo "何らかの理由でインストールに失敗しました。"
fi
echo

echo "========== Git =========="
SSH_KEY="~/.ssh/github/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
  echo "既に設定済みです。"
else
  echo "SSHキーが存在しません。新しく作成します。"
  ssh-keygen -t ed25519 -C "github-ssh"
  echo
  echo "githubディレクトリを作成し、移動します。"
  mkdir ~/.ssh/github
  mv ~/.ssh/ ~/.ssh/github
  echo "設定ファイルを作成し、設定を記述します。"
  touch ~/.ssh/config
  cat <<- EOF >> "~/.ssh/config"
    Host *
      AddKeysToAgent yes
      UseKeychain yes
    Host github
      HostName github.com
      IdentityFile ~/.ssh/github/id_ed25519
      Port 22
      User git
EOF
fi
echo

echo "========== Symbolic Link =========="
echo "link.txtを基にシンボリックリンクを生成します。"
~/dotfiles/scripts/link.sh
echo
