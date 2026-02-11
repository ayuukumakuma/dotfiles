{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./system.nix
    ./homebrew.nix
    ./home-manager.nix
  ];
}
