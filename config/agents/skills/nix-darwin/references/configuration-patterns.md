---
source_url: https://nix-darwin.github.io/nix-darwin/manual/
source_title: nix-darwin Configuration Patterns
source_version: 26.05.06648f4
fetched_at: 2026-04-29
---

# nix-darwin Configuration Patterns

Use these patterns when implementing or reviewing nix-darwin changes in this dotfiles repository.

## Add a System Package

Prefer the existing package module under `nix/nix-darwin/home-manager/packages/` or the repository's established package list location.

```nix
environment.systemPackages = with pkgs; [
  ripgrep
];
```

Use `users.users.<name>.packages` only when the package should not be globally available.

## Add a Homebrew Cask or Formula

Use `homebrew.casks` for GUI applications and `homebrew.brews` for Homebrew formulae.

```nix
homebrew = {
  enable = true;
  casks = [
    "raycast"
  ];
  brews = [
    "mas"
  ];
};
```

Be careful with cleanup:

```nix
homebrew.onActivation.cleanup = "none";
```

Use `"check"` for auditing unmanaged packages. Use `"uninstall"` or `"zap"` only when removing anything absent from the generated Brewfile is intended.

## Configure macOS Defaults

Use the dedicated `system.defaults.*` options before `CustomUserPreferences`.

```nix
system.defaults = {
  dock = {
    autohide = true;
    show-recents = false;
    mru-spaces = false;
  };

  finder = {
    AppleShowAllExtensions = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };
};
```

Some defaults require restarting the affected app, logging out, or rebooting. Mention this in responses for Dock, Finder, loginwindow, Spaces, appearance, keyboard, and trackpad changes.

## Configure Nix Settings

Prefer `nix.settings` over `nix.extraOptions` for structured settings.

```nix
nix.settings = {
  experimental-features = [
    "nix-command"
    "flakes"
  ];
  trusted-users = [
    "root"
    "@admin"
  ];
  max-jobs = "auto";
};
```

Use `nix.extraOptions` only for settings that are awkward or unsupported as structured values.

## Configure Shells

Enable the corresponding `programs.<shell>.enable` option when setting a user shell to a Nix package.

```nix
programs.fish.enable = true;

users.users.luvpame = {
  shell = pkgs.fish;
};
```

If a custom shell is intentionally managed outside nix-darwin, `users.users.<name>.ignoreShellProgramCheck = true` can bypass the shell-program check.

## Configure Sudo Touch ID

Use `security.pam.services.sudo_local.*`.

```nix
security.pam.services.sudo_local = {
  enable = true;
  touchIdAuth = true;
  reattach = true;
};
```

Use `reattach = true` to improve sudo authentication inside tmux or screen.

## Configure launchd Jobs

Prefer high-level `services.*` modules. Use raw launchd jobs when no service module exists.

```nix
launchd.user.agents.example = {
  command = "${pkgs.hello}/bin/hello";
  serviceConfig = {
    Label = "org.nixos.example";
    RunAtLoad = true;
    StandardOutPath = "/tmp/example.log";
    StandardErrorPath = "/tmp/example.err";
  };
};
```

Use `path = [ pkgs.foo ]` when the job needs packages on `PATH`. Use absolute paths in `Program` or `ProgramArguments` when launchd resolution would otherwise be ambiguous.

## Configure Services

Common patterns:

```nix
services.jankyborders = {
  enable = true;
  active_color = "0xFFFFFFFF";
  width = 5.0;
};
```

```nix
services.aerospace = {
  enable = true;
  settings = {
    default-root-container-layout = "tiles";
    mode.main.binding = {
      alt-h = "focus left";
      alt-l = "focus right";
    };
  };
};
```

```nix
services.openssh = {
  enable = true;
  extraConfig = ''
    PasswordAuthentication no
  '';
};
```

For CI runners and agents, keep token files outside the Nix store and reference runtime paths.

## Configure Users

Set `system.primaryUser` for options that need a primary user. Use `users.users.<name>` for user properties.

```nix
system.primaryUser = "luvpame";

users.users.luvpame = {
  home = "/Users/luvpame";
};
```

Avoid adding normal admin users to `users.knownUsers` unless nix-darwin should own lifecycle management for those users.

## Validate Changes

After Nix edits:

```bash
nixfmt path/to/file.nix
cd nix && nix flake check
```

If the change affects actual system state, mention that `just switch` or the repository's darwin switch command is needed to apply it.

