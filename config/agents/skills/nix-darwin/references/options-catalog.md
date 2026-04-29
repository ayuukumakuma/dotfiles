---
source_url: https://nix-darwin.github.io/nix-darwin/manual/
source_title: nix-darwin Configuration Options
source_version: 26.05.06648f4
fetched_at: 2026-04-29
---

# nix-darwin Options Catalog

This reference summarizes the nix-darwin 26.05 manual snapshot supplied for the skill. Use it as a local index, then verify against the pinned flake or current official manual when precision matters.

## Evaluation and Documentation

- `_module.args` passes extra arguments to modules. Do not rely on it for `imports`; use `specialArgs` for values required during import resolution.
- `documentation.enable`, `documentation.doc.enable`, `documentation.info.enable`, and `documentation.man.enable` control documentation outputs installed from system packages.
- `lib` allows modules to define helper functions and constants.

## Environment

- `environment.systemPackages` installs packages into `/run/current-system/sw` for all users.
- `environment.defaultPackages` controls default nonessential packages.
- `environment.systemPath` and `environment.pathsToLink` control paths and linked directories in the system profile.
- `environment.variables` sets global shell environment variables.
- `environment.shellAliases` adds aliases for all users' shells.
- `environment.shells` lists permissible login shells.
- `environment.extraInit`, `environment.shellInit`, `environment.loginShellInit`, and `environment.interactiveShellInit` inject shell initialization fragments.
- `environment.etc`, `environment.launchAgents`, `environment.launchDaemons`, and `environment.userLaunchAgents` link generated files into `/etc`, `/Library/LaunchAgents`, `/Library/LaunchDaemons`, and `~/Library/LaunchAgents`.

## Homebrew

- `homebrew.enable` lets nix-darwin manage Homebrew taps, formulae, casks, MAS apps, VS Code extensions, Go packages, and Cargo crates through a generated Brewfile. It does not install Homebrew itself.
- `homebrew.brews`, `homebrew.casks`, `homebrew.taps`, `homebrew.masApps`, `homebrew.vscode`, `homebrew.goPackages`, and `homebrew.cargoPackages` declare managed Homebrew items.
- `homebrew.caskArgs` sets global cask installation arguments such as `appdir`, `fontdir`, `language`, and `require_sha`.
- `homebrew.casks.*.greedy` and `homebrew.greedyCasks` control greedy cask upgrades.
- `homebrew.onActivation.autoUpdate` defaults to `false` for idempotent activation.
- `homebrew.onActivation.upgrade` defaults to `false`; when disabled, activation passes `--no-upgrade`.
- `homebrew.onActivation.cleanup` accepts `"none"`, `"check"`, `"uninstall"`, and `"zap"`. Use `"uninstall"` or `"zap"` only when Homebrew is meant to be exclusively declarative.
- `homebrew.global.autoUpdate` affects manually invoked Homebrew commands by setting `HOMEBREW_NO_AUTO_UPDATE` when disabled.
- `homebrew.global.brewfile` makes manual `brew bundle` use the generated Brewfile.
- `homebrew.prefix` defaults to `/opt/homebrew` on Apple Silicon and `/usr/local` otherwise.
- `homebrew.user` defaults to `config.system.primaryUser`.

## launchd

- `launchd.agents`, `launchd.daemons`, and `launchd.user.agents` define launchd jobs.
- Each job can use `command`, `script`, `path`, `environment`, and `serviceConfig`.
- `serviceConfig` maps to plist keys such as `Label`, `Program`, `ProgramArguments`, `RunAtLoad`, `KeepAlive`, `WatchPaths`, `StartInterval`, `StartCalendarInterval`, `StandardOutPath`, `StandardErrorPath`, `WorkingDirectory`, `ProcessType`, and `UserName`.
- `launchd.labelPrefix` defaults to `org.nixos`.
- `launchd.envVariables` and `launchd.user.envVariables` set variables for future launchd-launched processes.

## Networking and Power

- `networking.hostName`, `networking.localHostName`, and `networking.computerName` map to `scutil` names.
- `networking.domain`, `networking.fqdn`, and `networking.fqdnOrHostName` describe host identity.
- `networking.dns`, `networking.search`, and `networking.knownNetworkServices` configure resolver behavior.
- `networking.applicationFirewall.*` controls the macOS application firewall, stealth mode, signed app allowances, and blocking incoming connections.
- `networking.wakeOnLan.enable` controls Wake-on-LAN when supported.
- `networking.wg-quick.interfaces.*` declares WireGuard interfaces with `address`, `dns`, `listenPort`, `peers`, `privateKeyFile`, hooks, `table`, and `autostart`.
- `power.sleep.computer`, `power.sleep.display`, and `power.sleep.harddisk` accept minutes or `"never"`.
- `power.restartAfterFreeze`, `power.restartAfterPowerFailure`, and `power.sleep.allowSleepByPowerButton` manage power behavior.

## Nix and Nixpkgs

- `nix.enable` controls whether nix-darwin manages Nix, nix-daemon, and `/etc/nix/nix.conf`.
- `nix.package` selects the system Nix package.
- `nix.settings` maps directly to `nix.conf`; common keys include `experimental-features`, `trusted-users`, `substituters`, `trusted-public-keys`, `sandbox`, `max-jobs`, `cores`, `auto-optimise-store`, and `extra-sandbox-paths`.
- `nix.extraOptions` appends verbatim text to `nix.conf`.
- `nix.channel.enable` controls `nix-channel` state availability.
- `nix.registry` declares a system-wide flake registry.
- `nix.gc.automatic`, `nix.gc.interval`, and `nix.gc.options` configure automatic garbage collection.
- `nix.optimise.automatic` and `nix.optimise.interval` configure store optimization.
- `nix.distributedBuilds` and `nix.buildMachines.*` configure remote builders.
- `nix.linux-builder.*` configures the built-in Linux builder.
- `nixpkgs.config`, `nixpkgs.overlays`, `nixpkgs.hostPlatform`, `nixpkgs.buildPlatform`, `nixpkgs.source`, `nixpkgs.pkgs`, and `nixpkgs.flake.*` control the package set and flake registry/NIX_PATH behavior.

## Programs

- `programs.bash.*`, `programs.zsh.*`, and `programs.fish.*` configure interactive shell integration, completion, aliases, abbreviations, prompts, and shell init.
- `programs.direnv.*` enables direnv and nix-direnv integration with shell-specific toggles and TOML settings.
- `programs.tmux.*` configures tmux, sensible defaults, mouse support, Vim keys, fzf integration, and extra config.
- `programs.vim.*` configures Vim and plugins.
- `programs.ssh.extraConfig` and `programs.ssh.knownHosts.*` manage system SSH client config and known hosts.
- `programs.gnupg.agent.*` enables GPG agent and SSH support.
- `programs._1password.*` and `programs._1password-gui.*` enable 1Password CLI and GUI packages.
- `programs.nix-index.enable`, `programs.man.enable`, and `programs.info.enable` control helper programs and docs.

## Security

- `security.pam.services.sudo_local.enable` manages `/etc/pam.d/sudo_local`.
- `security.pam.services.sudo_local.touchIdAuth`, `watchIdAuth`, and `reattach` enable Touch ID, Apple Watch sudo, and tmux/screen reattach support.
- `security.sudo.extraConfig` appends sudoers text.
- `security.sudo.keepTerminfo` preserves terminfo variables for sudo.
- `security.pki.*` manages CA certificates.
- `security.sandbox.profiles.*` defines sandbox profiles with networking, system path, readable path, writable path, and closure access.

## Services

Window management and UI:

- `services.aerospace.*` enables AeroSpace and writes TOML settings such as gaps, key mappings, callbacks, workspace-to-monitor assignment, and window rules.
- `services.jankyborders.*` controls jankyborders colors, width, blacklist, whitelist, style, HiDPI, blur, and draw order.
- `services.sketchybar.*` enables SketchyBar and can manage its config and extra PATH packages.
- `services.skhd.*`, `services.yabai.*`, `services.karabiner-elements.*`, `services.spacebar.*`, `services.chunkwm.*`, `services.khd.*`, and `services.kwm.*` configure related macOS tools.

Networking and remote access:

- `services.openssh.*` controls Apple's built-in OpenSSH server and host keys.
- `services.tailscale.*`, `services.netbird.*`, `services.nextdns.*`, `services.dnsmasq.*`, and `services.dnscrypt-proxy.*` configure network daemons.
- `services.autossh.sessions.*` declares AutoSSH sessions.
- `services.eternal-terminal.*` configures Eternal Terminal.

Databases and developer services:

- `services.postgresql.*` manages PostgreSQL package, data directory, auth, settings, ensured databases/users, port, plugins, and initialization.
- `services.redis.*` manages Redis bind, port, socket, data dir, append-only mode, and extra config.
- `services.ipfs.*`, `services.privoxy.*`, `services.mopidy.*`, and `services.spotifyd.*` configure their services.

CI and monitoring:

- `services.github-runners.*` declares GitHub Actions runners. Keep `tokenFile` outside the Nix store. Prefer PAT-backed registration over short-lived registration tokens.
- `services.gitlab-runner.*` declares GitLab runner services and executors.
- `services.buildkite-agents.*`, `services.hercules-ci-agent.*`, `services.cachix-agent.*`, and `services.ofborg.*` configure CI agents.
- `services.netdata.*`, `services.telegraf.*`, and `services.prometheus.exporters.node.*` configure monitoring.

## macOS Defaults

- `system.defaults.NSGlobalDomain.*` covers global UI, keyboard, scrolling, language/region, dark mode, file extension, hidden file, animation, spelling, and trackpad-related defaults.
- `system.defaults.dock.*` covers Dock autohide, size, magnification, recents, Mission Control behavior, hot corners, gestures, persistent apps, and persistent folders.
- `system.defaults.finder.*` covers hidden files, extensions, path/status bars, desktop icons, default windows, search scope, view style, and quit menu.
- `system.defaults.trackpad.*` covers tap to click, dragging, right click, force click, haptics, gestures, and thresholds.
- `system.defaults.WindowManager.*` covers Stage Manager and macOS window tiling behavior.
- `system.defaults.controlcenter.*` covers menu bar display for AirDrop, Battery, Bluetooth, Display, Focus, Now Playing, and Sound.
- `system.defaults.screencapture.*` covers screenshot location, type, target, date naming, shadow, thumbnail, and selection behavior.
- `system.defaults.screensaver.*` covers password requirements and delay.
- `system.defaults.loginwindow.*` covers guest login, full-name login, login text, auto-login, and restart/shutdown/sleep restrictions.
- `system.defaults.menuExtraClock.*` covers menu bar clock format, date, seconds, AM/PM, and analog/digital display.
- `system.defaults.CustomUserPreferences` and `system.defaults.CustomSystemPreferences` accept arbitrary plist values for unsupported preferences.

## System and Users

- `system.primaryUser` identifies the normal user for options that previously depended on the `darwin-rebuild` caller.
- `system.stateVersion` pins compatibility defaults. The supplied manual's default is `6`.
- `system.configurationRevision` records the top-level flake Git revision.
- `system.activationScripts.*` creates activation scripts with `text` or `source`.
- `system.checks.*` controls validation for build users, macOS version, and NIX_PATH.
- `system.keyboard.*` enables key mapping, Caps Lock remaps, modifier swaps, and non-US tilde behavior.
- `system.patches` applies patches to `/`; use cautiously.
- `system.tools.darwin-rebuild.enable`, `darwin-option.enable`, `darwin-uninstaller.enable`, and `darwin-version.enable` control helper tools.
- `time.timeZone` sets the system time zone.
- `fonts.packages` installs fonts into `/Library/Fonts/Nix Fonts`.
- `users.users.*` manages users, packages, home, shell, UID/GID, hidden state, and SSH authorized keys.
- `users.groups.*`, `users.knownUsers`, and `users.knownGroups` manage groups and nix-darwin-owned accounts.

