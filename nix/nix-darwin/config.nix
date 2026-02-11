{ pkgs, ... }:
{
  imports = [
    ./system.nix
    ./homebrew.nix
    ./home-manager.nix
  ];
}
