---
title: "Recipe Parameters - Just Programmer's Manual"
source_url: "https://just.systems/man/en/recipe-parameters"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Recipe Parameters](https://just.systems/man/en/recipe-parameters.html#recipe-parameters)

Recipes may have parameters. Here recipe `build` has a parameter called
`target`:

```
build target:
  @echo 'Building {{target}}…'
  cd {{target}} && make
```

To pass arguments on the command line, put them after the recipe name:

```
$ just build my-awesome-project
Building my-awesome-project…
cd my-awesome-project && make
```

To pass arguments to a dependency, put the dependency in parentheses along with
the arguments:

```
default: (build "main")

build target:
  @echo 'Building {{target}}…'
  cd {{target}} && make
```

Variables can also be passed as arguments to dependencies:

```
target := "main"

_build version:
  @echo 'Building {{version}}…'
  cd {{version}} && make

build: (_build target)
```

A command’s arguments can be passed to dependency by putting the dependency in
parentheses along with the arguments:

```
build target:
  @echo "Building {{target}}…"

push target: (build target)
  @echo 'Pushing {{target}}…'
```

Parameters may have default values:

```
default := 'all'

test target tests=default:
  @echo 'Testing {{target}}:{{tests}}…'
  ./test --tests {{tests}} {{target}}
```

Parameters with default values may be omitted:

```
$ just test server
Testing server:all…
./test --tests all server
```

Or supplied:

```
$ just test server unit
Testing server:unit…
./test --tests unit server
```

Default values may be arbitrary expressions, but expressions containing the
`+`, `&&`, `||`, or `/` operators must be parenthesized:

```
arch := "wasm"

test triple=(arch + "-unknown-unknown") input=(arch / "input.dat"):
  ./test {{triple}}
```

The last parameter of a recipe may be variadic, indicated with either a `+` or
a `*` before the argument name:

```
backup +FILES:
  scp {{FILES}} me@server.com:
```

Variadic parameters prefixed with `+` accept *one or more* arguments and expand
to a string containing those arguments separated by spaces:

```
$ just backup FAQ.md GRAMMAR.md
scp FAQ.md GRAMMAR.md me@server.com:
FAQ.md                  100% 1831     1.8KB/s   00:00
GRAMMAR.md              100% 1666     1.6KB/s   00:00
```

Variadic parameters prefixed with `*` accept *zero or more* arguments and
expand to a string containing those arguments separated by spaces, or an empty
string if no arguments are present:

```
commit MESSAGE *FLAGS:
  git commit {{FLAGS}} -m "{{MESSAGE}}"
```

Variadic parameters can be assigned default values. These are overridden by
arguments passed on the command line:

```
test +FLAGS='-q':
  cargo test {{FLAGS}}
```

`{{…}}` substitutions may need to be quoted if they contain spaces. For
example, if you have the following recipe:

```
search QUERY:
  lynx https://www.google.com/?q={{QUERY}}
```

And you type:

```
$ just search "cat toupee"
```

`just` will run the command `lynx https://www.google.com/?q=cat toupee`, which
will get parsed by `sh` as `lynx`, `https://www.google.com/?q=cat`, and
`toupee`, and not the intended `lynx` and `https://www.google.com/?q=cat toupee`.

You can fix this by adding quotes:

```
search QUERY:
  lynx 'https://www.google.com/?q={{QUERY}}'
```

Parameters prefixed with a `$` will be exported as environment variables:

```
foo $bar:
  echo $bar
```

Parameters may be constrained to match regular expression patterns using the
`[arg("name", pattern="pattern")]` attribute1.45.0:

```
[arg('n', pattern='\d+')]
double n:
  echo $(({{n}} * 2))
```

A leading `^` and trailing `$` are added to the pattern, so it must match the
entire argument value.

You may constrain the pattern to a number of alternatives using the `|`
operator:

```
[arg('flag', pattern='--help|--version')]
info flag:
  just {{flag}}
```

Regular expressions are provided by the
[Rust `regex` crate](https://docs.rs/regex/latest/regex/). See the
[syntax documentation](https://docs.rs/regex/latest/regex/#syntax) for usage
examples.

Usage information for a recipe may be printed with the `--usage`
subcommand1.46.0:

```
$ just --usage foo
Usage: just foo [OPTIONS] bar

Arguments:
  bar
```

Help strings may be added to arguments using the `[arg(ARG, help=HELP)]` attribute:

```
[arg("bar", help="hello")]
foo bar:
```

```
$ just --usage foo
Usage: just foo bar

Arguments:
  bar hello
```

#### [Recipe Flags and Options](https://just.systems/man/en/recipe-parameters.html#recipe-flags-and-options)

Recipe parameters are positional by default.

In this `justfile`:

```
@foo bar:
  echo bar={{bar}}
```

The parameter `bar` is positional:

```
$ just foo hello
bar=hello
```

The `[arg(ARG, long=OPTION)]`1.46.0 attribute can be used to make a
parameter a long option.

In this `justfile`:

```
[arg("bar", long="bar")]
foo bar:
```

The parameter `bar` is given with the `--bar` option:

```
$ just foo --bar hello
bar=hello
```

Options may also be passed with `--name=value` syntax:

```
$ just foo --bar=hello
bar=hello
```

The value of `long` can be omitted, in which case the option defaults to the
name of the parameter:

```
[arg("bar", long)]
foo bar:
```

The `[arg(ARG, short=OPTION)]`1.46.0 attribute can be used to make a
parameter a short option.

In this `justfile`:

```
[arg("bar", short="b")]
foo bar:
```

The parameter `bar` is given with the `-b` option:

```
$ just foo -b hello
bar=hello
```

If a parameter has both a long and short option, it may be passed using either.

Variadic `*` and `+` parameters cannot be options.

The `[arg(ARG, value=VALUE, …)]`1.46.0 attribute can be used with
`long` or `short` to make a parameter a flag which does not take a value.

In this `justfile`:

```
[arg("bar", long="bar", value="hello")]
foo bar:
```

The parameter `bar` is given with the `--bar` option, but does not take a
value, and instead takes the value given in the `[arg]` attribute:

```
$ just foo --bar
bar=hello
```

This is useful for unconditionally requiring a flag like `--force` on dangerous
commands.

A flag is optional if its parameter has a default:

```
[arg("bar", long="bar", value="hello")]
foo bar="goodbye":
```

Causing it to receive the default when not passed in the invocation:

```
$ just foo
bar=goodbye
```
