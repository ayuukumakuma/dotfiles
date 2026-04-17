# dotfiles

## setup

```bash
git clone https://github.com/ayuukumakuma/dotfiles.git <dotfiles_directory>
cd <dotfiles_directory>

# ひな形は nix/local.nix.example を参照
$EDITOR nix/local.nix # local.nix edit

just switch

./script/set-fish-default.sh
```

## directory structure (major paths)

```text
.
├── .claude/
│   └── settings.local.json
├── .editorconfig
├── .gitignore
├── .zed/
├── AGENTS.md
├── README.md
├── build/
│   ├── download/
│   └── markdown/
├── config/
│   ├── aerospace/
│   ├── agents/
│   │   └── skills/
│   ├── cage/
│   ├── claude/
│   │   └── hooks/
│   ├── codex/
│   │   └── hooks/
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
│   ├── claude/
│   ├── codex/
│   ├── ime/
│   ├── media/
│   └── notify-sound/
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
├── nvim.log
├── script/
│   └── set-fish-default.sh
```
