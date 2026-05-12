{
  inputs,
  local,
  pkgs,
  ...
}:
let
  profilePackages = import (./. + "/${local.profile}.nix") {
    inherit
      inputs
      pkgs
      ;
  };

  commonPackages = with pkgs; [
    efm-langserver
    nixfmt
    nixd
    statix
    deadnix
    shellcheck
    shfmt
    stylua
    lua-language-server
    yamllint
    fzf
    bat
    ripgrep
    eza
    fish
    zoxide
    gh
    git
    just
    mise
    jq
    jnv
    luarocks
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
    socat
    ov
    mergiraf
    inputs.guard-and-guide.packages.${pkgs.system}.default
    (callPackage ../../../pkgs/site2skill/default.nix { })
    (callPackage ../../../pkgs/tree-sitter-cli/default.nix { })
  ];
in
{
  home.packages = commonPackages ++ profilePackages;
}
