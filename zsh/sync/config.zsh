#!/bin/bash

# 他のzshと履歴を共有
setopt inc_append_history
setopt share_history

# パスを直接入力してもcdする
setopt AUTO_CD

# 環境変数を補完
setopt AUTO_PARAM_KEYS
