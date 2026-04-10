{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
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
    claude-code
    just
    mise
    jq
    jnv
    neovim
    tre-command
    ffmpeg
    hyperfine
    fd
    wget
    just-lsp
    tmux
    ghq
    terminal-notifier
    direnv
    nix-direnv
    awscli2
    lazygit
    openssl_3
    (yazi.override {
      _7zz = pkgs._7zz-rar;
    })
    _7zz-rar
    imagemagick
    resvg
    poppler
    rtk
    github-copilot-cli
    inputs.guard-and-guide.packages.${pkgs.system}.default
    (callPackage ../../pkgs/site2skill/default.nix { })
    (callPackage ../../pkgs/tree-sitter-cli/default.nix { })
  ];
}
