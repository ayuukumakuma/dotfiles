{
  config,
  local,
  pkgs,
  ...
}:
let
  dotfilesRoot = local.dotfilesRoot;
  oos = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.enable = true;
  xdg.configFile = {
    fish = {
      source = oos "${dotfilesRoot}/fish";
    };
    git = {
      source = oos "${dotfilesRoot}/git";
    };
    "mise/config.toml".source = oos "${dotfilesRoot}/mise/config.toml";
    nvim = {
      source = oos "${dotfilesRoot}/nvim";
    };
    lazygit = {
      source = oos "${dotfilesRoot}/lazygit";
    };
    yazi = {
      source = oos "${dotfilesRoot}/yazi";
    };
    "wezterm/wezterm.lua".source = oos "${dotfilesRoot}/wezterm/wezterm.lua";
    zed = {
      source = oos "${dotfilesRoot}/zed";
    };

    # direnvrc は ${pkgs.nix-direnv} の Nix Store パスを参照するため
    # dotfiles 側に静的ファイルとして管理できない。text で直接記述する。
    "direnv/direnvrc" = {
      text = "source ${pkgs.nix-direnv}/share/nix-direnv/direnvrc";
    };
  };

  home.file = {
    ".aerospace.toml".source = oos "${dotfilesRoot}/aerospace/.aerospace.toml";
    ".agents".source = oos "${dotfilesRoot}/agents";
    ".claude/settings.json".source = oos "${dotfilesRoot}/claude/settings.json";
    ".claude/statusline.py".source = oos "${dotfilesRoot}/claude/statusline.py";
    ".claude/hooks".source = oos "${dotfilesRoot}/claude/hooks";
    ".claude/agents".source = oos "${dotfilesRoot}/claude/agents";
    ".claude/skills".source = oos "${dotfilesRoot}/agents/skills";
    ".claude/CLAUDE.md".source = oos "${dotfilesRoot}/claude/CLAUDE.md";
    ".cursor/skills".source = oos "${dotfilesRoot}/agents/skills";
    ".codex/config.toml".source = oos "${dotfilesRoot}/codex/config.toml";
    ".codex/hooks".source = oos "${dotfilesRoot}/codex/hooks";
    ".codex/hooks.json".source = oos "${dotfilesRoot}/codex/hooks.json";
  };
}
