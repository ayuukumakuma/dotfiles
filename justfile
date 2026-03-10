_:
    just --list

[working-directory("nix")]
update:
    nix flake update

alias u := update

[working-directory("nix")]
switch:
    sudo -H nix run nix-darwin -- switch --flake path:.#$(nix eval --file local.nix darwinConfigName --raw)

alias s := switch

[working-directory("nix")]
check:
    nix flake check

alias c := check

[working-directory("nix")]
update-and-switch: update switch

alias us := update-and-switch
