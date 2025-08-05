{ pkgs, ... }:
{
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  system = {
    stateVersion = 6;
    primaryUser = "nasuno.ayumu";

    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        orientation = "left";
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
    ];
    taps = [
      "nikitabobko/tap"
    ];
    casks = [
      ### GUI Applications
      # "slack" #  会社標準搭載
      # "google-chrome" #  会社標準搭載
      "wezterm"
      "visual-studio-code"
      "1password"
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
