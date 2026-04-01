---
title: "Quick Start - Just Programmer's Manual"
source_url: "https://just.systems/man/en/quick-start"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



## [Quick Start](https://just.systems/man/en/quick-start.html#quick-start)

See the installation section for how to install `just` on your computer. Try
running `just --version` to make sure that it’s installed correctly.

For an overview of the syntax, check out
[this cheatsheet](https://cheatography.com/linux-china/cheat-sheets/justfile/).

Once `just` is installed and working, create a file named `justfile` in the
root of your project with the following contents:

```
recipe-name:
  echo 'This is a recipe!'

# this is a comment
another-recipe:
  @echo 'This is another recipe.'
```

When you invoke `just` it looks for file `justfile` in the current directory
and upwards, so you can invoke it from any subdirectory of your project.

The search for a `justfile` is case insensitive, so any case, like `Justfile`,
`JUSTFILE`, or `JuStFiLe`, will work. `just` will also look for files with the
name `.justfile`, in case you’d like to hide a `justfile`.

Running `just` with no arguments runs the first recipe in the `justfile`:

```
$ just
echo 'This is a recipe!'
This is a recipe!
```

One or more arguments specify the recipe(s) to run:

```
$ just another-recipe
This is another recipe.
```

`just` prints each command to standard error before running it, which is why
`echo 'This is a recipe!'` was printed. This is suppressed for lines starting
with `@`, which is why `echo 'This is another recipe.'` was not printed.

Recipes stop running if a command fails. Here `cargo publish` will only run if
`cargo test` succeeds:

```
publish:
  cargo test
  # tests passed, time to publish!
  cargo publish
```

Recipes can depend on other recipes. Here the `test` recipe depends on the
`build` recipe, so `build` will run before `test`:

```
build:
  cc main.c foo.c bar.c -o main

test: build
  ./test

sloc:
  @echo "`wc -l *.c` lines of code"
```

```
$ just test
cc main.c foo.c bar.c -o main
./test
testing… all tests passed!
```

Recipes without dependencies will run in the order they’re given on the command
line:

```
$ just build sloc
cc main.c foo.c bar.c -o main
1337 lines of code
```

Dependencies will always run first, even if they are passed after a recipe that
depends on them:

```
$ just test build
cc main.c foo.c bar.c -o main
./test
testing… all tests passed!
```

Recipes may depend on recipes in submodules:

```
mod foo

baz: foo::bar
```
