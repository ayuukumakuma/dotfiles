---
title: "Attributes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/attributes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Attributes](https://just.systems/man/en/attributes.html#attributes)

Recipes, `mod` statements, and aliases may be annotated with attributes that
change their behavior.

| Name | Type | Description |
| --- | --- | --- |
| `[arg(ARG, help="HELP")]`1.46.0 | recipe | Print help string `HELP` for `ARG` in usage messages. |
| `[arg(ARG, long="LONG")]`1.46.0 | recipe | Require values of argument `ARG` to be passed as `--LONG` option. |
| `[arg(ARG, pattern="PATTERN")]`1.45.0 | recipe | Require values of argument `ARG` to match regular expression `PATTERN`. |
| `[arg(ARG, short="S")]`1.46.0 | recipe | Require values of argument `ARG` to be passed as short `-S` option. |
| `[arg(ARG, value="VALUE")]`1.46.0 | recipe | Makes option `ARG` a flag which does not take a value. |
| `[confirm(PROMPT)]`1.23.0 | recipe | Require confirmation prior to executing recipe with a custom prompt. |
| `[confirm]`1.17.0 | recipe | Require confirmation prior to executing recipe. |
| `[default]`1.43.0 | recipe | Use recipe as module’s default recipe. |
| `[doc(DOC)]`1.27.0 | module, recipe | Set recipe or module’s [documentation comment](https://just.systems/man/en/documentation-comments.html) to `DOC`. |
| `[dragonfly]`1.47.0 | recipe | Enable recipe on DragonFly BSD. |
| `[env(ENV_VAR, VALUE)]` 1.47.0 | recipe | Set environment variables for recipe. |
| `[extension(EXT)]`1.32.0 | recipe | Set shebang recipe script’s file extension to `EXT`. `EXT` should include a period if one is desired. |
| `[freebsd]`1.47.0 | recipe | Enable recipe on FreeBSD. |
| `[group(NAME)]`1.27.0 | module, recipe | Put recipe or module in [group](https://just.systems/man/en/groups.html) `NAME`. |
| `[linux]`1.8.0 | recipe | Enable recipe on Linux. |
| `[macos]`1.8.0 | recipe | Enable recipe on MacOS. |
| `[metadata(METADATA)]`1.42.0 | recipe | Attach `METADATA` to recipe. |
| `[netbsd]`1.47.0 | recipe | Enable recipe on NetBSD. |
| `[no-cd]`1.9.0 | recipe | Don’t change directory before executing recipe. |
| `[no-exit-message]`1.7.0 | recipe | Don’t print an error message if recipe fails. |
| `[no-quiet]`1.23.0 | recipe | Override globally quiet recipes and always echo out the recipe. |
| `[openbsd]`1.38.0 | recipe | Enable recipe on OpenBSD. |
| `[parallel]`1.42.0 | recipe | Run this recipe’s dependencies in parallel. |
| `[positional-arguments]`1.29.0 | recipe | Turn on [positional arguments](https://just.systems/man/en/avoiding-argument-splitting.html#positional-arguments) for this recipe. |
| `[private]`1.10.0 | alias, recipe | Make recipe, alias, or variable private. See [Private Recipes](https://just.systems/man/en/private-recipes.html). |
| `[script(COMMAND)]`1.32.0 | recipe | Execute recipe as a script interpreted by `COMMAND`. See [script recipes](https://just.systems/man/en/script-recipes.html) for more details. |
| `[script]`1.33.0 | recipe | Execute recipe as script. See [script recipes](https://just.systems/man/en/script-recipes.html) for more details. |
| `[unix]`1.8.0 | recipe | Enable recipe on Unixes. (Includes MacOS). |
| `[windows]`1.8.0 | recipe | Enable recipe on Windows. |
| `[working-directory(PATH)]`1.38.0 | recipe | Set recipe working directory. `PATH` may be relative or absolute. If relative, it is interpreted relative to the default working directory. |

A recipe can have multiple attributes, either on multiple lines:

```
[no-cd]
[private]
foo:
    echo "foo"
```

Or separated by commas on a single line1.14.0:

```
[no-cd, private]
foo:
    echo "foo"
```

Attributes with a single argument may be written with a colon:

```
[group: 'bar']
foo:
```

#### [Enabling and Disabling Recipes](https://just.systems/man/en/attributes.html#enabling-and-disabling-recipes)

The `[linux]`, `[macos]`, `[unix]`, and `[windows]` attributes1.8.0
are configuration attributes. By default, recipes are always enabled. A recipe
with one or more configuration attributes will only be enabled when one or more
of those configurations is active.

This can be used to write `justfile`s that behave differently depending on
which operating system they run on. The `run` recipe in this `justfile` will
compile and run `main.c`, using a different C compiler and using the correct
output binary name for that compiler depending on the operating system:

```
[unix]
run:
  cc main.c
  ./a.out

[windows]
run:
  cl main.c
  main.exe
```

#### [Disabling Changing Directory](https://just.systems/man/en/attributes.html#disabling-changing-directory)

`just` normally executes recipes with the current directory set to the
directory that contains the `justfile`. This can be disabled using the
`[no-cd]` attribute1.9.0. This can be used to create recipes which
use paths relative to the invocation directory, or which operate on the current
directory.

For example, this `commit` recipe:

```
[no-cd]
commit file:
  git add {{file}}
  git commit
```

Can be used with paths that are relative to the current directory, because
`[no-cd]` prevents `just` from changing the current directory when executing
`commit`.

#### [Requiring Confirmation for Recipes](https://just.systems/man/en/attributes.html#requiring-confirmation-for-recipes)

`just` normally executes all recipes unless there is an error. The `[confirm]`
attribute1.17.0 allows recipes require confirmation in the terminal
prior to running. This can be overridden by passing `--yes` to `just`, which
will automatically confirm any recipes marked by this attribute.

Recipes dependent on a recipe that requires confirmation will not be run if the
relied upon recipe is not confirmed, as well as recipes passed after any recipe
that requires confirmation.

```
[confirm]
delete-all:
  rm -rf *
```

#### [Custom Confirmation Prompt](https://just.systems/man/en/attributes.html#custom-confirmation-prompt)

The default confirmation prompt can be overridden with
`[confirm(PROMPT)]`1.23.0:

```
[confirm("Are you sure you want to delete everything?")]
delete-everything:
  rm -rf *
```

#### [Metadata](https://just.systems/man/en/attributes.html#metadata)

Metadata in the form of lists of strings may be attached to recipes with the
`[metadata(METADATA)]` attribute1.42.0:

```
[metadata("hello", "goodbye")]
foo:
```

Metadata can be read using `just --dump --dump-format json`.
