{
  config,
  local,
  pkgs,
  ...
}:
let
  dotfilesRoot = local.dotfilesRoot;
  configRoot = "${dotfilesRoot}/config";
  oos = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.enable = true;
  xdg.configFile = {
    fish.source = oos "${configRoot}/fish";
    git.source = oos "${configRoot}/git";
    mise.source = oos "${configRoot}/mise";
    nvim.source = oos "${configRoot}/nvim";
    lazygit.source = oos "${configRoot}/lazygit";
    yazi.source = oos "${configRoot}/yazi";
    tmux.source = oos "${configRoot}/tmux";
    wezterm.source = oos "${configRoot}/wezterm";
    zed.source = oos "${configRoot}/zed";
    cage.source = oos "${configRoot}/cage";
    guard-and-guide.source = oos "${configRoot}/guard-and-guide";
    efm-langserver.source = oos "${configRoot}/efm-langserver";

    # direnvrc は ${pkgs.nix-direnv} の Nix Store パスを参照するため
    # dotfiles 側に静的ファイルとして管理できない。text で直接記述する。
    "direnv/direnvrc" = {
      text = "source ${pkgs.nix-direnv}/share/nix-direnv/direnvrc";
    };
  };

  home.file = {
    ".agents".source = oos "${configRoot}/agents";
    ".codex/hooks".source = oos "${configRoot}/codex/hooks";
    ".codex/hooks.json".source = oos "${configRoot}/codex/hooks.json";
    ".codex/AGENTS.md".source = oos "${configRoot}/codex/AGENTS.md";
  };
}
