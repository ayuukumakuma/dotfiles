#!/bin/bash

DOTFILES_DIR=~/dotfiles

echo "シンボリックリンクを削除します"

# サブディレクトリ一階層内の隠しファイルを検索
find "$DOTFILES_DIR" -mindepth 2 -maxdepth 2 -type f -name ".*" | while read -r file; do
    # ホームディレクトリ直下に存在するシンボリックリンクを削除
    target=~/${file##*/} # サブディレクトリを除いてファイル名のみを抽出
    if [[ -L $target ]]; then
        rm "$target"
        echo "リンクを削除: $target"
    fi
done

echo "シンボリックリンクの削除が完了しました！"
