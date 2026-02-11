{
  description = "My Dotfiles.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
    }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      localConfigPath = ./local.nix;
      local =
        if builtins.pathExists localConfigPath then
          import localConfigPath
        else
          import ./local.nix.example;
      darwinConfigName =
        if local ? darwinConfigName then
          local.darwinConfigName
        else
          throw "Missing local.darwinConfigName in nix/local.nix. Create/update it from nix/local.nix.example.";
    in
    {
      apps.${system}.update = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-script" ''
            set -euo pipefail
            echo "Updating flake..."
            nix flake update
            echo "Checking flake..."
            nix flake check
            echo "Updating nix-darwin..."
            nix run nix-darwin -- switch --flake .#${darwinConfigName}
            echo "Update complete!"
          ''
        );
        meta = {
          description = "Update flake inputs, profile packages, and nix-darwin configuration";
        };
      };

      darwinConfigurations = {
        ${darwinConfigName} = nix-darwin.lib.darwinSystem {
          system = system;
          specialArgs = {
            inherit local;
          };
          modules = [
            home-manager.darwinModules.home-manager
            ./nix-darwin/default.nix
          ];
        };
      };
    };
}
