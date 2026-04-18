{ local, ... }:
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
      # mole は `mo` バイナリが k1Low/tap の mo と衝突するため link せず、mole バイナリのみ後段で symlink する。
      {
        name = "mole";
        link = false;
      }
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

  # mole formula は `mo` バイナリが k1Low/tap の mo と衝突するため un-linked。
  # activation は root 実行だが /opt/homebrew/bin の owner に揃えるため sudo -u でユーザー権限に降りる。
  system.activationScripts.postActivation.text = ''
    if [ -x /opt/homebrew/opt/mole/bin/mole ]; then
      sudo -u ${local.userName} ln -sfn /opt/homebrew/opt/mole/bin/mole /opt/homebrew/bin/mole
    fi
  '';
}
