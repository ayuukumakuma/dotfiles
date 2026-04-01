---
title: "Quiet Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/quiet-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Quiet Recipes](https://just.systems/man/en/quiet-recipes.html#quiet-recipes)

A recipe name may be prefixed with `@` to invert the meaning of `@` before each
line:

```
@quiet:
  echo hello
  echo goodbye
  @# all done!
```

Now only the lines starting with `@` will be echoed:

```
$ just quiet
hello
goodbye
# all done!
```

All recipes in a Justfile can be made quiet with `set quiet`:

```
set quiet

foo:
  echo "This is quiet"

@foo2:
  echo "This is also quiet"
```

The `[no-quiet]` attribute overrides this setting:

```
set quiet

foo:
  echo "This is quiet"

[no-quiet]
foo2:
  echo "This is not quiet"
```

Shebang recipes are quiet by default:

```
foo:
  #!/usr/bin/env bash
  echo 'Foo!'
```

```
$ just foo
Foo!
```

Adding `@` to a shebang recipe name makes `just` print the recipe before
executing it:

```
@bar:
  #!/usr/bin/env bash
  echo 'Bar!'
```

```
$ just bar
#!/usr/bin/env bash
echo 'Bar!'
Bar!
```

`just` normally prints error messages when a recipe line fails. These error
messages can be suppressed using the `[no-exit-message]`1.7.0
attribute. You may find this especially useful with a recipe that wraps a tool:

```
git *args:
    @git {{args}}
```

```
$ just git status
fatal: not a git repository (or any of the parent directories): .git
error: Recipe `git` failed on line 2 with exit code 128
```

Add the attribute to suppress the exit error message when the tool exits with a
non-zero code:

```
[no-exit-message]
git *args:
    @git {{args}}
```

```
$ just git status
fatal: not a git repository (or any of the parent directories): .git
```
