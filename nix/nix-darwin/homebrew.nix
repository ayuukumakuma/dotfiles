{ local, ... }:
let
  homebrewPrefix = "/opt/homebrew";
  brewBin = "${homebrewPrefix}/bin/brew";
  moBin = "${homebrewPrefix}/opt/mo/bin/mo";
  moleBin = "${homebrewPrefix}/opt/mole/bin/mole";
  managedSymlinks = {
    "${homebrewPrefix}/bin/mo" = moBin;
    "${homebrewPrefix}/etc/bash_completion.d/mo" = "${homebrewPrefix}/opt/mo/etc/bash_completion.d/mo";
    "${homebrewPrefix}/share/fish/vendor_completions.d/mo.fish" =
      "${homebrewPrefix}/opt/mo/share/fish/vendor_completions.d/mo.fish";
    "${homebrewPrefix}/share/zsh/site-functions/_mo" =
      "${homebrewPrefix}/opt/mo/share/zsh/site-functions/_mo";
    "${homebrewPrefix}/bin/mole" = moleBin;
  };
  managedSymlinkPaths = builtins.attrNames managedSymlinks;
  createManagedSymlinks = builtins.concatStringsSep "\n" (
    builtins.attrValues (
      builtins.mapAttrs (path: target: ''
        if [ -e ${target} ]; then
          sudo -u ${local.userName} ln -sfn ${target} ${path}
        fi
      '') managedSymlinks
    )
  );
  isWorkProfile = local.profile == "work";

  commonBrews = [
    ### CLI Applications not available in nixpkgs
    "fisher"
    "mas" # Mac App Store CLI
    "im-select"
    "git-delta"
    # `mo` と `mole` は同名バイナリを含むため、必要な link だけ activation で戻す。
    {
      name = "mo";
      link = false;
    }
    {
      name = "mole";
      link = false;
    }
  ];

  # 仕事用だけで入れたい Homebrew CLI はここに追加する。
  workBrews = [ ];

  # プライベート用だけで入れたい Homebrew CLI はここに追加する。
  privateBrews = [ ];

  profileBrews = if isWorkProfile then workBrews else privateBrews;

  commonTaps = [
    "nikitabobko/tap" # aerospace
    "daipeihust/tap" # im-select
    "k1LoW/tap" # mo (browser markdown viewer)
    "Jean-Tinland/a-bar" # menubar
    "Warashi/tap" # cage
    "productdevbook/tap" # portkiller
  ];

  # 仕事用だけで使う tap はここに追加する。
  workTaps = [ ];

  # プライベート用だけで使う tap はここに追加する。
  privateTaps = [ ];

  profileTaps = if isWorkProfile then workTaps else privateTaps;

  commonCasks = [
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

  # 仕事用だけで入れたい GUI アプリやフォントはここに追加する。
  workCasks = [ ];

  # プライベート用だけで入れたい GUI アプリやフォントはここに追加する。
  privateCasks = [ ];

  profileCasks = if isWorkProfile then workCasks else privateCasks;

  commonMasApps = {
    "Klack" = 6446206067;
    "Grila" = 6444335028;
  };

  # 仕事用だけで入れたい Mac App Store アプリはここに追加する。
  workMasApps = { };

  # プライベート用だけで入れたい Mac App Store アプリはここに追加する。
  privateMasApps = { };

  profileMasApps = if isWorkProfile then workMasApps else privateMasApps;
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
    brews = commonBrews ++ profileBrews;
    taps = commonTaps ++ profileTaps;
    casks = commonCasks ++ profileCasks;
    masApps = commonMasApps // profileMasApps;
  };

  # `mo` と `mole` は同名バイナリを含むため、brew 管理の link を外して衝突を避ける。
  system.activationScripts.preActivation.text = ''
    if [ -x ${brewBin} ]; then
      ${brewBin} unlink mo >/dev/null 2>&1 || true
      ${brewBin} unlink mole >/dev/null 2>&1 || true
    fi

    for path in ${toString managedSymlinkPaths}; do
      if [ -L "$path" ]; then
        rm -f "$path"
      fi
    done
  '';

  # brew 管理の link を避けた上で、必要なコマンドと補完だけ /opt/homebrew 配下に戻す。
  # activation は root 実行だが /opt/homebrew/bin の owner に揃えるため sudo -u でユーザー権限に降りる。
  system.activationScripts.postActivation.text = ''
    ${createManagedSymlinks}
  '';
}
