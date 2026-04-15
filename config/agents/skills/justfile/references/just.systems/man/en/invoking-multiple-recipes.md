---
title: "Invoking Multiple Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/invoking-multiple-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Invoking Multiple Recipes](https://just.systems/man/en/invoking-multiple-recipes.html#invoking-multiple-recipes)

Multiple recipes may be invoked on the command line at once:

```
build:
  make web

serve:
  python3 -m http.server -d out 8000
```

```
$ just build serve
make web
python3 -m http.server -d out 8000
```

Keep in mind that recipes with parameters will swallow arguments, even if they
match the names of other recipes:

```
build project:
  make {{project}}

serve:
  python3 -m http.server -d out 8000
```

```
$ just build serve
make: *** No rule to make target `serve'.  Stop.
```

The `--one` flag can be used to restrict command-line invocations to a single
recipe:

```
$ just --one build serve
error: Expected 1 command-line recipe invocation but found 2.
```
