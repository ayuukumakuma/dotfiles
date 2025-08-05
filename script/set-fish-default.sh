#!/bin/zsh
# Fish のパスをシェル一覧に追加
echo "$(which fish)" | sudo tee -a /etc/shells

# Fish をデフォルトシェルに変更
chsh -s "$(which fish)"
