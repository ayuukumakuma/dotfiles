---
title: "Strings - Just Programmer's Manual"
source_url: "https://just.systems/man/en/strings"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Strings](https://just.systems/man/en/strings.html#strings)

`'single'`, `"double"`, and `'''triple'''` quoted string literals are
supported. Unlike in recipe bodies, `{{…}}` interpolations are not supported
inside strings.

Double-quoted strings support escape sequences:

```
carriage-return   := "\r"
double-quote      := "\""
newline           := "\n"
no-newline        := "\
"
slash             := "\\"
tab               := "\t"
unicode-codepoint := "\u{1F916}"
```

```
$ just --evaluate
"arriage-return   := "
double-quote      := """
newline           := "
"
no-newline        := ""
slash             := "\"
tab               := "     "
unicode-codepoint := "🤖"
```

The unicode character escape sequence `\u{…}`1.36.0 accepts up to
six hex digits.

Strings may contain line breaks:

```
single := '
hello
'

double := "
goodbye
"
```

Single-quoted strings do not recognize escape sequences:

```
escapes := '\t\n\r\"\\'
```

```
$ just --evaluate
escapes := "\t\n\r\"\\"
```

Indented versions of both single- and double-quoted strings, delimited by
triple single- or double-quotes, are supported. Indented string lines are
stripped of a leading line break, and leading whitespace common to all
non-blank lines:

```
# this string will evaluate to `foo\nbar\n`
x := '''
  foo
  bar
'''

# this string will evaluate to `abc\n  wuv\nxyz\n`
y := """
  abc
    wuv
  xyz
"""
```

Similar to unindented strings, indented double-quoted strings process escape
sequences, and indented single-quoted strings ignore escape sequences. Escape
sequence processing takes place after unindentation. The unindentation
algorithm does not take escape-sequence produced whitespace or newlines into
account.

#### [Shell-expanded strings](https://just.systems/man/en/strings.html#shell-expanded-strings)

Strings prefixed with `x` are shell expanded1.27.0:

```
foobar := x'~/$FOO/${BAR}'
```

| Value | Replacement |
| --- | --- |
| `$VAR` | value of environment variable `VAR` |
| `${VAR}` | value of environment variable `VAR` |
| `${VAR:-DEFAULT}` | value of environment variable `VAR`, or `DEFAULT` if `VAR` is not set |
| Leading `~` | path to current user’s home directory |
| Leading `~USER` | path to `USER`’s home directory |

This expansion is performed at compile time, so variables from `.env` files and
exported `just` variables cannot be used. However, this allows shell expanded
strings to be used in places like settings and import paths, which cannot
depend on `just` variables and `.env` files.

#### [Format strings](https://just.systems/man/en/strings.html#format-strings)

Strings prefixed with `f` are format strings1.44.0:

```
name := "world"
message := f'Hello, {{name}}!'
```

Format strings may contain interpolations delimited with `{{…}}` that contain
expressions. Format strings evaluate to the concatenated string fragments and
evaluated expressions.

Use `{{{{` to include a literal `{{` in a format string:

```
foo := f'I {{{{LOVE} curly braces!'
```
