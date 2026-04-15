---
title: "Binaries and Packages - Install"
source_url: "https://ghostty.org/docs/install/binary"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* Install
* [Binaries and Packages](https://ghostty.org/docs/install/binary.html)

# Prebuilt Ghostty Binaries and Packages

Install Ghostty without building it manually by downloading
and running a prebuilt binary or package.

The Ghostty project only officially distributes prebuilt binaries
for macOS. For other platforms like Linux, we rely on a mix of distro
maintainers and community members to build, test and distribute
Ghostty for the wider userbase.

In some cases, Ghostty maintainers may also be involved in maintaining
packages for certain distros, but that should not be taken as endorsement
from the Ghostty project as a whole.

## macOS

Official macOS binaries are provided by the Ghostty project and
are available on the [download page](https://ghostty.org/download.html).

These binaries are signed and notarized by the Ghostty project.
To install, download the `.dmg` file, open it, and drag the
Ghostty application to your Applications folder. This is the same
process as installing many typical macOS applications.

### Homebrew

A [Homebrew cask](https://formulae.brew.sh/cask/ghostty) is available and
maintained by the Ghostty community. It merely repackages the official
`.dmg` and should offer the same level of security as the official binary
itself.

```
brew install --cask ghostty
```

### Nix (macOS binary)

In Nixpkgs, Ghostty is available as a repackaging of the official `.dmg`
under the package name `ghostty-bin`, not to be confused with `ghostty`,
which is the GTK app [available for Nix on Linux](https://ghostty.org/docs/install/binary.html#nix).

> Note
>
> Unfortunately, Nix currently cannot compile Ghostty from source under macOS.
>
> The reason behind that is because Nixpkgs does not yet have the ecosystem
> support required for it, chief among them include Swift 6 support, free,
> automatable and reproducible xcodebuild alternatives, etc. In the future,
> we may consider merging `ghostty-bin` into `ghostty` and provide
> from-source builds for both macOS and GTK apps.

nix-darwin users can install Ghostty for either the entire system or
for a single user through the usual method:

```
{
  pkgs,
}:
{
  # Systemwide install
  environment.systemPackages = [
    pkgs.ghostty-bin
  ];

  # Install for a specific user
  users.users.somebody.packages = [
    pkgs.ghostty-bin
  ];
}
```

## Linux

Ghostty is available in the default repositories for many Linux distributions.
These packages are all built, tested and verified by the distributions
themselves, and are unaffiliated with the Ghostty project.

If you need help with installing and running Ghostty on a specific distribution
or have any packaging-related questions, **please contact the maintainers of
the Ghostty package within your own distribution** — once they've identified
the issue to be within Ghostty itself, they will file an issue on your behalf.

If your distribution isn't listed here, then please check out the
[community-built binary packages](https://ghostty.org/docs/install/binary.html#linux-(community-binaries)) and see if
there's any that you could install — otherwise, you must
[build Ghostty from source](https://ghostty.org/docs/install/build.html).

> Tip
>
> **Interested in creating a package for your platform?** Check out the
> [packaging
> guide](https://github.com/ghostty-org/ghostty/blob/main/PACKAGING.md). If you
> need any help, feel free to make an issue. Once your package is ready, submit
> a pull request to add it to this page!

### Alpine Linux

Ghostty is available in the official Alpine Linux [testing repository](https://pkgs.alpinelinux.org/package/edge/testing/x86_64/ghostty).

```
apk add ghostty
```

### Arch Linux

The latest tagged release of Ghostty is available as
[`ghostty`](https://archlinux.org/packages/extra/x86_64/ghostty/)
in Arch Linux's `[extra]` repository.

```
pacman -S ghostty
```

Additionally, prerelease builds are also available on the AUR
under `ghostty-git`. See the ["Prerelease Builds"](https://ghostty.org/docs/install/pre.html#aur)
for specific details.

### Gentoo

Ghostty is available in the official Gentoo repository.

```
emerge -av ghostty
```

### Nix

On Linux, Ghostty can be installed with Nix in two major ways: by either using
the `ghostty` package from [Nixpkgs](https://search.nixos.org/packages?from=0&size=50&sort=relevance&type=packages&query=ghostty) (maintained by a team of Nixpkgs maintainers)
or the Flake available from Ghostty's source repository, maintained directly
by the Ghostty project.

The package on Nixpkgs is the simplest option for most regular users, while
the Flake allows more advanced users to install pinned versions of the
development branch ("tip releases") in order to access more bleeding-edge
features. As such, this page **only covers the package in Nixpkgs** — information
regarding the Flake can be found in [its own section](https://ghostty.org/docs/install/pre.html#nix-flake)
on the "Prereleases Builds" page.

> Note
>
> The `ghostty` package on Nixpkgs should not be confused with
> [`ghostty-bin`](https://ghostty.org/docs/install/binary.html#nix-(macos-binary)), which is a repackaging of the
> official `.dmg` for use on macOS.

#### NixOS

NixOS users can install Ghostty on an entire system or
just for a single user through the usual method:

```
{
  pkgs,
}:
{
  # Systemwide install
  environment.systemPackages = [
    pkgs.ghostty
  ];

  # Install for a specific user
  users.users.somebody.packages = [
    pkgs.ghostty
  ];
}
```

Trying out Ghostty without installing it with `nix run` or `nix-shell`
should also work just fine:

```
nix run nixpkgs#ghostty
nix-shell -p ghostty --run ghostty
```

#### Nix on other distros

> Warning
>
> Running Ghostty with Nix on non-NixOS systems will **fail to launch**
> without extra setup. This is because graphical programs compiled for Nixpkgs
> expect OpenGL drivers to be located in a different location than traditional
> distros, and will fail to find them if not manually worked around.

There are multiple ways to fix this, either by running Ghostty with a
wrapper program like [`nixGL`](https://github.com/nix-community/nixGL) or [`nix-gl-host`](https://github.com/numtide/nix-gl-host) that sets up the correct
OpenGL driver paths, or use a more permanent solution like
[`nix-system-graphics`](https://github.com/soupglasses/nix-system-graphics).

Other than that, instructions are nearly identical to NixOS.

### openSUSE

openSUSE has [dropped](https://lists.opensuse.org/archives/list/factory@lists.opensuse.org/thread/BMZTZ2DCNWXARP5UD7MECR6PCWOTKR5G/#BMZTZ2DCNWXARP5UD7MECR6PCWOTKR5G) Ghostty from its official repositories
as it does not allow packages to depend on a specific version of Zig. This is a
*crucial* issue for Ghostty, as nearly all new Zig releases introduce breaking
changes, preventing software targeting a previous Zig version to be compiled.

openSUSE users should try to build Ghostty from source instead, or try
installing Ghostty from a third-party, community-maintained repository.

### Snap

Ghostty is available as [`ghostty`](https://snapcraft.io/ghostty) in the Snap Store.

```
snap install ghostty --classic
```

> Note
>
> While the Snap at Snapcraft is currently maintained by an external maintainer,
> the Snap itself is built using Ghostty's own scripts, and we ensure that the
> Snap builds as a part of our CI regimen. We are currently working on formally
> transferring the Snap to the Ghostty project and making it one of the
> officially supported and distributed package formats for Linux.

### Solus

Ghostty is available in the official package repository.

```
eopkg install ghostty
```

### Void Linux

Ghostty is available in the official package repository.

```
xbps-install ghostty
```

## Linux (Community Binaries)

The packages in this section provide binary installs for Ghostty but
are not official packages within the associated distributions.

> Warning
>
> Community binaries carry a much higher risk compared to builds
> directly from the Ghostty project or from distro maintainers, since
> they have been compiled beforehand on a computer that might not be held
> to the same security standards as a package compiled by the Ghostty
> project or by distro maintainers.
>
> In case that was unclear, **by installing these packages, you implicitly
> accept the risk of a third party that could potentially tamper with the
> binary files for malicious purposes**.
>
> Security concerns aside, there may also be silent breakages, depending on the
> architectural differences between your computer and the computer that built the
> binary package, or the compile flags used in the build process.
>
> Overall, if you are fine with these risks, feel free to use these community
> builds. Otherwise, [compiling from source](https://ghostty.org/docs/install/build.html) is the much
> safer option.

### Debian

Ghostty is available in [this community-maintained repository](https://debian.griffo.io/).

Build, packaging and instructions for each version are available in the README of the [repository](https://github.com/dariogriffo/ghostty-debian).

### Fedora

Ghostty is available in [Fedora COPR](https://copr.fedorainfracloud.org/coprs/scottames/ghostty/).

```
dnf copr enable scottames/ghostty
dnf install ghostty
```

Ghostty is also available in [Terra](https://terra.fyralabs.com/).

```
dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf install ghostty
```

#### Atomic Desktops (Silverblue)

Add the copr repository to your system:

```
. /etc/os-release
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo > /dev/null
```

After adding the repository, install Ghostty:

```
rpm-ostree refresh-md && \
rpm-ostree install ghostty
```

### Ubuntu

An Ubuntu package (.deb) is available from
[ghostty-ubuntu](https://github.com/mkasberg/ghostty-ubuntu) on GitHub. You can install it using the following command:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
```

### Universal AppImage

Ghostty is available as a Universal AppImage which is compatible with any Linux distribution (Including musl based).
You can access the AppImage at [ghostty-appimage](https://github.com/pkgforge-dev/ghostty-appimage) on GitHub.

To begin, download the appropriate `.appimage` file from the [Releases](https://github.com/pkgforge-dev/ghostty-appimage/releases) page
and follow the instructions below:

```
chmod a+x Ghostty-${VERSION}-${ARCH}.appimage
./Ghostty-${VERSION}-${ARCH}.appimage
```

For comprehensive installation instructions, please refer the [installation guide](https://github.com/pkgforge-dev/ghostty-appimage#%EF%B8%8F-installation).



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/install/binary.mdx)

* [macOS](https://ghostty.org/docs/install/binary.html#macos)
* [Homebrew](https://ghostty.org/docs/install/binary.html#homebrew)
* [Nix (macOS binary)](https://ghostty.org/docs/install/binary.html#nix-(macos-binary))
* [Linux](https://ghostty.org/docs/install/binary.html#linux)
* [Alpine Linux](https://ghostty.org/docs/install/binary.html#alpine-linux)
* [Arch Linux](https://ghostty.org/docs/install/binary.html#arch-linux)
* [Gentoo](https://ghostty.org/docs/install/binary.html#gentoo)
* [Nix](https://ghostty.org/docs/install/binary.html#nix)
* [NixOS](https://ghostty.org/docs/install/binary.html#nixos)
* [Nix on other distros](https://ghostty.org/docs/install/binary.html#nix-on-other-distros)
* [openSUSE](https://ghostty.org/docs/install/binary.html#opensuse)
* [Snap](https://ghostty.org/docs/install/binary.html#snap)
* [Solus](https://ghostty.org/docs/install/binary.html#solus)
* [Void Linux](https://ghostty.org/docs/install/binary.html#void-linux)
* [Linux (Community Binaries)](https://ghostty.org/docs/install/binary.html#linux-(community-binaries))
* [Debian](https://ghostty.org/docs/install/binary.html#debian)
* [Fedora](https://ghostty.org/docs/install/binary.html#fedora)
* [Atomic Desktops (Silverblue)](https://ghostty.org/docs/install/binary.html#atomic-desktops-(silverblue))
* [Ubuntu](https://ghostty.org/docs/install/binary.html#ubuntu)
* [Universal AppImage](https://ghostty.org/docs/install/binary.html#universal-appimage)
