{
  inputs,
  pkgs,
  ...
}:

# 仕事用だけで入れたい Nix パッケージはここに追加する。
with pkgs;
[
  awscli2
  claude-code
]
