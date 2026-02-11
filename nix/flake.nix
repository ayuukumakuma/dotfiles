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
    in
    {
      apps.${system}.update = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-script" ''
            set -e
            echo "Updating flake..."
            nix flake update
            echo "Updating profile..."
            nix profile upgrade nix
            echo "Updating nix-darwin..."
            nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin
            echo "Update complete!"
          ''
        );
        meta = {
          description = "Update flake inputs, profile packages, and nix-darwin configuration";
        };
      };

      darwinConfigurations.ayuukumakuma-darwin = nix-darwin.lib.darwinSystem {
        system = system;
        modules = [
          home-manager.darwinModules.home-manager
          ./nix-darwin/config.nix
        ];
      };
    };
}
