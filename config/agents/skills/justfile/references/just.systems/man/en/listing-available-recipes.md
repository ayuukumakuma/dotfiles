---
title: "Listing Available Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/listing-available-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Listing Available Recipes](https://just.systems/man/en/listing-available-recipes.html#listing-available-recipes)

Recipes can be listed in alphabetical order with `just --list`:

```
$ just --list
Available recipes:
    build
    test
    deploy
    lint
```

Recipes in [submodules](https://just.systems/man/en/modules.html) can be listed with `just --list PATH`, where
`PATH` is a space- or `::`-separated module path:

```
$ cat justfile
mod foo
$ cat foo.just
mod bar
$ cat bar.just
baz:
$ just --list foo bar
Available recipes:
    baz
$ just --list foo::bar
Available recipes:
    baz
```

`just --summary` is more concise:

```
$ just --summary
build test deploy lint
```

Pass `--unsorted` to print recipes in the order they appear in the `justfile`:

```
test:
  echo 'Testing!'

build:
  echo 'Building!'
```

```
$ just --list --unsorted
Available recipes:
    test
    build
```

```
$ just --summary --unsorted
test build
```

If you’d like `just` to default to listing the recipes in the `justfile`, you
can use this as your default recipe:

```
default:
  @just --list
```

Note that you may need to add `--justfile {{justfile()}}` to the line above.
Without it, if you executed `just -f /some/distant/justfile -d .` or
`just -f ./non-standard-justfile`, the plain `just --list` inside the recipe
would not necessarily use the file you provided. It would try to find a
justfile in your current path, maybe even resulting in a `No justfile found`
error.

The heading text can be customized with `--list-heading`:

```
$ just --list --list-heading $'Cool stuff…\n'
Cool stuff…
    test
    build
```

And the indentation can be customized with `--list-prefix`:

```
$ just --list --list-prefix ····
Available recipes:
····test
····build
```

The argument to `--list-heading` replaces both the heading and the newline
following it, so it should contain a newline if non-empty. It works this way so
you can suppress the heading line entirely by passing the empty string:

```
$ just --list --list-heading ''
    test
    build
```
