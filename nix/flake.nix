{
  description = "My Dotfiles.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
    }:
    let
      system = "aarch64-darwin";
      pkgsConfig = import ./pkgs.nix { inherit nixpkgs system; };
      pkgs = pkgsConfig.pkgs;
    in
    {
      packages.${system}.my-packages = pkgs.buildEnv {
        name = "my-packages";
        paths = pkgsConfig.myPackages;
      };

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
      };

      darwinConfigurations.ayuukumakuma-darwin = nix-darwin.lib.darwinSystem {
        system = system;
        modules = [ ./nix-darwin/config.nix ];
      };
    };
}
