---
title: "Modules - Just Programmer's Manual"
source_url: "https://just.systems/man/en/modules"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Modules](https://just.systems/man/en/modules.html#modules)

A `justfile` can declare modules using `mod` statements1.19.0.

`mod` statements were stabilized in `just`1.31.0.

If you have the following `justfile`:

```
mod bar

a:
  @echo A
```

And the following text in `bar.just`:

```
b:
  @echo B
```

`bar.just` will be included in `justfile` as a submodule. Recipes, aliases, and
variables defined in one submodule cannot be used in another, and each module
uses its own settings.

Recipes in submodules can be invoked as subcommands:

```
$ just bar b
B
```

Or with path syntax:

```
$ just bar::b
B
```

If a module is named `foo`, just will search for the module file in `foo.just`,
`foo/mod.just`, `foo/justfile`, and `foo/.justfile`. In the latter two cases,
the module file may have any capitalization.

Module statements may be of the form:

```
mod foo 'PATH'
```

Which loads the module’s source file from `PATH`, instead of from the usual
locations. A leading `~/` in `PATH` is replaced with the current user’s home
directory. `PATH` may point to the module source file itself, or to a directory
containing the module source file with the name `mod.just`, `justfile`, or
`.justfile`. In the latter two cases, the module file may have any
capitalization.

Environment files are only loaded for the root justfile, and loaded environment
variables are available in submodules. Settings in submodules that affect
environment file loading are ignored.

Recipes in submodules without the `[no-cd]` attribute run with the working
directory set to the directory containing the submodule source file.

`justfile()` and `justfile_directory()` always return the path to the root
justfile and the directory that contains it, even when called from submodule
recipes.

Modules may be made optional by putting a `?` after the `mod` keyword:

```
mod? foo
```

Missing source files for optional modules do not produce an error.

Optional modules with no source file do not conflict, so you can have multiple
mod statements with the same name, but with different source file paths, as
long as at most one source file exists:

```
mod? foo 'bar.just'
mod? foo 'baz.just'
```

Modules may be given doc comments which appear in `--list`
output1.30.0:

```
# foo is a great module!
mod foo
```

```
$ just --list
Available recipes:
    foo ... # foo is a great module!
```

Modules are still missing a lot of features, for example, the ability to refer
to variables in other modules. See the [module improvement tracking
issue](https://github.com/casey/just/issues/2252) for more information.
