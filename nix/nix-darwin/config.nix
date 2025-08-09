{ pkgs, ... }:
{
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  # bordersをバックグラウンドで起動する
  # 再起動: launchctl kickstart -k gui/$(id -u)/org.nixos.jankyborders
  launchd.user.agents.jankyborders = {
    path = [ pkgs.jankyborders ];
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.jankyborders}/bin/borders"
        "style=round"
        "width=5.0"
        "hidpi=on"
        "active_color=0xc0ff00f2"
        "inactive_color=0xff0080ff"
        "active_border_color=0xc0ff00f2"
      ];
      RunAtLoad = true;
      KeepAlive = true;
    };
  };
  environment.systemPackages = [ pkgs.jankyborders ];

  system = {
    stateVersion = 6;
    primaryUser = "nasuno.ayumu";

    keyboard = {
      enableKeyMapping = true;
      # CapsLockをControlにマッピング
      remapCapsLockToControl = true;
    };

    defaults = {
      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
        };
      };
      WindowManager = {
        # デスクトップ上のアイテムを非表示にする
        StandardHideDesktopIcons = true;
      };
      controlcenter = {
        # メニューバーにAirDropを表示しない
        AirDrop = false;
        # メニューバーにバッテリー残量を表示しない(Statusで表示しているため)
        BatteryShowPercentage = false;
        # メニューバーにBluetoothを表示する
        Bluetooth = true;
      };
      dock = {
        # アプリケーションスイッチャーを全てのディスプレイに表示する
        appswitcher-all-displays = true;
        # Dockの自動非表示を有効にする
        autohide = true;
        # Mission ControlのExposeでアプリケーションをグループ化する
        expose-group-apps = true;
        # Dockのホバー時の拡大サイズ
        largesize = 48;
        # Dockのホバー時の拡大を有効にする
        magnification = true;
        # Dockの位置を左側に設定する
        orientation = "left";
        # 最近使用したアプリケーションをDockに表示しない
        show-recents = false;
        # 開いているアプリケーションのみをDockに表示する
        static-only = true;
        # Dock内のアイコンサイズ
        tilesize = 32;
        # ホットコーナー(左下)にLaunchpadを設定する
        wvous-bl-corner = 11;
        # ホットコーナー(右下)にApplication Windowsを設定する
        wvous-br-corner = 3;
        # ホットコーナー(左上)に通知センターを設定する
        wvous-tl-corner = 12;
        # ホットコーナー(右上)にMission Controlを設定する
        wvous-tr-corner = 2;
      };
      finder = {
        # 拡張子を常に表示する
        AppleShowAllExtensions = true;
        # 隠しファイルを常に表示する
        AppleShowAllFiles = true;
        # Finderアイコンをデスクトップに表示しない
        CreateDesktop = false;
        # 拡張子を変更するときに警告を表示しない
        FXEnableExtensionChangeWarning = false;
        # リストビューをデフォルトにする
        FXPreferredViewStyle = "Nlsv";
        # CD, DVDなどをデスクトップに表示しない
        ShowRemovableMediaOnDesktop = false;
        # Finderの下部にステータスバーを表示する
        ShowStatusBar = true;
        # 完全パスを表示する
        _FXShowPosixPathInTitle = true;
      };
      magicmouse = {
        # 左右クリックを有効にする
        MouseButtonMode = "TwoButton";
      };
      menuExtraClock = {
        # メニューバーの時計を24時間表示にする
        Show24Hour = true;
        # メニューバーに余裕がある場合は日付を表示する
        ShowDate = 0;
        # 日付を表示する
        ShowDayOfMonth = true;
        # 曜日を表示する
        ShowDayOfWeek = true;
        # 秒は表示しない
        ShowSeconds = false;
      };
      spaces = {
        # ディスプレイごとに異なるスペースを使用する
        spans-displays = false;
      };
      universalaccess = {
        # カーソルのサイズ
        mouseDriverCursorSize = 2.0;
      };
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    caskArgs = {
      appdir = "~/Applications";
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
    ];
    casks = [
      ### GUI Applications
      # "slack" #  会社標準搭載
      # "google-chrome" #  会社標準搭載
      "wezterm"
      "1password"
      "1password-cli"
      "aerospace"
      "cursor"
      "figma"
      "firefox"
      "gather"
      "obsidian"
      "raycast"
      "stats"
      "shottr"
      "sequel-ace"
      "scroll-reverser"
      "notchnook"
      "meetingbar"
      "jordanbaird-ice"
      "kap"
      "keycastr"
      "onyx"
      "orbstack"
      "zed"
      "arc"
      "logitech-g-hub"
      "hhkb"
      "notion"

      ### Fonts
      "font-google-sans-code"
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
