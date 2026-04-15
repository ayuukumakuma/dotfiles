---
title: "Working Directory - Just Programmer's Manual"
source_url: "https://just.systems/man/en/working-directory"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Working Directory](https://just.systems/man/en/working-directory.html#working-directory)

By default, recipes run with the working directory set to the directory that
contains the `justfile`.

The `[no-cd]` attribute can be used to make recipes run with the working
directory set to directory in which `just` was invoked.

```
@foo:
  pwd

[no-cd]
@bar:
  pwd
```

```
$ cd subdir
$ just foo
/
$ just bar
/subdir
```

You can override the working directory for all recipes with
`set working-directory := '…'`:

```
set working-directory := 'bar'

@foo:
  pwd
```

```
$ pwd
/home/bob
$ just foo
/home/bob/bar
```

You can override the working directory for a specific recipe with the
`working-directory` attribute1.38.0:

```
[working-directory: 'bar']
@foo:
  pwd
```

```
$ pwd
/home/bob
$ just foo
/home/bob/bar
```

The argument to the `working-directory` setting or `working-directory`
attribute may be absolute or relative. If it is relative it is interpreted
relative to the default working directory.
