---
title: "Prerelease Builds - Install"
source_url: "https://ghostty.org/docs/install/pre"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* Install
* [Prerelease Builds](https://ghostty.org/docs/install/pre.html)

# Prerelease Builds

Help test the latest features and get the most recent bug fixes
by running prerelease builds of Ghostty.

If you're comfortable with running prerelease software, you can
help test the latest features and get the most recent bug fixes
by running prerelease builds of Ghostty. This helps the project
significantly by providing feedback on new features and addressing
possible issues before they are released to the public.

> Note
>
> During the private beta period of Ghostty, testers daily drove
> prerelease builds using this same process. Many didn't have a single
> issue for months or even over a year. The prerelease builds are
> generally stable, but users should always be prepared for the
> possibility of stability issues.

An overview of how to install prerelease builds is provided below
with more details in the sections following the table.

| Platform | Description |
| --- | --- |
| macOS | `auto-update-channel` to get the latest prerelease builds |
| Arch Linux | `ghostty-git` on the AUR |
| NixOS/Nix on other distros | Flake within the Ghostty repository |
| Other Linux distros | [Build from source](https://ghostty.org/docs/install/build.html) |

## macOS

For macOS, the Ghostty project provides signed and notarized builds
for the latest commit on the `main` branch. These are available
via [GitHub Releases](https://github.com/ghostty-org/ghostty/releases/tag/tip)
but also via the standard macOS auto-update mechanism.

If you are on a release build, you can switch to the prerelease channel
by setting [`auto-update-channel`](https://ghostty.org/docs/config/reference.html#auto-update-channel) to `tip`.

```
auto-update-channel = tip
```

> Tip
>
> Don't forget to restart Ghostty after changing the `auto-update-channel`
> setting! This setting does not take effect until Ghostty is restarted.

> Warning
>
> While you can set this setting back to `stable` at any time, this will
> only take effect when a later stable release is available. If you want
> to downgrade back to the previous stable release, you must
> [re-download](https://ghostty.org/download.html) Ghostty.

> Note
>
> **Why is this setting called "tip"?** The term "tip" is a common term
> to refer to the latest commit on a branch in Git. Since we build
> prerelease builds from the latest commit on the `main` branch, we
> use the term "tip" to refer to the latest prerelease build rather than
> something like "nightly".

### Homebrew

You can also install prerelease builds using Homebrew using the
`@tip` version.

```
brew install --cask ghostty@tip
```

> Warning
>
> This is community-maintained. The `auto-update-channel` setting
> is an official distribution channel.

## Linux

### AUR

> Warning
>
> The AUR package is community-maintained. Any issues regarding packaging
> or the build process should be reported to the AUR maintainer first,
> and then to the Ghostty project.

The [`ghostty-git`](https://aur.archlinux.org/packages/ghostty-git) package on the Arch User Repository (AUR) provides
a way to automatically build and install the latest prerelease version
of Ghostty with ease.

Installation may be done with an AUR helper or from source per the
[usual AUR instructions](https://wiki.archlinux.org/title/Arch_User_Repository#Installing_and_upgrading_packages).

```
# Install Ghostty git
yay -S ghostty-git
```

### Nix Flake

The Ghostty repository comes with a Flake that can be used to build, run
and install development ("tip") versions of Ghostty reproducibly, which
is directly used, tested and maintained by Ghostty maintainers as our
primary development and CI environment.

```
# Build and run the latest tip version of Ghostty without installing
nix run github:ghostty-org/ghostty
```

> Note
>
> The Flake currently does not support macOS builds due to limitations of
> the Nix ecosystem. See the [Nix (macOS binary)](https://ghostty.org/docs/install/binary.html#nix-(macos-binary))
> section of the "Prebuilt Binaries and Packages" page for more details.

> Warning
>
> If you are installing the Flake on a non-NixOS system, be sure to read
> the [important caveats](https://ghostty.org/docs/install/binary.html#nix-on-other-distros) regarding
> running OpenGL programs built with Nix on non-NixOS systems. Ghostty will
> likely **fail to launch** without the workarounds described there.

NixOS users can install Ghostty either directly as a package under
`packages.<system>.default` (where `<system>` is your current host system,
e.g. `x86_64-linux`), or use the overlay at `overlays.default`.

```
{
  pkgs,
  inputs,
}:
{
  # Installing the package directly
  users.users.somebody.packages = [
    inputs.ghostty.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Alternatively, using overlays:
  nixpkgs.overlays = [
    inputs.ghostty.overlays.default
  ];
  users.users.somebody.packages = [
    pkgs.ghostty
  ];
}
```

The Flake also exposes Ghostty compiled under different optimization settings,
including `ghostty-debug`, `ghostty-releasefast` and `ghostty-releasesafe`:
`releasefast` is the default; `debug` enables better debug information at the
cost of performance; and `releasesafe` is rarely used.

`debug` and `releasefast` are also available as overlays, under `overlays.debug`
and `overlays.releasefast` respectively.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/install/pre.mdx)

* [macOS](https://ghostty.org/docs/install/pre.html#macos)
* [Homebrew](https://ghostty.org/docs/install/pre.html#homebrew)
* [Linux](https://ghostty.org/docs/install/pre.html#linux)
* [AUR](https://ghostty.org/docs/install/pre.html#aur)
* [Nix Flake](https://ghostty.org/docs/install/pre.html#nix-flake)
