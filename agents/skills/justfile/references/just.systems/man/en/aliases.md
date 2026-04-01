---
title: "Aliases - Just Programmer's Manual"
source_url: "https://just.systems/man/en/aliases"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Aliases](https://just.systems/man/en/aliases.html#aliases)

Aliases allow recipes to be invoked on the command line with alternative names:

```
alias b := build

build:
  echo 'Building!'
```

```
$ just b
echo 'Building!'
Building!
```

The target of an alias may be a recipe in a submodule:

```
mod foo

alias baz := foo::bar
```
