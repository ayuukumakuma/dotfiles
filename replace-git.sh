#!/bin/bash

# Brewでgitがインストールされているか確認
if ! brew list git &>/dev/null; then
    echo "gitがインストールされていないため、インストールを開始します..."
    brew install git
else
    echo "gitはすでにインストールされています。"
fi

# Brewでインストールされたgitのパスを取得
GIT_PATH=$(brew --prefix)/bin/git

# 現在のgitのパスを確認
CURRENT_GIT_PATH=$(which git)

# デフォルトのgitがすでにbrewのものかどうか確認
if [ "$CURRENT_GIT_PATH" == "$GIT_PATH" ]; then
    echo "すでにHomebrewでインストールされたgitがデフォルトになっています。"
else
    echo "Homebrewでインストールされたgitをデフォルトに設定します..."

    # ~/.zshrc にパスを追加
    SHELL_CONFIG_FILE="$HOME/.zshrc"

    # シェル設定ファイルにパスを追加
    echo "export PATH=\"$GIT_PATH:\$PATH\"" >> "$SHELL_CONFIG_FILE"

    # シェル設定を再読み込み
    source "$SHELL_CONFIG_FILE"

    echo "Homebrewでインストールされたgitがデフォルトに設定されました。"
    echo "新しいターミナルセッションを開くと、設定が反映されます。"
fi