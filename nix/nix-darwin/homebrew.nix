{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    brews = [
      ### CLI Applications not available in nixpkgs
      "fisher"
      ### Ruby環境用はbrewの方が相性が良いのでこちらでインストールする
      "mysql@8.0"
      "libyaml"
      "pkg-config"
      "vips"
    ];
    taps = [
      "nikitabobko/tap"
      "BarutSRB/tap"
    ];
    casks = [
      ### GUI Applications
      # "slack" #  会社標準搭載
      # "google-chrome" #  会社標準搭載
      "wezterm"
      "1password"
      "1password-cli"
      "hyprspace"
      "cursor"
      "figma"
      "firefox"
      "obsidian"
      "musaicfm"
      "raycast"
      "stats"
      "shottr"
      "sequel-ace"
      "scroll-reverser"
      "notchnook"
      "meetingbar"
      "jordanbaird-ice"
      "keycastr"
      "onyx"
      "orbstack"
      "arc"
      "logitech-g-hub"
      "hhkb"
      "azooKey"
      "spotify"
      "chatgpt"
      "another-redis-desktop-manager"
      "cap"
      "gyazo"
      "antigravity"
      "google-drive"

      ### Fonts
      "font-hackgen-nerd"
      "font-monaspace"
    ];
  };
}
