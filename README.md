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
├── .cache/
├── .data/
├── .state/
├── .claude/
│   └── settings.local.json
├── .editorconfig
├── .gitignore
├── .zed/
│   └── settings.json
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
│   │   ├── CLAUDE.md
│   │   ├── hooks/
│   │   ├── settings.json
│   │   └── statusline.py
│   ├── codex/
│   │   ├── AGENTS.md
│   │   ├── config.toml
│   │   ├── hooks.json
│   │   └── hooks/
│   │       ├── notify-terminal-notifier.sh
│   │       └── state-notify.sh
│   ├── fish/
│   │   ├── completions/
│   │   ├── conf.d/
│   │   ├── functions/
│   │   └── fish_plugins
│   ├── gh/
│   ├── git/
│   ├── guard-and-guide/
│   ├── lazygit/
│   ├── mise/
│   ├── nvim/
│   │   ├── init.lua
│   │   └── lua/
│   ├── raycast/
│   │   ├── README.md
│   │   └── scripts/
│   ├── tmux/
│   │   ├── plugins/
│   │   └── tmux.conf
│   ├── wezterm/
│   ├── yazi/
│   │   └── flavors/
│   └── zed/
│       ├── keymap.json
│       ├── prompts/
│       ├── settings.json
│       └── themes/
├── docs/
├── justfile
├── menubar-script/
│   ├── claude/
│   ├── codex/
│   ├── ime/
│   └── media/
├── nix/
│   ├── AGENTS.md
│   ├── flake.nix
│   ├── flake.lock
│   ├── local.nix
│   ├── local.nix.example
│   ├── nix-darwin/
│   │   ├── default.nix
│   │   ├── home-manager/
│   │   │   ├── default.nix
│   │   │   ├── files.nix
│   │   │   └── packages/
│   │   │       ├── common.nix
│   │   │       ├── private.nix
│   │   │       └── work.nix
│   │   ├── homebrew/
│   │   │   ├── common.nix
│   │   │   ├── private.nix
│   │   │   └── work.nix
│   │   ├── nix-core.nix
│   │   ├── system.nix
│   │   └── users.nix
│   └── pkgs/
├── nvim.log
├── script/
│   └── set-fish-default.sh
```
