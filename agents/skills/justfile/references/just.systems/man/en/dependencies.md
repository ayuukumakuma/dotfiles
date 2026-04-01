---
title: "Dependencies - Just Programmer's Manual"
source_url: "https://just.systems/man/en/dependencies"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Dependencies](https://just.systems/man/en/dependencies.html#dependencies)

Dependencies run before recipes that depend on them:

```
a: b
  @echo A

b:
  @echo B
```

```
$ just a
B
A
```

In a given invocation of `just`, a recipe with the same arguments will only run
once, regardless of how many times it appears in the command-line invocation,
or how many times it appears as a dependency:

```
a:
  @echo A

b: a
  @echo B

c: a
  @echo C
```

```
$ just a a a a a
A
$ just b c
A
B
C
```

Multiple recipes may depend on a recipe that performs some kind of setup, and
when those recipes run, that setup will only be performed once:

```
build:
  cc main.c

test-foo: build
  ./a.out --test foo

test-bar: build
  ./a.out --test bar
```

```
$ just test-foo test-bar
cc main.c
./a.out --test foo
./a.out --test bar
```

Recipes in a given run are only skipped when they receive the same arguments:

```
build:
  cc main.c

test TEST: build
  ./a.out --test {{TEST}}
```

```
$ just test foo test bar
cc main.c
./a.out --test foo
./a.out --test bar
```

#### [Running Recipes at the End of a Recipe](https://just.systems/man/en/dependencies.html#running-recipes-at-the-end-of-a-recipe)

Normal dependencies of a recipes always run before a recipe starts. That is to
say, the dependee always runs before the depender. These dependencies are
called “prior dependencies”.

A recipe can also have subsequent dependencies, which run immediately after the
recipe and are introduced with an `&&`:

```
a:
  echo 'A!'

b: a && c d
  echo 'B!'

c:
  echo 'C!'

d:
  echo 'D!'
```

…running *b* prints:

```
$ just b
echo 'A!'
A!
echo 'B!'
B!
echo 'C!'
C!
echo 'D!'
D!
```

#### [Running Recipes in the Middle of a Recipe](https://just.systems/man/en/dependencies.html#running-recipes-in-the-middle-of-a-recipe)

`just` doesn’t support running recipes in the middle of another recipe, but you
can call `just` recursively in the middle of a recipe. Given the following
`justfile`:

```
a:
  echo 'A!'

b: a
  echo 'B start!'
  just c
  echo 'B end!'

c:
  echo 'C!'
```

…running *b* prints:

```
$ just b
echo 'A!'
A!
echo 'B start!'
B start!
echo 'C!'
C!
echo 'B end!'
B end!
```

This has limitations, since recipe `c` is run with an entirely new invocation
of `just`: Assignments will be recalculated, dependencies might run twice, and
command line arguments will not be propagated to the child `just` process.
