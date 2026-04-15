---
title: "Introduction - Just Programmer's Manual"
source_url: "https://just.systems/man/en/introduction"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



# `just`

[![crates.io version](https://img.shields.io/crates/v/just.svg)](https://crates.io/crates/just)
[![build status](https://github.com/casey/just/actions/workflows/ci.yaml/badge.svg)](https://github.com/casey/just/actions/workflows/ci.yaml)
[![downloads](https://img.shields.io/github/downloads/casey/just/total.svg)](https://github.com/casey/just/releases)
[![chat on discord](https://img.shields.io/discord/695580069837406228?logo=discord)](https://discord.gg/ezYScXR)
[![say thanks](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](mailto:casey@rodarmor.com?subject=Thanks%20for%20Just!)



`just` is a handy way to save and run project-specific commands.

This readme is also available as a [book](https://just.systems/man/en/index.html). The
book reflects the latest release, whereas the
[readme on GitHub](https://github.com/casey/just/blob/master/README.md)
reflects latest master.

(中文文档在 [这里](https://github.com/casey/just/blob/master/README.%E4%B8%AD%E6%96%87.md),
快看过来!)

Commands, called recipes, are stored in a file called `justfile` with syntax
inspired by `make`:

![screenshot](https://raw.githubusercontent.com/casey/just/master/etc/screenshot.png)

You can then run them with `just RECIPE`:

```
$ just test-all
cc *.c -o main
./test --all
Yay, all your tests passed!
```

`just` has a ton of useful features, and many improvements over `make`:

* `just` is a command runner, not a build system, so it avoids much of
  [`make`’s complexity and idiosyncrasies](https://just.systems/man/en/what-are-the-idiosyncrasies-of-make-that-just-avoids.html).
  No need for `.PHONY` recipes!
* Linux, MacOS, Windows, and other reasonable unices are supported with no
  additional dependencies. (Although if your system doesn’t have an `sh`,
  you’ll need to [choose a different shell](https://just.systems/man/en/settings.html#shell).)
* Errors are specific and informative, and syntax errors are reported along
  with their source context.
* Recipes can accept [command line arguments](https://just.systems/man/en/recipe-parameters.html).
* Wherever possible, errors are resolved statically. Unknown recipes and
  circular dependencies are reported before anything runs.
* `just` [loads `.env` files](https://just.systems/man/en/settings.html#dotenv-settings), making it easy to populate
  environment variables.
* Recipes can be [listed from the command line](https://just.systems/man/en/listing-available-recipes.html).
* Command line completion scripts are
  [available for most popular shells](https://just.systems/man/en/shell-completion-scripts.html).
* Recipes can be written in
  [arbitrary languages](https://just.systems/man/en/shebang-recipes.html), like Python or NodeJS.
* `just` can be invoked from any subdirectory, not just the directory that
  contains the `justfile`.
* And [much more](https://just.systems/man/en/index.html)!

If you need help with `just` please feel free to open an issue or ping me on
[Discord](https://discord.gg/ezYScXR). Feature requests and bug reports are
always welcome!
