---
title: "Fallback to parent justfiles - Just Programmer's Manual"
source_url: "https://just.systems/man/en/fallback-to-parent-justfiles"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Fallback to parent `justfile`s](https://just.systems/man/en/fallback-to-parent-justfiles.html#fallback-to-parent-justfiles)

If a recipe is not found in a `justfile` and the `fallback` setting is set,
`just` will look for `justfile`s in the parent directory and up, until it
reaches the root directory. `just` will stop after it reaches a `justfile` in
which the `fallback` setting is `false` or unset.

As an example, suppose the current directory contains this `justfile`:

```
set fallback
foo:
  echo foo
```

And the parent directory contains this `justfile`:

```
bar:
  echo bar
```

```
$ just bar
Trying ../justfile
echo bar
bar
```
