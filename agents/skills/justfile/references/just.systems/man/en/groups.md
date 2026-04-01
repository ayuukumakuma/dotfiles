---
title: "Groups - Just Programmer's Manual"
source_url: "https://just.systems/man/en/groups"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Groups](https://just.systems/man/en/groups.html#groups)

Recipes and modules may be annotated with one or more group names:

```
[group('lint')]
js-lint:
    echo 'Running JS linter…'

[group('rust recipes')]
[group('lint')]
rust-lint:
    echo 'Running Rust linter…'

[group('lint')]
cpp-lint:
  echo 'Running C++ linter…'

# not in any group
email-everyone:
    echo 'Sending mass email…'
```

Recipes are listed by group:

```
$ just --list
Available recipes:
    email-everyone # not in any group

    [lint]
    cpp-lint
    js-lint
    rust-lint

    [rust recipes]
    rust-lint
```

`just --list --unsorted` prints recipes in their justfile order within each group:

```
$ just --list --unsorted
Available recipes:
    (no group)
    email-everyone # not in any group

    [lint]
    js-lint
    rust-lint
    cpp-lint

    [rust recipes]
    rust-lint
```

Groups can be listed with `--groups`:

```
$ just --groups
Recipe groups:
  lint
  rust recipes
```

Use `just --groups --unsorted` to print groups in their justfile order.
