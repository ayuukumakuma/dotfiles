{ lib, ... }:
let
  # fish_variables は Fish が実行時に更新するため、Home Manager 管理対象から除外する。
  fishSource = lib.cleanSourceWith {
    src = ../../fish;
    filter =
      path: _type:
      let
        base = baseNameOf path;
      in
      base != "fish_variables";
  };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users."nasuno.ayumu" =
      { ... }:
      {
        home.stateVersion = "24.11";
        home.username = "nasuno.ayumu";
        home.homeDirectory = "/Users/nasuno.ayumu";

        xdg.enable = true;
        xdg.configFile = {
          fish = {
            source = fishSource;
            recursive = true;
          };
          git = {
            source = ../../git;
          };
          "mise/config.toml".source = ../../mise/config.toml;
          nvim = {
            source = ../../nvim;
          };
          "wezterm/wezterm.lua".source = ../../wezterm/wezterm.lua;
          "zed/settings.json".source = ../../zed/settings.json;
          "zellij/config.kdl".source = ../../zellij/config.kdl;
        };

        home.file = {
          ".aerospace.toml".source = ../../aerospace/.aerospace.toml;
          ".agents".source = ../../agents;
          ".claude/settings.json".source = ../../claude/settings.json;
          ".claude/statusline.sh".source = ../../claude/statusline.sh;
          ".claude/hooks/state-notify.sh".source = ../../claude/hooks/state-notify.sh;
          ".codex/config.toml".source = ../../codex/config.toml;
          ".codex/hooks/notify-terminal-notifier.sh".source = ../../codex/hooks/notify-terminal-notifier.sh;
          "Library/Application Support/Cursor/User/settings.json".source = ../../cursor/settings.json;
          "Library/Application Support/Cursor/User/keybindings.json".source = ../../cursor/keybindings.json;
        };
      };
  };
}
