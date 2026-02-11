{ local, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit local; };

    users.${local.userName} =
      { ... }:
      {
        imports = [
          ./packages.nix
          ./files.nix
        ];

        home.stateVersion = "24.11";
        home.username = local.userName;
        home.homeDirectory = local.homeDirectory;
      };
  };
}
