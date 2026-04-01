---
title: "Changing the Working Directory in a Recipe - Just Programmer's Manual"
source_url: "https://just.systems/man/en/changing-the-working-directory-in-a-recipe"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Changing the Working Directory in a Recipe](https://just.systems/man/en/changing-the-working-directory-in-a-recipe.html#changing-the-working-directory-in-a-recipe)

Each recipe line is executed by a new shell, so if you change the working
directory on one line, it won’t have an effect on later lines:

```
foo:
  pwd    # This `pwd` will print the same directory…
  cd bar
  pwd    # …as this `pwd`!
```

There are a couple ways around this. One is to call `cd` on the same line as
the command you want to run:

```
foo:
  cd bar && pwd
```

The other is to use a shebang recipe. Shebang recipe bodies are extracted and
run as scripts, so a single shell instance will run the whole thing, and thus a
`cd` on one line will affect later lines, just like a shell script:

```
foo:
  #!/usr/bin/env bash
  set -euxo pipefail
  cd bar
  pwd
```
