{ local, pkgs, ... }:
{
  environment.systemPath = [
    # `homebrew.goPackages` uses `go install`, which writes binaries to `$HOME/go/bin` by default.
    "${local.homeDirectory}/go/bin"
  ];

  homebrew = {
    enable = true;
    enableFishIntegration = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    brews = [
      ### CLI Applications not available in nixpkgs
      "fisher"
      "mas" # Mac App Store CLI
      "im-select"
      "git-delta"
      "agent-browser"
      "gemini-cli"
      "mo"

      ### Ruby環境用はbrewの方が相性が良いのでこちらでインストールする
      "mysql@8.0"
      "libyaml"
      "pkg-config"
      "vips"
    ];
    taps = [
      "nikitabobko/tap" # aerospace
      "daipeihust/tap" # im-select
      "k1LoW/tap" # mo (browser markdown viewer)
      "Jean-Tinland/a-bar" # menubar
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
      "orbstack"
      "logitech-g-hub"
      "hhkb"
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
      "thebrowsercompany-dia"
      "visual-studio-code"
      "altserver"
      "zen"
      "claude"
      "spotify"
      "azookey"
      "a-bar"

      ### Fonts
      "font-hackgen-nerd"
      "font-monaspace"
    ];
    masApps = {
      "Klack" = 6446206067;
      "Grila" = 6444335028;
    };

    goPackages = [
    ];
  };
}
