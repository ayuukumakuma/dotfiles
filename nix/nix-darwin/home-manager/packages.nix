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
    kubectl
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
    bun
    nodejs_25
    python315
    ruby
    awscli2
    lazygit
    octorus
    openssl_3
    (yazi.override {
      _7zz = pkgs._7zz-rar;
    })
    _7zz-rar
    imagemagick
    resvg
    poppler
    inputs.arto.packages.${pkgs.system}.default
    inputs.cf-page-to-md.packages.${pkgs.system}.default
    (inputs.islands-dark.lib.${pkgs.system}.mkVscode {
      vscodePackage = pkgs.vscode;
    })
    (callPackage ../../pkgs/git-cz/default.nix { })
    (callPackage ../../pkgs/portless/default.nix { })
    (callPackage ../../pkgs/tree-sitter-cli/default.nix { })
  ];
}
