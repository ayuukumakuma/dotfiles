# dotfiles

## setup

```bash
git clone https://github.com/ayuukumakuma/dotfiles.git <dotfiles_directory>
cd <dotfiles_directory>

# ひな形は nix/local.nix.example を参照
$EDITOR nix/local.nix # local.nix edit

cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#<darwinConfigName>
cd ..

./script/set-fish-default.sh
```

## directory structure (major paths)

```text
.
├── .zed/
├── AGENTS.md
├── README.md
├── build/
├── config/
│   ├── aerospace/
│   ├── agents/
│   │   └── skills/
│   ├── cage/
│   ├── claude/
│   ├── codex/
│   ├── fish/
│   ├── gh/
│   ├── git/
│   ├── guard-and-guide/
│   ├── lazygit/
│   ├── mise/
│   ├── nvim/
│   ├── raycast/
│   ├── tmux/
│   ├── wezterm/
│   ├── yazi/
│   └── zed/
├── justfile
├── menubar-script/
├── nix/
│   ├── flake.nix
│   ├── flake.lock
│   ├── local.nix
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
├── result
├── script/
│   └── set-fish-default.sh
├── typos.toml
```
