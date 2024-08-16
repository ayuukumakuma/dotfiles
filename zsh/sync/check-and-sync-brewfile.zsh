#!/bin/bash

function check_and_sync_brewfile() {
  # 現在インストールされているパッケージ一覧を取得
  installed_packages=$(brew leaves && brew list --cask)
  # .Brewfileに記載されているパッケージ一覧を取得
  brewfile_packages=$(grep '^(brew|cask)' ~/dotfiles/homebrew/.Brewfile | awk '{gsub(/"/, "", $2); print $2}')

  # インストールされていないパッケージをインストールし、.Brewfileに追加
  echo ".Brewfileに記載されているがインストールされていないパッケージをインストールします:"

  installed_any=false
  while read -r package; do
    if ! echo "$installed_packages" | grep -q "^$package$"; then
      echo "インストール中: $package"
      brew install "$package"
      installed_any=true
    fi
  done < <(echo "$brewfile_packages")

  if [ "$installed_any" = false ]; then
    echo "すべてのパッケージがすでにインストールされています。"
  fi

  echo ""

  # .Brewfileに記載されていないがインストールされているパッケージを.Brewfileに追加
  echo ".Brewfileに記載されていないがインストールされているパッケージを.Brewfileに追加します:"
  installed_any=false
  while read -r package; do
    if ! echo "$brewfile_packages" | grep -q "^$package$"; then
      installed_any=true
    fi
  done < <(echo "$installed_packages")

  if [ "$installed_any" = false ]; then
    echo "すべてのパッケージがすでに.Brewfileに記載されています。"
  else
    echo ".Brewfileの内容と実際のインストール状況が一致しません。"
    echo ".Brewfileを再生成します。"
    brew bundle dump --force --file=~/dotfiles/homebrew/.Brewfile
  fi

}

# brewコマンドが実行された時に発火する
preexec() {
  if [[ "$1" == brew* ]]; then
    check_and_sync_brewfile
  fi
}
