---
title: "The Default Recipe - Just Programmer's Manual"
source_url: "https://just.systems/man/en/the-default-recipe"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [The Default Recipe](https://just.systems/man/en/the-default-recipe.html#the-default-recipe)

When `just` is invoked without a recipe, it runs the recipe with the
`[default]` attribute, or the first recipe in the `justfile` if no recipe has
the `[default]` attribute.

This recipe might be the most frequently run command in the project, like
running the tests:

```
test:
  cargo test
```

You can also use dependencies to run multiple recipes by default:

```
default: lint build test

build:
  echo Building…

test:
  echo Testing…

lint:
  echo Linting…
```

If no recipe makes sense as the default recipe, you can add a recipe to the
beginning of your `justfile` that lists the available recipes:

```
default:
  just --list
```
