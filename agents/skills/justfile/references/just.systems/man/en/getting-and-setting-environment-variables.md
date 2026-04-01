---
title: "Getting and Setting Environment Variables - Just Programmer's Manual"
source_url: "https://just.systems/man/en/getting-and-setting-environment-variables"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Getting and Setting Environment Variables](https://just.systems/man/en/getting-and-setting-environment-variables.html#getting-and-setting-environment-variables)

#### [Exporting `just` Variables](https://just.systems/man/en/getting-and-setting-environment-variables.html#exporting-just-variables)

Assignments prefixed with the `export` keyword will be exported to recipes as
environment variables:

```
export RUST_BACKTRACE := "1"

test:
  # will print a stack trace if it crashes
  cargo test
```

Parameters prefixed with a `$` will be exported as environment variables:

```
test $RUST_BACKTRACE="1":
  # will print a stack trace if it crashes
  cargo test
```

You can also use the `[env(NAME, VALUE)]` attribute to export environment
variables to a specific recipe:

```
[env("RUST_BACKTRACE", "1")]
test:
  # will print a stack trace if it crashes
  cargo test
```

Exported variables and parameters are not exported to backticks in the same scope.

```
export WORLD := "world"
# This backtick will fail with "WORLD: unbound variable"
BAR := `echo hello $WORLD`
```

```
# Running `just a foo` will fail with "A: unbound variable"
a $A $B=`echo $A`:
  echo $A $B
```

When [export](https://just.systems/man/en/settings.html#export) is set, all `just` variables are exported as environment
variables.

#### [Unexporting Environment Variables](https://just.systems/man/en/getting-and-setting-environment-variables.html#unexporting-environment-variables)

Environment variables can be unexported with the `unexport keyword`1.29.0:

```
unexport FOO

@foo:
  echo $FOO
```

```
$ export FOO=bar
$ just foo
sh: FOO: unbound variable
```

#### [Getting Environment Variables from the environment](https://just.systems/man/en/getting-and-setting-environment-variables.html#getting-environment-variables-from-the-environment)

Environment variables from the environment are passed automatically to the
recipes.

```
print_home_folder:
  echo "HOME is: '${HOME}'"
```

```
$ just
HOME is '/home/myuser'
```

#### [Setting `just` Variables from Environment Variables](https://just.systems/man/en/getting-and-setting-environment-variables.html#setting-just-variables-from-environment-variables)

Environment variables can be propagated to `just` variables using the `env()` function.
See
[environment-variables](https://just.systems/man/en/functions.html#environment-variables).
