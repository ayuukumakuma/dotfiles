# Repository Guidelines

## Project Structure & Module Organization
- `nix/`: Flake entry point (`flake.nix`), lockfile, package list (`pkgs.nix`), and `nix-darwin/config.nix` for macOS system+Homebrew state.
- `fish/`: Shell config (`config.fish`), `fish_plugins`, and custom functions/conf.d snippets.
- `script/`: Utility Bash scripts (e.g., `set-fish-default.sh`).
- Tool configs sit at top level (e.g., `aerospace/`, `cursor/`, `wezterm/`, `raycast/`, `git/`, `nvim/`, `claude/`, `codex/`, `zellij/`, `simple-bar/`).
- Agent-specific assets live under `agents/` (skills, prompts, and supporting docs).

## Build, Test, and Development Commands
- `cd nix && nix flake check` — validates the flake and darwin config.
- `cd nix && nix build .#my-packages` — builds the curated CLI bundle.
- `cd nix && nix run nix-darwin -- switch --flake .#ayuukumakuma-darwin` — applies system/Homebrew settings.
- `cd nix && nix run .#update` — updates flake inputs, profiles, and nix-darwin together.
- `reload` (Fish alias) — restart login shell to load new config; follow with `fisher update` if `fish_plugins` changed.

## Coding Style & Naming Conventions
- Nix: run `nixfmt-rfc-style <file>`; keep two-space indentation and sorted attribute sets where practical.
- Shell scripts: `#!/bin/bash` with `set -euo pipefail`; prefer long options and `printf` over `echo -e`.
- File and scope names use kebab-case (e.g., `set-fish-default.sh`) and scoped filenames per tool directory.
- Prefer small, composable scripts placed in `script/`; avoid embedding secrets or host-specific paths.

## Testing Guidelines
- Minimal automated tests exist; rely on `cd nix && nix flake check` before commits/PRs.
- For new scripts, add a dry-run flag when possible and test manually on macOS (Apple Silicon).
- After changing Nix inputs or services, rerun the darwin switch command and spot-check services (e.g., `launchctl list | grep jankyborders`).

## Commit & Pull Request Guidelines
- Commit messages follow Conventional Commits with scopes (e.g., `chore(nix): ...`, `docs(cursor): ...`, `chore(fish): ...`); use imperative mood.
- Keep commits focused; avoid mixing unrelated tool configs and Nix changes.
- PRs should include: short summary, affected areas (Nix/Fish/app config), commands run (`cd nix && nix flake check`, apply switch), and screenshots for UI-facing tweaks.

## Security & Configuration Tips
- Never commit secrets. Keep Git identity in `~/.config/git/config.local` (template: `git/config.local.example`) and use 1Password CLI (`op signin`) for other credentials.
- Treat `flake.lock` as source of truth; avoid manual edits. Commit the lockfile when dependencies update.
- If adding new casks or packages, prefer `nix/nix-darwin/config.nix` and `nix/pkgs.nix` to keep state declarative; rerun the switch command to reconcile the system.

## Agent Skills
- Reusable skills are stored in `agents/skills/`.
- Current built-in skills include: `code-simplifier`, `conventional-commit`, `frontend-design`, `skill-creator`, and `skill-installer`.
- When a task explicitly references a skill, use that skill workflow and keep changes scoped to the requested area.
