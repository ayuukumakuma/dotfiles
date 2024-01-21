# zsh config

# 環境変数を補完する
setopt AUTO_PARAM_KEYS

# 履歴ファイルの保存先
HISTFILE=~/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# alias
alias vi="nvim"
alias ls="exa"
alias ll="exa -lahg --icons"
alias c="clear"
alias reload="exec $SHELL"
alias cat="bat --theme 'Nord'"
alias grep="rg"
alias f="fzf"
function cd {
    builtin cd "$@" && ll
}

# Starship initializer
eval "$(starship init zsh)"

# sheldon initializer
eval "$(sheldon source)"

# fzf config
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!\.git/*'"
export FZF_DEFAULT_OPTS="--reverse --inline-info"  
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf initializer
. /opt/homebrew/opt/asdf/libexec/asdf.sh
