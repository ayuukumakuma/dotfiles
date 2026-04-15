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
    "mise/config.toml".source = oos "${configRoot}/mise/config.toml";
    nvim.source = oos "${configRoot}/nvim";
    lazygit.source = oos "${configRoot}/lazygit";
    yazi.source = oos "${configRoot}/yazi";
    tmux.source = oos "${configRoot}/tmux";
    "wezterm/wezterm.lua".source = oos "${configRoot}/wezterm/wezterm.lua";
    zed.source = oos "${configRoot}/zed";
    cage.source = oos "${configRoot}/cage";
    "guard-and-guide/rules.toml".source = oos "${configRoot}/guard-and-guide/rules.toml";

    # direnvrc は ${pkgs.nix-direnv} の Nix Store パスを参照するため
    # dotfiles 側に静的ファイルとして管理できない。text で直接記述する。
    "direnv/direnvrc" = {
      text = "source ${pkgs.nix-direnv}/share/nix-direnv/direnvrc";
    };
  };

  home.file = {
    ".aerospace.toml".source = oos "${configRoot}/aerospace/.aerospace.toml";
    ".agents".source = oos "${configRoot}/agents";
    ".claude/settings.json".source = oos "${configRoot}/claude/settings.json";
    ".claude/statusline.py".source = oos "${configRoot}/claude/statusline.py";
    ".claude/hooks".source = oos "${configRoot}/claude/hooks";
    ".claude/skills".source = oos "${configRoot}/agents/skills";
    ".claude/CLAUDE.md".source = oos "${configRoot}/claude/CLAUDE.md";
    ".cursor/skills".source = oos "${configRoot}/agents/skills";
    ".codex/config.toml".source = oos "${configRoot}/codex/config.toml";
    ".codex/hooks".source = oos "${configRoot}/codex/hooks";
    ".codex/hooks.json".source = oos "${configRoot}/codex/hooks.json";
  };
}
