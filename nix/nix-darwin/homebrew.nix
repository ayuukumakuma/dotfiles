{ local, ... }:
let
  homebrewPrefix = "/opt/homebrew";
  brewBin = "${homebrewPrefix}/bin/brew";
  homebrewBinDir = "${homebrewPrefix}/bin";
  moBin = "${homebrewPrefix}/opt/mo/bin/mo";
  moleBin = "${homebrewPrefix}/opt/mole/bin/mole";
in
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
      # `mo` と `mole` はどちらも `mo` バイナリを持つため、brew 管理の link は使わない。
      # activation の前後で unlink/link を明示的に制御する。
      {
        name = "mo";
        link = false;
      }
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

  # `mo` と `mole` はどちらも `mo` バイナリを持つため、brew 実行前に両方 unlink して衝突を避ける。
  system.activationScripts.preActivation.text = ''
    if [ -x ${brewBin} ]; then
      ${brewBin} unlink mo >/dev/null 2>&1 || true
      ${brewBin} unlink mole >/dev/null 2>&1 || true
    fi
  '';

  # brew 管理の link を避けた上で、必要なコマンドだけ /opt/homebrew/bin に戻す。
  # activation は root 実行だが /opt/homebrew/bin の owner に揃えるため sudo -u でユーザー権限に降りる。
  system.activationScripts.postActivation.text = ''
    if [ -x ${moBin} ]; then
      sudo -u ${local.userName} ln -sfn ${moBin} ${homebrewBinDir}/mo
    fi

    if [ -x ${moleBin} ]; then
      sudo -u ${local.userName} ln -sfn ${moleBin} ${homebrewBinDir}/mole
    fi
  '';
}
