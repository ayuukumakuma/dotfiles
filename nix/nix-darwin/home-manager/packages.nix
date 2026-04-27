{
  inputs,
  local,
  pkgs,
  ...
}:
let
  commonPackages = with pkgs; [
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
    socat
    ov
    mergiraf
    inputs.guard-and-guide.packages.${pkgs.system}.default
    (callPackage ../../pkgs/site2skill/default.nix { })
    (callPackage ../../pkgs/tree-sitter-cli/default.nix { })
  ];

  # 仕事用だけで入れたい Nix パッケージはここに追加する。
  workPackages = [ ];

  # プライベート用だけで入れたい Nix パッケージはここに追加する。
  privatePackages = [ ];

  profilePackages = if local.profile == "work" then workPackages else privatePackages;
in
{
  home.packages = commonPackages ++ profilePackages;
}
