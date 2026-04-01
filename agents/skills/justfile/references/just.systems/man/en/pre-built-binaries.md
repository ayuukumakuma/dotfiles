---
title: "Pre-Built Binaries - Just Programmer's Manual"
source_url: "https://just.systems/man/en/pre-built-binaries"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Pre-Built Binaries](https://just.systems/man/en/pre-built-binaries.html#pre-built-binaries)

Pre-built binaries for Linux, MacOS, and Windows can be found on
[the releases page](https://github.com/casey/just/releases).

You can use the following command on Linux, MacOS, or Windows to download the
latest release, just replace `DEST` with the directory where you’d like to put
`just`:

```
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to DEST
```

For example, to install `just` to `~/bin`:

```
# create ~/bin
mkdir -p ~/bin

# download and extract just to ~/bin/just
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin

# add `~/bin` to the paths that your shell searches for executables
# this line should be added to your shells initialization file,
# e.g. `~/.bashrc` or `~/.zshrc`
export PATH="$PATH:$HOME/bin"

# just should now be executable
just --help
```

Note that `install.sh` may fail on GitHub Actions, or in other environments
where many machines share IP addresses. `install.sh` calls GitHub APIs in order
to determine the latest version of `just` to install, and those API calls are
rate-limited on a per-IP basis. To make `install.sh` more reliable in such
circumstances, pass a specific tag to install with `--tag`.

Another way to avoid rate-limiting is to pass a GitHub authentication token to
`install.sh` as an environment variable named `GITHUB_TOKEN`, allowing it to
authenticate its requests.

[Releases](https://github.com/casey/just/releases) include a `SHA256SUM` file
which can be used to verify the integrity of pre-built binary archives.

To verify a release, download the pre-built binary archive along with the
`SHA256SUM` file and run:

```
shasum --algorithm 256 --ignore-missing --check SHA256SUMS
```
