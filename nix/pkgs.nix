{ nixpkgs, system }:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
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
    nixfmt
    nixd
    fzf
    bat
    ripgrep
    eza
    fish
    gh
    git
    just
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
    just-lsp
    tmux
    ghq
    terminal-notifier
    # cursor-cli `curl https://cursor.com/install -fsS | bash`
  ];
}
