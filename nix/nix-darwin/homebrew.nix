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
      "mas" # Mac App Store CLI
      "mole"

      ### Ruby環境用はbrewの方が相性が良いのでこちらでインストールする
      "mysql@8.0"
      "libyaml"
      "pkg-config"
      "vips"
    ];
    taps = [
      "nikitabobko/tap"
      "BarutSRB/tap"
      "tw93/tap"
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
      # "jordanbaird-ice"
      "keycastr"
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
      "google-drive"
      "claude"
      "zed"
      "deskpad"
      "logi-options+"
      "affinity"
      "notion"


      ### Fonts
      "font-hackgen-nerd"
      "font-monaspace"
    ];
    masApps = {
      "Klack" = 6446206067;
    };
  };
}
