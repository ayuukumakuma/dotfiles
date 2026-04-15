---
title: "Settings - Just Programmer's Manual"
source_url: "https://just.systems/man/en/settings"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Settings](https://just.systems/man/en/settings.html#settings)

Settings control interpretation and execution. Each setting may be specified at
most once, anywhere in the `justfile`.

For example:

```
set shell := ["zsh", "-cu"]

foo:
  # this line will be run as `zsh -cu 'ls **/*.txt'`
  ls **/*.txt
```

#### [Table of Settings](https://just.systems/man/en/settings.html#table-of-settings)

| Name | Value | Default | Description |
| --- | --- | --- | --- |
| `allow-duplicate-recipes` | boolean | `false` | Allow recipes appearing later in a `justfile` to override earlier recipes with the same name. |
| `allow-duplicate-variables` | boolean | `false` | Allow variables appearing later in a `justfile` to override earlier variables with the same name. |
| `dotenv-filename` | string | - | Load a `.env` file with a custom name, if present. |
| `dotenv-load` | boolean | `false` | Load a `.env` file, if present. |
| `dotenv-override` | boolean | `false` | Override existing environment variables with values from the `.env` file. |
| `dotenv-path` | string | - | Load a `.env` file from a custom path and error if not present. Overrides `dotenv-filename`. |
| `dotenv-required` | boolean | `false` | Error if a `.env` file isn’t found. |
| `export` | boolean | `false` | Export all variables as environment variables. |
| `fallback` | boolean | `false` | Search `justfile` in parent directory if the first recipe on the command line is not found. |
| `ignore-comments` | boolean | `false` | Ignore recipe lines beginning with `#`. |
| `lazy`1.47.0 | boolean | `false` | Don’t evaluate unused variables. |
| `positional-arguments` | boolean | `false` | Pass positional arguments. |
| `quiet` | boolean | `false` | Disable echoing recipe lines before executing. |
| `script-interpreter`1.33.0 | `[COMMAND, ARGS…]` | `['sh', '-eu']` | Set command used to invoke recipes with empty `[script]` attribute. |
| `shell` | `[COMMAND, ARGS…]` | - | Set command used to invoke recipes and evaluate backticks. |
| `tempdir` | string | - | Create temporary directories in `tempdir` instead of the system default temporary directory. |
| `unstable`1.31.0 | boolean | `false` | Enable unstable features. |
| `windows-powershell` | boolean | `false` | Use PowerShell on Windows as default shell. (Deprecated. Use `windows-shell` instead. |
| `windows-shell` | `[COMMAND, ARGS…]` | - | Set the command used to invoke recipes and evaluate backticks. |
| `working-directory`1.33.0 | string | - | Set the working directory for recipes and backticks, relative to the default working directory. |

Boolean settings can be written as:

```
set NAME
```

Which is equivalent to:

```
set NAME := true
```

Non-boolean settings can be set to both strings and
expressions.1.46.0

However, because settings affect the behavior of backticks and many functions,
those expressions may not contain backticks or function calls, directly or
transitively via reference.

#### [Allow Duplicate Recipes](https://just.systems/man/en/settings.html#allow-duplicate-recipes)

If `allow-duplicate-recipes` is set to `true`, defining multiple recipes with
the same name is not an error and the last definition is used. Defaults to
`false`.

```
set allow-duplicate-recipes

@foo:
  echo foo

@foo:
  echo bar
```

```
$ just foo
bar
```

#### [Allow Duplicate Variables](https://just.systems/man/en/settings.html#allow-duplicate-variables)

If `allow-duplicate-variables` is set to `true`, defining multiple variables
with the same name is not an error and the last definition is used. Defaults to
`false`.

```
set allow-duplicate-variables

a := "foo"
a := "bar"

@foo:
  echo {{a}}
```

```
$ just foo
bar
```

#### [Dotenv Settings](https://just.systems/man/en/settings.html#dotenv-settings)

If any of `dotenv-load`, `dotenv-filename`, `dotenv-override`, `dotenv-path`,
or `dotenv-required` are set, `just` will try to load environment variables
from a file.

If `dotenv-path` is set, `just` will look for a file at the given path, which
may be absolute, or relative to the working directory.

The command-line option `--dotenv-path`, short form `-E`, can be used to set or
override `dotenv-path` at runtime.

If `dotenv-filename` is set `just` will look for a file at the given path,
relative to the working directory and each of its ancestors.

If `dotenv-filename` is not set, but `dotenv-load` or `dotenv-required` are
set, just will look for a file named `.env`, relative to the working directory
and each of its ancestors.

`dotenv-filename` and `dotenv-path` are similar, but `dotenv-path` is only
checked relative to the working directory, whereas `dotenv-filename` is checked
relative to the working directory and each of its ancestors.

It is not an error if an environment file is not found, unless
`dotenv-required` is set.

The loaded variables are environment variables, not `just` variables, and so
must be accessed using `$VARIABLE_NAME` in recipes and backticks.

If `dotenv-override` is set, variables from the environment file will override
existing environment variables.

For example, if your `.env` file contains:

```
# a comment, will be ignored
DATABASE_ADDRESS=localhost:6379
SERVER_PORT=1337
```

And your `justfile` contains:

```
set dotenv-load

serve:
  @echo "Starting server with database $DATABASE_ADDRESS on port $SERVER_PORT…"
  ./server --database $DATABASE_ADDRESS --port $SERVER_PORT
```

`just serve` will output:

```
$ just serve
Starting server with database localhost:6379 on port 1337…
./server --database $DATABASE_ADDRESS --port $SERVER_PORT
```

#### [Export](https://just.systems/man/en/settings.html#export)

The `export` setting causes all `just` variables to be exported as environment
variables. Defaults to `false`.

```
set export

a := "hello"

@foo b:
  echo $a
  echo $b
```

```
$ just foo goodbye
hello
goodbye
```

#### [Lazy](https://just.systems/man/en/settings.html#lazy)

The `lazy` setting1.47.0 causes the evaluator to skip evaluating
unused variables. This can be beneficial when a `justfile` contains variables
that are expensive to evaluate but only sometimes used.

In the following `justfile`, `token` will be skipped when only invoking `bar`:

```
set lazy

token := `expensive-script-to-get-credentials`

foo:
  curl -H "Authorization: Bearer {{ token }}" https://example.com/foo

bar:
  cargo test
```

Because `just` cannot determine when exported variables are used, assignments
with `export` and assignments in a module with `set export` will always be
evaluated.

#### [Positional Arguments](https://just.systems/man/en/settings.html#positional-arguments)

If `positional-arguments` is `true`, recipe arguments will be passed as
positional arguments to commands. For linewise recipes, argument `$0` will be
the name of the recipe.

For example, running this recipe:

```
set positional-arguments

@foo bar:
  echo $0
  echo $1
```

Will produce the following output:

```
$ just foo hello
foo
hello
```

When using an `sh`-compatible shell, such as `bash` or `zsh`, `$@` expands to
the positional arguments given to the recipe, starting from one. When used
within double quotes as `"$@"`, arguments including whitespace will be passed
on as if they were double-quoted. That is, `"$@"` is equivalent to `"$1" "$2"`…
When there are no positional parameters, `"$@"` and `$@` expand to nothing
(i.e., they are removed).

This example recipe will print arguments one by one on separate lines:

```
set positional-arguments

@test *args='':
  bash -c 'while (( "$#" )); do echo - $1; shift; done' -- "$@"
```

Running it with *two* arguments:

```
$ just test foo "bar baz"
- foo
- bar baz
```

Positional arguments may also be turned on a per-recipe basis with the
`[positional-arguments]` attribute1.29.0:

```
[positional-arguments]
@foo bar:
  echo $0
  echo $1
```

Note that PowerShell does not handle positional arguments in the same way as
other shells, so turning on positional arguments will likely break recipes that
use PowerShell.

If using PowerShell 7.4 or better, the `-CommandWithArgs` flag will make
positional arguments work as expected:

```
set shell := ['pwsh.exe', '-CommandWithArgs']
set positional-arguments

print-args a b c:
  Write-Output @($args[1..($args.Count - 1)])
```

#### [Shell](https://just.systems/man/en/settings.html#shell)

The `shell` setting controls the command used to invoke recipe lines and
backticks. Shebang recipes are unaffected. The default shell is `sh -cu`.

```
# use python3 to execute recipe lines and backticks
set shell := ["python3", "-c"]

# use print to capture result of evaluation
foos := `print("foo" * 4)`

foo:
  print("Snake snake snake snake.")
  print("{{foos}}")
```

`just` passes the command to be executed as an argument. Many shells will need
an additional flag, often `-c`, to make them evaluate the first argument.

##### [Windows Shell](https://just.systems/man/en/settings.html#windows-shell)

`just` uses `sh` on Windows by default. To use a different shell on Windows,
use `windows-shell`:

```
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

hello:
  Write-Host "Hello, world!"
```

See
[powershell.just](https://github.com/casey/just/blob/master/examples/powershell.just)
for a justfile that uses PowerShell on all platforms.

##### [Windows PowerShell](https://just.systems/man/en/settings.html#windows-powershell)

*`set windows-powershell` uses the legacy `powershell.exe` binary, and is no
longer recommended. See the `windows-shell` setting above for a more flexible
way to control which shell is used on Windows.*

`just` uses `sh` on Windows by default. To use `powershell.exe` instead, set
`windows-powershell` to true.

```
set windows-powershell := true

hello:
  Write-Host "Hello, world!"
```

##### [Python 3](https://just.systems/man/en/settings.html#python-3)

```
set shell := ["python3", "-c"]
```

##### [Bash](https://just.systems/man/en/settings.html#bash)

```
set shell := ["bash", "-uc"]
```

##### [Z Shell](https://just.systems/man/en/settings.html#z-shell)

```
set shell := ["zsh", "-uc"]
```

##### [Fish](https://just.systems/man/en/settings.html#fish)

```
set shell := ["fish", "-c"]
```

##### [Nushell](https://just.systems/man/en/settings.html#nushell)

```
set shell := ["nu", "-c"]
```

If you want to change the default table mode to `light`:

```
set shell := ['nu', '-m', 'light', '-c']
```

*[Nushell](https://github.com/nushell/nushell) was written in Rust, and **has
cross-platform support for Windows / macOS and Linux**.*
