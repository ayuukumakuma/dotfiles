{ local, pkgs, ... }:
let
  homeDir = local.homeDirectory;
  dataDir = "${homeDir}/.local/share/yaskkserv2";
  cacheDir = "${homeDir}/.cache/yaskkserv2";
  dictionary = "${dataDir}/dictionary.yaskkserv2";
  googleCache = "${cacheDir}/google.cache";
  yaskkserv2 = pkgs.callPackage ../pkgs/yaskkserv2/default.nix { };
in
{
  launchd.user.agents.yaskkserv2 = {
    serviceConfig = {
      Label = "com.ayuukumakuma.yaskkserv2";
      ProgramArguments = [
        "${yaskkserv2}/bin/yaskkserv2"
        "--google-suggest"
        "--google-cache-filename=${googleCache}"
        dictionary
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "${homeDir}/Library/Logs/yaskkserv2.log";
      StandardErrorPath = "${homeDir}/Library/Logs/yaskkserv2.err.log";
    };
  };

  system.defaults.CustomUserPreferences."net.mtgto.inputmethod.macSKK".skkserv = {
    address = "127.0.0.1";
    enableCompletion = 1;
    enabled = 1;
    encoding = 3;
    port = 1178;
    saveToUserDict = 1;
  };
}
