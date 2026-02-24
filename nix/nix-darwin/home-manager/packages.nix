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
    inputs.cf-page-to-md.packages.${pkgs.system}.default
    (callPackage ../../pkgs/git-cz/default.nix { })
    (callPackage ../../pkgs/portless/default.nix { })
    (callPackage ../../pkgs/tree-sitter-cli/default.nix { })
    # cursor command `curl https://cursor.com/install -fsS | bash`
  ];
}
