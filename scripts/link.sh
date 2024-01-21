#!/bin/bash

# 別のファイルディスクリプタを使用して link.txt ファイルを読み込みます
while IFS=' ' read -r src dst <&3; do
  # フルパスを設定
  full_src="$HOME/dotfiles/preferences/$src"
  full_dst="$HOME/$dst"

  # 対象のディレクトリが存在するかどうかを確認し、存在しない場合は作成
  dir_dst=$(dirname "$full_dst")
  if [ ! -d "$dir_dst" ]; then
    mkdir -p "$dir_dst"
    echo "ディレクトリを作成しました: $dir_dst"
  fi

  # 対象のパスが存在するかどうかを確認
  if [ -e "$full_dst" ]; then
    # ユーザーに上書きの確認を取る
    echo -n "${full_dst} はすでに存在します。上書きしますか? [Y/n]: "
    read -n 1 answer
    echo  # 改行を追加

    if [[ $answer =~ ^[Yy]$ ]]; then
      # 上書きを承認した場合、シンボリックリンクを作成
      ln -sf "$full_src" "$full_dst"
      echo "シンボリックリンクを作成しました: $full_src -> $full_dst"
    elif [[ $answer =~ ^[Nn]$ ]]; then
      # 上書きを拒否した場合
      echo "スキップしました: $full_src -> $full_dst"
    fi
  else
    # パスが存在しない場合、直接シンボリックリンクを作成
    ln -sf "$full_src" "$full_dst"
    echo "シンボリックリンクを作成しました: $full_src -> $full_dst"
  fi
done 3< ~/dotfiles/link.txt

echo "すべてのシンボリックリンクの処理が完了しました。"

