{
  homebrew = {
    enable = true;
    enableFishIntegration = true;
    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap";
    };
    brews = [
      ### CLI Applications not available in nixpkgs
      "fisher"
      "mas" # Mac App Store CLI
      "im-select"
      "git-delta"
      "mo"
    ];
    taps = [
      "nikitabobko/tap" # aerospace
      "daipeihust/tap" # im-select
      "k1LoW/tap" # mo (browser markdown viewer)
      "Jean-Tinland/a-bar" # menubar
      "Warashi/tap" # cage
      "productdevbook/tap" # portkiller
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
      "ankerwork"
      "codex-app"
      "codex"
      "thebrowsercompany-dia"
      "visual-studio-code"
      "zen"
      "claude"
      "spotify"
      "azookey"
      "a-bar"
      "beekeeper-studio"
      "keycastr"
      "cage"
      "chatgpt"
      "drawio"
      "portkiller"
      "tablepro"

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
