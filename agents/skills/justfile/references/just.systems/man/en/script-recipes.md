---
title: "Script Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/script-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Script Recipes](https://just.systems/man/en/script-recipes.html#script-recipes)

Recipes with a `[script(COMMAND)]`1.32.0 attribute are run as
scripts interpreted by `COMMAND`. This avoids some of the issues with shebang
recipes, such as the use of `cygpath` on Windows, the need to use
`/usr/bin/env`, inconsistencies in shebang line splitting across Unix OSs, and
requiring a temporary directory from which files can be executed.

Recipes with an empty `[script]` attribute are executed with the value of `set script-interpreter := […]`1.33.0, defaulting to `sh -eu`, and *not*
the value of `set shell`.

The body of the recipe is evaluated, written to disk in the temporary
directory, and run by passing its path as an argument to `COMMAND`.
