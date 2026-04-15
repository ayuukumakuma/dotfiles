---
title: "Packages - Just Programmer's Manual"
source_url: "https://just.systems/man/en/packages"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Packages](https://just.systems/man/en/packages.html#packages)

#### [Cross-platform](https://just.systems/man/en/packages.html#cross-platform)

| Package Manager | Package | Command |
| --- | --- | --- |
| [arkade](https://github.com/alexellis/arkade) | just | `arkade get just` |
| [asdf](https://asdf-vm.com) | [just](https://github.com/olofvndrhr/asdf-just) | `asdf plugin add just`  `asdf install just <version>` |
| [Cargo](https://www.rust-lang.org) | [just](https://crates.io/crates/just) | `cargo install just` |
| [Cargo Binstall](https://github.com/cargo-bins/cargo-binstall) | [just](https://crates.io/crates/just) | `cargo binstall just` |
| [Conda](https://docs.conda.io/projects/conda/en/latest/index.html) | [just](https://anaconda.org/conda-forge/just) | `conda install -c conda-forge just` |
| [Homebrew](https://brew.sh) | [just](https://formulae.brew.sh/formula/just) | `brew install just` |
| [Nix](https://nixos.org/nix/) | [just](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/ju/just/package.nix) | `nix-env -iA nixpkgs.just` |
| [npm](https://www.npmjs.com/) | [rust-just](https://www.npmjs.com/package/rust-just) | `npm install -g rust-just` |
| [pipx](https://pipx.pypa.io/stable/) | [rust-just](https://pypi.org/project/rust-just/) | `pipx install rust-just` |
| [Snap](https://snapcraft.io) | [just](https://snapcraft.io/just) | `snap install --edge --classic just` |
| [uv](https://docs.astral.sh/uv/) | [rust-just](https://pypi.org/project/rust-just/) | `uv tool install rust-just` |

#### [BSD](https://just.systems/man/en/packages.html#bsd)

| Operating System | Package Manager | Package | Command |
| --- | --- | --- | --- |
| [FreeBSD](https://www.freebsd.org) | [pkg](https://www.freebsd.org/doc/handbook/pkgng-intro.html) | [just](https://www.freshports.org/deskutils/just/) | `pkg install just` |
| [OpenBSD](https://www.openbsd.org) | [pkg\_\*](https://www.openbsd.org/faq/faq15.html) | [just](https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/sysutils/just) | `pkg_add just` |

#### [Linux](https://just.systems/man/en/packages.html#linux)

| Operating System | Package Manager | Package | Command |
| --- | --- | --- | --- |
| [Alpine](https://alpinelinux.org) | [apk-tools](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management) | [just](https://pkgs.alpinelinux.org/package/edge/community/x86_64/just) | `apk add just` |
| [Arch](https://www.archlinux.org) | [pacman](https://wiki.archlinux.org/title/Pacman) | [just](https://archlinux.org/packages/extra/x86_64/just/) | `pacman -S just` |
| [Debian 13](https://debian.org) and [Ubuntu 24.04](https://ubuntu.com) derivatives | [apt](https://en.wikipedia.org/wiki/APT_(software)) | [just](https://packages.debian.org/trixie/just) | `apt install just` |
| [Fedora](https://getfedora.org) | [DNF](https://dnf.readthedocs.io/en/latest/) | [just](https://src.fedoraproject.org/rpms/rust-just) | `dnf install just` |
| [Gentoo](https://www.gentoo.org) | [Portage](https://wiki.gentoo.org/wiki/Portage) | [dev-build/just](https://packages.gentoo.org/packages/dev-build/just) | `emerge -av dev-build/just` |
| [NixOS](https://nixos.org/nixos/) | [Nix](https://nixos.org/nix/) | [just](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/ju/just/package.nix) | `nix-env -iA nixos.just` |
| [openSUSE](https://opensuse.org) | [Zypper](https://en.opensuse.org/Portal:Zypper) | [just](https://build.opensuse.org/package/show/Base:System/just) | `zypper in just` |
| [Solus](https://getsol.us) | [eopkg](https://getsol.us/articles/package-management/basics/en) | [just](https://dev.getsol.us/source/just/) | `eopkg install just` |
| [Void](https://voidlinux.org) | [XBPS](https://wiki.voidlinux.org/XBPS) | [just](https://github.com/void-linux/void-packages/blob/master/srcpkgs/just/template) | `xbps-install -S just` |

#### [Windows](https://just.systems/man/en/packages.html#windows)

| Package Manager | Package | Command |
| --- | --- | --- |
| [Chocolatey](https://chocolatey.org) | [just](https://github.com/michidk/just-choco) | `choco install just` |
| [Scoop](https://scoop.sh) | [just](https://github.com/ScoopInstaller/Main/blob/master/bucket/just.json) | `scoop install just` |
| [Windows Package Manager](https://learn.microsoft.com/en-us/windows/package-manager/) | [Casey/Just](https://github.com/microsoft/winget-pkgs/tree/master/manifests/c/Casey/Just) | `winget install --id Casey.Just --exact` |

#### [macOS](https://just.systems/man/en/packages.html#macos)

| Package Manager | Package | Command |
| --- | --- | --- |
| [MacPorts](https://www.macports.org) | [just](https://ports.macports.org/port/just/summary) | `port install just` |

![just package version table](https://repology.org/badge/vertical-allrepos/just.svg)
