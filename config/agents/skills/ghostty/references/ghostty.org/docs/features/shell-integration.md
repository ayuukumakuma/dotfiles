---
title: "Shell Integration - Features"
source_url: "https://ghostty.org/docs/features/shell-integration"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Features](https://ghostty.org/docs/features.html)
* [Shell Integration](https://ghostty.org/docs/features/shell-integration.html)

# Shell Integration

Some Ghostty features require integrating with your shell. Ghostty
can automatically inject shell integration for bash, zsh, fish, and
elvish.

## Features

* Do not confirm close for terminals where the cursor is at a prompt.
* New terminals start in the working directory of the previously
  focused terminal.
* Complex prompts resize correctly by allowing the shell to
  redraw -- rather than reflow -- the prompt line.
* Triple-click while holding control (Linux) or command (macOS) to
  select the output of a command.
* The cursor at the prompt is turned into a bar to represent more
  typical text editing.
* The `jump_to_prompt` keybinding can be used to scroll the terminal window
  forward and back through prompts.
* Alt+click (option+click on macOS) moves the cursor to the click location
  while at a prompt.
* `sudo` can be automatically wrapped to preserve Ghostty terminfo
  (disabled by default)
* `ssh` can be automatically wrapped to either transmit the Ghostty
  terminfo or set the `TERM` environment variable to `xterm-256color`
  to maximize compatibility (disabled by default)

## Shell Integration Injection

Ghostty will automatically inject the shell integration code for `bash`,
`zsh`, `fish`, and `elvish`.

> Note
>
> The version of Bash distributed with macOS (`/bin/bash`) does not support
> automatic shell integration. You'll need to manually source the shell
> integration script (as shown below). You can also install a standard version
> of Bash from Homebrew or elsewhere and set it as your shell.

Other shells do not have shell integration code written, but they will function
fine within Ghostty, although some or all of the above-mentioned shell
integration features may be unavailable.

Some shells such as [Nushell](https://www.nushell.sh) have built-in
support for some of the features that Ghostty provides, so shell
integration is not necessary. For example, newer versions of
Fish (4.0+) have built-in support for prompt marking so `jump_to_prompt`,
prompt resizing, and prompt selection will work without shell integration.

Ghostty detects your shell using a simple string match on the
basename of the command to execute. If you are using a supported
shell with a different name, you can force the shell integration
by setting the `shell-integration` configuration option:

```
shell-integration = fish
```

If you want to disable automatic shell integration:

```
shell-integration = none
```

### Verify Shell Integration

To verify shell integration is working, look for the following log lines:

```
info(io_exec): using Ghostty resources dir from env var: /Applications/Ghostty.app/Contents/Resources
info(io_exec): shell integration automatically injected shell=termio.shell_integration.Shell.fish
```

If you see any of the following, something is not working correctly.
The main culprit is usually that `GHOSTTY_RESOURCES_DIR` is not pointing
to the right place.

```
ghostty terminfo not found, using xterm-256color
```

```
shell could not be detected, no automatic shell integration will be injected
```

### Troubleshooting

For the automatic shell integration to work Ghostty must either be run
from the macOS app bundle or be installed in a location where the contents of
`zig-out/share` are available somewhere above the directory where Ghostty
is running from.

On Linux, this should automatically work if you run from the `zig-out`
directory tree structure (a standard FHS-style tree) or run from a
properly installed location via `-p` (see
[build from source](https://ghostty.org/docs/install/build.html)).

You may also manually set the `GHOSTTY_RESOURCES_DIR` to point to the
`zig-out/share/ghostty` contents. To validate this directory the file
`$GHOSTTY_RESOURCES_DIR/../terminfo/ghostty.terminfo` should exist.
Setting this environment variable manually is a red flag that something
else is wrong, though, and you should investigate further.

## Manual Shell Integration Setup

Shell integration can also be manually sourced in your shell
configuration. This ensures that shell integration works in more
scenarios (such as when you switch shells within Ghostty).

Ghostty will automatically set the `GHOSTTY_RESOURCES_DIR` environment
variable when it starts, so you can use this to (1) detect your shell
is launched within Ghostty and (2) to find the shell-integration.

For example, for bash, you'd put this *at the top* of your `~/.bashrc`:

```
# Ghostty shell integration for Bash. This should be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi
```

> Note
>
> Technically, the bash shell integration script could be sourced from anywhere,
> but some bash configurations may interfere with the shell integration. To
> avoid this, we recommend sourcing the script as early as possible in your
> shell configuration.

Each shell integration's installation instructions are documented inline:

| Shell | Integration |
| --- | --- |
| `bash` | `${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash` |
| `fish` | `"$GHOSTTY_RESOURCES_DIR"/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish` |
| `zsh` | `${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration` |
| `elvish` | `${GHOSTTY_RESOURCES_DIR}/shell-integration/elvish/lib/ghostty-integration.elv` |

For shell-specific details see [shell-integration/README.md](https://github.com/ghostty-org/ghostty/blob/main/src/shell-integration/README.md).

## Switching Shells with Shell Integration

Automatic shell integration as described in the previous section only works
for the *initially launched shell* when Ghostty is started.

If you switch shells within Ghostty, i.e. you manually run `bash` or
you use a command like `nix-shell`, the shell integration *will be
lost* in that shell (it will keep working in the original shell process).

To make shell integration work in these cases, you must manually source
the Ghostty shell-specific code as shown in the previous section.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/features/shell-integration.mdx)

* [Features](https://ghostty.org/docs/features/shell-integration.html#features)
* [Shell Integration Injection](https://ghostty.org/docs/features/shell-integration.html#shell-integration-injection)
* [Verify Shell Integration](https://ghostty.org/docs/features/shell-integration.html#verify-shell-integration)
* [Troubleshooting](https://ghostty.org/docs/features/shell-integration.html#troubleshooting)
* [Manual Shell Integration Setup](https://ghostty.org/docs/features/shell-integration.html#manual-shell-integration-setup)
* [Switching Shells with Shell Integration](https://ghostty.org/docs/features/shell-integration.html#switching-shells-with-shell-integration)
