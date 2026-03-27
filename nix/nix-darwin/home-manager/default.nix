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
      { config, ... }:
      {
        imports = [
          ./packages.nix
          ./files.nix
        ];

        home.stateVersion = "24.11";
        home.username = local.userName;
        home.homeDirectory = local.homeDirectory;

        launchd.agents.gazectl = {
          enable = true;
          config = {
            Label = "com.gazectl.agent";
            ProgramArguments = [
              "${config.home.profileDirectory}/bin/bun"
              "x"
              "gazectl@latest"
            ];
            RunAtLoad = true;
            KeepAlive = true;
            StandardOutPath = "/tmp/gazectl-stdout.log";
            StandardErrorPath = "/tmp/gazectl-stderr.log";
          };
        };
      };
  };
}
