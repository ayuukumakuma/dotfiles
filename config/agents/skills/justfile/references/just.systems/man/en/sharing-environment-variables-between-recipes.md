---
title: "Sharing Environment Variables Between Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/sharing-environment-variables-between-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Sharing Environment Variables Between Recipes](https://just.systems/man/en/sharing-environment-variables-between-recipes.html#sharing-environment-variables-between-recipes)

Each line of each recipe is executed by a fresh shell, so it is not possible to
share environment variables between recipes.

#### [Using Python Virtual Environments](https://just.systems/man/en/sharing-environment-variables-between-recipes.html#using-python-virtual-environments)

Some tools, like [Python’s venv](https://docs.python.org/3/library/venv.html),
require loading environment variables in order to work, making them challenging
to use with `just`. As a workaround, you can execute the virtual environment
binaries directly:

```
venv:
  [ -d foo ] || python3 -m venv foo

run: venv
  ./foo/bin/python3 main.py
```
