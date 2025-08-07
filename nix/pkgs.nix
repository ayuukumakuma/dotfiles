{ nixpkgs, system }:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (nixpkgs.lib.getName pkg) [
        "claude-code"
      ];
  };
in
{
  inherit pkgs;

  myPackages = with pkgs; [
    ### CLI Applications
    nil
    nixfmt-rfc-style
    fzf
    bat
    ripgrep
    eza
    fish
    gh
    git
    just
    claude-code
    terminal-notifier
    gemini-cli
    jankyborders
    mise
    libyaml
    libyaml.dev
    pkg-config
    openssl
    openssl.dev
    openssl.out
    mysql84
    zstd
    zstd.dev
  ];
}
