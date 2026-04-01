---
title: "Invoking justfiles in Other Directories - Just Programmer's Manual"
source_url: "https://just.systems/man/en/invoking-justfiles-in-other-directories"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Invoking `justfile`s in Other Directories](https://just.systems/man/en/invoking-justfiles-in-other-directories.html#invoking-justfiles-in-other-directories)

If the first argument passed to `just` contains a `/`, then the following
occurs:

1. The argument is split at the last `/`.
2. The part before the last `/` is treated as a directory. `just` will start
   its search for the `justfile` there, instead of in the current directory.
3. The part after the last slash is treated as a normal argument, or ignored
   if it is empty.

This may seem a little strange, but it’s useful if you wish to run a command in
a `justfile` that is in a subdirectory.

For example, if you are in a directory which contains a subdirectory named
`foo`, which contains a `justfile` with the recipe `build`, which is also the
default recipe, the following are all equivalent:

```
$ (cd foo && just build)
$ just foo/build
$ just foo/
```

Additional recipes after the first are sought in the same `justfile`. For
example, the following are both equivalent:

```
$ just foo/a b
$ (cd foo && just a b)
```

And will both invoke recipes `a` and `b` in `foo/justfile`.
