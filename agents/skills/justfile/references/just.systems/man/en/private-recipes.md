---
title: "Private Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/private-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Private Recipes](https://just.systems/man/en/private-recipes.html#private-recipes)

Recipes and aliases whose name starts with a `_` are omitted from `just --list`:

```
test: _test-helper
  ./bin/test

_test-helper:
  ./bin/super-secret-test-helper-stuff
```

```
$ just --list
Available recipes:
    test
```

And from `just --summary`:

```
$ just --summary
test
```

The `[private]` attribute1.10.0 may also be used to hide recipes or
aliases without needing to change the name:

```
[private]
foo:

[private]
alias b := bar

bar:
```

```
$ just --list
Available recipes:
    bar
```

This is useful for helper recipes which are only meant to be used as
dependencies of other recipes.
