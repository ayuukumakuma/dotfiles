{ inputs, local, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit
        local
        inputs
        ;
    };

    users.${local.userName} =
      { ... }:
      {
        imports = [
          ./packages/common.nix
          ./files/common.nix
          (./files + "/${local.profile}.nix")
        ];

        home.stateVersion = "24.11";
        home.username = local.userName;
        home.homeDirectory = local.homeDirectory;
      };
  };
}
