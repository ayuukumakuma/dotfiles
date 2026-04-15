---
title: "Setting Variables from the Command Line - Just Programmer's Manual"
source_url: "https://just.systems/man/en/setting-variables-from-the-command-line"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Setting Variables from the Command Line](https://just.systems/man/en/setting-variables-from-the-command-line.html#setting-variables-from-the-command-line)

Variables can be overridden from the command line.

```
os := "linux"

test: build
  ./test --test {{os}}

build:
  ./build {{os}}
```

```
$ just
./build linux
./test --test linux
```

Any number of arguments of the form `NAME=VALUE` can be passed before recipes:

```
$ just os=plan9
./build plan9
./test --test plan9
```

Or you can use the `--set` flag:

```
$ just --set os bsd
./build bsd
./test --test bsd
```

Variables in submodules can be overridden using the `::`-separated path to the
variable. A variable named `bar` in a submodule named `foo` may be overridden
with `foo::bar=VALUE` or `--set foo::bar VALUE`.
