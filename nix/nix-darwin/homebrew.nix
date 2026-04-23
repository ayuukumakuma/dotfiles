{ local, ... }:
let
  homebrewPrefix = "/opt/homebrew";
  brewBin = "${homebrewPrefix}/bin/brew";
  homebrewBinDir = "${homebrewPrefix}/bin";
  moLinkPaths = [
    "${homebrewPrefix}/bin/mo"
    "${homebrewPrefix}/etc/bash_completion.d/mo"
    "${homebrewPrefix}/share/fish/vendor_completions.d/mo.fish"
    "${homebrewPrefix}/share/zsh/site-functions/_mo"
  ];
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
      # `mo` は Homebrew に通常 link させる。
      # `mole` だけ link を止め、`mole` コマンドを別名で戻す。
      "mo"
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

  # `mo` の手作り symlink が残っていると brew link が自分自身と衝突する。
  # `mole` も `mo` バイナリを持つため、brew 管理の link を外して衝突を避ける。
  system.activationScripts.preActivation.text = ''
    if [ -x ${brewBin} ]; then
      ${brewBin} unlink mo >/dev/null 2>&1 || true
      ${brewBin} unlink mole >/dev/null 2>&1 || true
    fi

    for path in ${toString moLinkPaths}; do
      if [ -L "$path" ]; then
        rm -f "$path"
      fi
    done
  '';

  # `mole` だけ brew 管理の link を避けた上で、必要なコマンドを /opt/homebrew/bin に戻す。
  # activation は root 実行だが /opt/homebrew/bin の owner に揃えるため sudo -u でユーザー権限に降りる。
  system.activationScripts.postActivation.text = ''
    if [ -x ${moleBin} ]; then
      sudo -u ${local.userName} ln -sfn ${moleBin} ${homebrewBinDir}/mole
    fi
  '';
}
