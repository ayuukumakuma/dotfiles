#!/bin/bash

# zshの読み込み時間を計算するときはコメントアウトを外す
# zmodload zsh/zprof

export SHELDON_CONFIG_FILE=$HOME/.sheldon.toml
eval "$(sheldon source)"

# zprof
