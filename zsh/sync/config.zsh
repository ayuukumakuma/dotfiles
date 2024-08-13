#!/bin/bash

# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=30000
# shellcheck disable=SC2034
SAVEHIST=30000

# 他のzshと履歴を共有
setopt inc_append_history
setopt share_history

# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# パスを直接入力してもcdする
setopt auto_cd

# cd-<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# 環境変数を補完
setopt auto_param_keys

# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
