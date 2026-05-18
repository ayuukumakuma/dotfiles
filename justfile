darwin_config_name := "$(nix eval --file local.nix darwinConfigName --raw)"

_:
    just --list

[working-directory("nix")]
update:
    nix flake update

alias u := update

[working-directory("nix")]
build:
    nh darwin build . -H {{darwin_config_name}}

[working-directory("nix")]
switch:
    nh darwin switch . -H {{darwin_config_name}}

alias s := switch

[working-directory("nix")]
check:
    nix flake check

alias c := check

[working-directory("nix")]
clean:
    nh clean all --keep-since 4d --keep 3

[working-directory("nix")]
update-and-switch: update switch

alias us := update-and-switch
