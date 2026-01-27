{ nixpkgs, system }:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ ];
    overlays = [
      (final: prev: {
        fish = prev.fish.overrideAttrs (old: {
          doCheck = false;
        });
      })
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
    codex
    jankyborders
    mise
    kubectl
    jq
    jnv
    neovim
    tre-command
    ffmpeg
    hyperfine
    fd
    zellij
    wget
  ];
}
