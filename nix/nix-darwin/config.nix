{ pkgs, ... }:
{
  imports = [
    ./system.nix
    ./homebrew.nix
  ];
}