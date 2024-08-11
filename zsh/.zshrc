#!/bin/bash
ZSH_DIR="${HOME}/dotfiles/zsh"

### 別ファイルの設定を読み込み
# .zshがディレクトリで、読み取り、実行、が可能なとき
if [ -d "$ZSH_DIR" ] && [ -r "$ZSH_DIR" ] && [ -x "$ZSH_DIR" ]; then
  # zshディレクトリより下にある、.zshファイルの分、繰り返す
  for file in "${ZSH_DIR}"/*.zsh; do
    # 読み取り可能ならば実行する
    [ -r "$file" ] && source "$file"
  done
fi

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.starship.toml
