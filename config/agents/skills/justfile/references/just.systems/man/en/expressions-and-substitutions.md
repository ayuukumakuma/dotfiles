---
title: "Expressions and Substitutions - Just Programmer's Manual"
source_url: "https://just.systems/man/en/expressions-and-substitutions"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Expressions and Substitutions](https://just.systems/man/en/expressions-and-substitutions.html#expressions-and-substitutions)

Various operators and function calls are supported in expressions, which may be
used in assignments, default recipe arguments, and inside recipe body `{{…}}`
substitutions.

```
tmpdir  := `mktemp -d`
version := "0.2.7"
tardir  := tmpdir / "awesomesauce-" + version
tarball := tardir + ".tar.gz"
config  := quote(config_dir() / ".project-config")

publish:
  rm -f {{tarball}}
  mkdir {{tardir}}
  cp README.md *.c {{ config }} {{tardir}}
  tar zcvf {{tarball}} {{tardir}}
  scp {{tarball}} me@server.com:release/
  rm -rf {{tarball}} {{tardir}}
```

#### [Concatenation](https://just.systems/man/en/expressions-and-substitutions.html#concatenation)

The `+` operator returns the left-hand argument concatenated with the
right-hand argument:

```
foobar := 'foo' + 'bar'
```

#### [Logical Operators](https://just.systems/man/en/expressions-and-substitutions.html#logical-operators)

The logical operators `&&` and `||` can be used to coalesce string
values1.37.0, similar to Python’s `and` and `or`. These operators
consider the empty string `''` to be false, and all other strings to be true.

These operators are currently unstable.

The `&&` operator returns the empty string if the left-hand argument is the
empty string, otherwise it returns the right-hand argument:

```
foo := '' && 'goodbye'      # ''
bar := 'hello' && 'goodbye' # 'goodbye'
```

The `||` operator returns the left-hand argument if it is non-empty, otherwise
it returns the right-hand argument:

```
foo := '' || 'goodbye'      # 'goodbye'
bar := 'hello' || 'goodbye' # 'hello'
```

#### [Joining Paths](https://just.systems/man/en/expressions-and-substitutions.html#joining-paths)

The `/` operator can be used to join two strings with a slash:

```
foo := "a" / "b"
```

```
$ just --evaluate foo
a/b
```

Note that a `/` is added even if one is already present:

```
foo := "a/"
bar := foo / "b"
```

```
$ just --evaluate bar
a//b
```

Absolute paths can also be constructed1.5.0:

```
foo := / "b"
```

```
$ just --evaluate foo
/b
```

The `/` operator uses the `/` character, even on Windows. Thus, using the `/`
operator should be avoided with paths that use universal naming convention
(UNC), i.e., those that start with `\?`, since forward slashes are not
supported with UNC paths.

#### [Escaping `{{`](https://just.systems/man/en/expressions-and-substitutions.html#escaping-)

To write a recipe containing `{{`, use `{{{{`:

```
braces:
  echo 'I {{{{LOVE}} curly braces!'
```

(An unmatched `}}` is ignored, so it doesn’t need to be escaped.)

Another option is to put all the text you’d like to escape inside of an
interpolation:

```
braces:
  echo '{{'I {{LOVE}} curly braces!'}}'
```

Yet another option is to use `{{ "{{" }}`:

```
braces:
  echo 'I {{ "{{" }}LOVE}} curly braces!'
```
