# dotfiles

## setup

```bash
git clone https://github.com/ayuukumakuma/dotfiles.git <dotfiles_directory>
cd <dotfiles_directory>

cp nix/local.nix.example nix/local.nix
$EDITOR nix/local.nix # local.nix edit

cd nix
nix flake update
nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
cd ..

./script/set-fish-default.sh
```

## directory structure

```
.
├── nix/
│   ├── flake.nix
│   ├── nix-darwin/
│   │   ├── default.nix
│   │   ├── nix-core.nix
│   │   ├── users.nix
│   │   ├── home-manager/
│   │   │   ├── default.nix
│   │   │   ├── packages.nix
│   │   │   └── files.nix
│   │   ├── homebrew.nix
│   │   └── system.nix
│   └── pkgs/
├── agents/
├── codex/
├── fish/
├── git/
├── mise/
├── nvim/
├── lazygit/
├── yazi/
├── aerospace/
├── claude/
├── cursor/
├── raycast/
├── menubar-script/
├── wezterm/
├── zed/
└── script/
```
