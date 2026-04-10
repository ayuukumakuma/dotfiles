{ ... }:
{
  imports = [
    ./nix-core.nix
    ./users.nix
    ./system.nix
    ./ime.nix
    ./homebrew.nix
    ./home-manager/default.nix
  ];
}
