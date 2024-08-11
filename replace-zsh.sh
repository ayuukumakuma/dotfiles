#!/bin/bash

# Brewでzshがインストールされているか確認
if ! brew list zsh &>/dev/null; then
    echo "zshがインストールされていないため、インストールを開始します..."
    brew install zsh
else
    echo "zshはすでにインストールされています。"
fi

# インストールしたzshのパスを取得
ZSH_PATH=$(brew --prefix)/bin/zsh

# インストールされたzshがシェルとして許可されているか確認し、追加
if ! grep -Fxq "$ZSH_PATH" /etc/shells; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

# デフォルトシェルをインストールしたzshに変更
chsh -s "$ZSH_PATH"

# 設定の反映を促すメッセージ
echo "brewでインストールしたzshをデフォルトシェルに設定しました。ターミナルを再起動してください。"