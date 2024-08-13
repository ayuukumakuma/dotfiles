#!/bin/bash

alias c='clear'
alias reload='exec $SHELL -l'
alias ls='eza -alh --icons=auto --no-user'
alias cat='bat --theme="Dracula"'
alias find='fd'
alias cdf='cd "$(dirname "$(fzf --preview="bat --color=always {}")")"'
alias grep='rg'
alias g='git'
