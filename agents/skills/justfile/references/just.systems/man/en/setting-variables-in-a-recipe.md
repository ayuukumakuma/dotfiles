---
title: "Setting Variables in a Recipe - Just Programmer's Manual"
source_url: "https://just.systems/man/en/setting-variables-in-a-recipe"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Setting Variables in a Recipe](https://just.systems/man/en/setting-variables-in-a-recipe.html#setting-variables-in-a-recipe)

Recipe lines are interpreted by the shell, not `just`, so it’s not possible to
set `just` variables in the middle of a recipe:

```
foo:
  x := "hello" # This doesn't work!
  echo {{x}}
```

It is possible to use shell variables, but there’s another problem. Every
recipe line is run by a new shell instance, so variables set in one line won’t
be set in the next:

```
foo:
  x=hello && echo $x # This works!
  y=bye
  echo $y            # This doesn't, `y` is undefined here!
```

The best way to work around this is to use a shebang recipe. Shebang recipe
bodies are extracted and run as scripts, so a single shell instance will run
the whole thing:

```
foo:
  #!/usr/bin/env bash
  set -euxo pipefail
  x=hello
  echo $x
```
