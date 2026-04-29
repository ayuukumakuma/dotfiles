---
name: nix-darwin
description: This skill should be used when the user asks about "nix-darwin options", "darwin-rebuild", "homebrew in nix-darwin", "macOS defaults in Nix", "launchd agents", "system.defaults", "nix-darwin services", or wants help writing, debugging, migrating, or reviewing nix-darwin configuration.
metadata:
  target_agent: claude
---

# nix-darwin Skill

This skill provides focused guidance for reading, writing, debugging, and reviewing nix-darwin configurations. Use it for macOS system configuration expressed through Nix modules, especially when the task involves `nix/nix-darwin/`, `flake.nix`, `darwin-rebuild`, Homebrew management, launchd services, macOS defaults, users, Nix daemon settings, or system packages.

## Core Workflow

Start by locating the relevant local configuration before proposing changes:

1. Inspect `nix/flake.nix`, `nix/local.nix`, and the modules under `nix/nix-darwin/`.
2. Search existing configuration with `rg "option.name|service-name|package-name" nix`.
3. Prefer the repository's current module organization over adding new files.
4. Use nix-darwin options from the reference files before falling back to ad hoc activation scripts.
5. Run formatting with `nixfmt <file>` after editing Nix files.
6. Validate with `cd nix && nix flake check` when feasible.

When an option might have changed recently, verify against current official nix-darwin documentation or the pinned nix-darwin source in the flake before making a claim.

## Documentation

Reference files live in `references/` as Markdown files with source metadata.

- `references/options-catalog.md` - Curated option index from the nix-darwin 26.05 manual snapshot.
- `references/configuration-patterns.md` - Practical patterns for common macOS and Nix tasks.

Use the search script for quick lookup:

```bash
python scripts/search_docs.py "homebrew cleanup"
python scripts/search_docs.py "system.defaults dock"
python scripts/search_docs.py "launchd agents" --json
```

Options:
- `--json` - Output as JSON.
- `--max-results N` - Limit results, default `10`.

## Configuration Guidance

Prefer declarative options in this order:

1. Use dedicated nix-darwin modules such as `homebrew.*`, `services.*`, `programs.*`, `system.defaults.*`, `users.*`, and `nix.settings.*`.
2. Use `environment.systemPackages` for packages available to all users.
3. Use `users.users.<name>.packages` only when a package should be scoped to one user.
4. Use Homebrew casks for GUI applications that are not suitable as Nix packages or are already managed by this repo's Homebrew layer.
5. Use `system.activationScripts.*` only when no specific nix-darwin option exists and the change must happen during activation.

Avoid embedding secrets in Nix expressions. Paths to token files, private keys, or credentials should point to runtime files outside the Nix store.

## Common Option Families

Use these option families as first stops:

- `homebrew.*` - Taps, formulae, casks, MAS apps, VS Code extensions, activation cleanup, and update behavior.
- `system.defaults.*` - macOS preferences for Dock, Finder, trackpad, keyboard, Control Center, screenshots, WindowManager, and global domains.
- `services.*` - launchd-managed daemons and agents such as AeroSpace, jankyborders, sketchybar, tailscale, openssh, postgresql, redis, and GitHub runners.
- `programs.*` - Shells, tmux, vim, direnv, GnuPG, SSH known hosts, and helper programs.
- `launchd.*` - Lower-level launchd agents, daemons, user agents, labels, paths, environment, and plist keys.
- `nix.*` and `nixpkgs.*` - Nix daemon behavior, caches, trusted users, sandboxing, GC, store optimization, flake registry, overlays, and platforms.
- `security.*` - Touch ID or Apple Watch sudo, sudoers, CA certificates, and sandbox profiles.
- `networking.*` and `power.*` - Hostnames, DNS, firewall, WireGuard, Wake-on-LAN, and sleep behavior.

## Safety Notes

Treat these changes as higher risk:

- `homebrew.onActivation.cleanup = "uninstall"` or `"zap"` can remove packages not listed in the generated Brewfile.
- `security.pam.services.sudo_local.*` changes affect sudo authentication.
- `services.github-runners.*.tokenFile`, CI tokens, SSH keys, and other secret paths must not enter the Nix store.
- `system.patches` can modify arbitrary paths under `/`; prefer narrower modules first.
- `users.knownUsers` and `users.knownGroups` mark accounts as managed by nix-darwin; avoid adding normal admin or system users without clear intent.
- `nix.enable = false` stops nix-darwin from managing the Nix installation and can break systems that rely on it.

## Response Practice

When answering configuration questions:

1. Mention the exact option name and where it should live.
2. Provide a small Nix snippet that matches the local repo style.
3. Explain activation or login requirements when the option needs them.
4. Cite the reference file and source URL when using bundled docs.
5. Recommend `cd nix && nix flake check` after Nix changes.

For code changes in this repository, edit only the necessary module files and preserve unrelated local modifications.

