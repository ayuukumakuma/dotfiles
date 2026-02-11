{ ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users."nasuno.ayumu" =
      { ... }:
      {
        imports = [
          ./packages.nix
          ./files.nix
        ];

        home.stateVersion = "24.11";
        home.username = "nasuno.ayumu";
        home.homeDirectory = "/Users/nasuno.ayumu";
      };
  };
}
