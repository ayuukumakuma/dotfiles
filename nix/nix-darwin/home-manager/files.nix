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
    "zed/settings.json".source = oos "${dotfilesRoot}/zed/settings.json";
    "zellij/config.kdl".source = oos "${dotfilesRoot}/zellij/config.kdl";

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
    ".claude/statusline.sh".source = oos "${dotfilesRoot}/claude/statusline.sh";
    ".claude/hooks/state-notify.sh".source = oos "${dotfilesRoot}/claude/hooks/state-notify.sh";
    ".codex/config.toml".source = oos "${dotfilesRoot}/codex/config.toml";
    ".codex/hooks/notify-terminal-notifier.sh".source =
      oos "${dotfilesRoot}/codex/hooks/notify-terminal-notifier.sh";
    "Library/Application Support/Cursor/User/settings.json".source =
      oos "${dotfilesRoot}/cursor/settings.json";
    "Library/Application Support/Cursor/User/keybindings.json".source =
      oos "${dotfilesRoot}/cursor/keybindings.json";
  };
}
