---
title: "Documentation Comments - Just Programmer's Manual"
source_url: "https://just.systems/man/en/documentation-comments"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Documentation Comments](https://just.systems/man/en/documentation-comments.html#documentation-comments)

Comments immediately preceding a recipe will appear in `just --list`:

```
# build stuff
build:
  ./bin/build

# test stuff
test:
  ./bin/test
```

```
$ just --list
Available recipes:
    build # build stuff
    test # test stuff
```

The `[doc]` attribute can be used to set or suppress a recipe’s doc comment:

```
# This comment won't appear
[doc('Build stuff')]
build:
  ./bin/build

# This one won't either
[doc]
test:
  ./bin/test
```

```
$ just --list
Available recipes:
    build # Build stuff
    test
```
