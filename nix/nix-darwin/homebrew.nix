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
      "im-select"
      "git-delta"

      ### Ruby環境用はbrewの方が相性が良いのでこちらでインストールする
      "mysql@8.0"
      "libyaml"
      "pkg-config"
      "vips"
    ];
    taps = [
      "nikitabobko/tap" # aerospace
      "tw93/tap" # mole
      "daipeihust/tap" # im-select
    ];
    casks = [
      ### GUI Applications
      # "slack"
      # "google-chrome"
      "wezterm"
      "1password"
      "1password-cli"
      "aerospace"
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
      "keycastr"
      "orbstack"
      "logitech-g-hub"
      "hhkb"
      "spotify"
      "another-redis-desktop-manager"
      "cap"
      "gyazo"
      "google-drive"
      "zed"
      "deskpad"
      "logi-options+"
      "affinity"
      "notion"
      "ubersicht"
      "ankerwork"
      "codex-app"
      "codex" # nixpkgは更新が遅い
      "chatgpt"
      "thebrowsercompany-dia"

      ### Fonts
      "font-hackgen-nerd"
      "font-monaspace"
    ];
    masApps = {
      "Klack" = 6446206067;
      "Grila" = 6444335028;
    };
  };
}
