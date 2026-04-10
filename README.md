# dotfiles

## setup

```bash
git clone https://github.com/ayuukumakuma/dotfiles.git <dotfiles_directory>
cd <dotfiles_directory>

cp nix/local.nix.example nix/local.nix
$EDITOR nix/local.nix # local.nix edit

cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
cd ..

./script/set-fish-default.sh
```

## directory structure

```text
.
├── AGENTS.md
├── README.md
├── aerospace/
├── agents/
│   └── skills/
├── build/
├── cage/
├── claude/
├── codex/
├── cursor/
├── nix/
│   ├── flake.nix
│   ├── flake.lock
│   ├── local.nix.example
│   ├── nix-darwin/
│   │   ├── default.nix
│   │   ├── nix-core.nix
│   │   ├── users.nix
│   │   ├── system.nix
│   │   ├── homebrew.nix
│   │   ├── home-manager/
│   │   │   ├── default.nix
│   │   │   ├── packages.nix
│   │   │   └── files.nix
│   └── pkgs/
│       ├── site2skill/
│       └── tree-sitter-cli/
├── fish/
├── gh/
├── git/
├── guard-and-guide/
├── justfile
├── lazygit/
├── menubar-script/
├── mise/
├── nvim/
├── raycast/
├── script/
├── tmux/
├── wezterm/
├── yazi/
├── zed/
└── typos.toml
```
