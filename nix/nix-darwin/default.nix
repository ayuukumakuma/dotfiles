{ ... }:
{
  imports = [
    ./nix-core.nix
    ./users.nix
    ./system.nix
    ./homebrew/common.nix
    ./home-manager/default.nix
  ];
}
