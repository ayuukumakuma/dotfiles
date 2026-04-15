---
title: "Multi-Line Constructs - Just Programmer's Manual"
source_url: "https://just.systems/man/en/multi-line-constructs"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Multi-Line Constructs](https://just.systems/man/en/multi-line-constructs.html#multi-line-constructs)

Recipes without an initial shebang are evaluated and run line-by-line, which
means that multi-line constructs probably won’t do what you want.

For example, with the following `justfile`:

```
conditional:
  if true; then
    echo 'True!'
  fi
```

The extra leading whitespace before the second line of the `conditional` recipe
will produce a parse error:

```
$ just conditional
error: Recipe line has extra leading whitespace
  |
3 |         echo 'True!'
  |     ^^^^^^^^^^^^^^^^
```

To work around this, you can write conditionals on one line, escape newlines
with slashes, or add a shebang to your recipe. Some examples of multi-line
constructs are provided for reference.

#### [`if` statements](https://just.systems/man/en/multi-line-constructs.html#if-statements)

```
conditional:
  if true; then echo 'True!'; fi
```

```
conditional:
  if true; then \
    echo 'True!'; \
  fi
```

```
conditional:
  #!/usr/bin/env sh
  if true; then
    echo 'True!'
  fi
```

#### [`for` loops](https://just.systems/man/en/multi-line-constructs.html#for-loops)

```
for:
  for file in `ls .`; do echo $file; done
```

```
for:
  for file in `ls .`; do \
    echo $file; \
  done
```

```
for:
  #!/usr/bin/env sh
  for file in `ls .`; do
    echo $file
  done
```

#### [`while` loops](https://just.systems/man/en/multi-line-constructs.html#while-loops)

```
while:
  while `server-is-dead`; do ping -c 1 server; done
```

```
while:
  while `server-is-dead`; do \
    ping -c 1 server; \
  done
```

```
while:
  #!/usr/bin/env sh
  while `server-is-dead`; do
    ping -c 1 server
  done
```

#### [Outside Recipe Bodies](https://just.systems/man/en/multi-line-constructs.html#outside-recipe-bodies)

Parenthesized expressions can span multiple lines:

```
abc := ('a' +
        'b'
         + 'c')

abc2 := (
  'a' +
  'b' +
  'c'
)

foo param=('foo'
      + 'bar'
    ):
  echo {{param}}

bar: (foo
        'Foo'
     )
  echo 'Bar!'
```

Lines ending with a backslash continue on to the next line as if the lines were
joined by whitespace1.15.0:

```
a := 'foo' + \
     'bar'

foo param1 \
  param2='foo' \
  *varparam='': dep1 \
                (dep2 'foo')
  echo {{param1}} {{param2}} {{varparam}}

dep1: \
    # this comment is not part of the recipe body
  echo 'dep1'

dep2 \
  param:
    echo 'Dependency with parameter {{param}}'
```

Backslash line continuations can also be used in interpolations. The line
following the backslash must be indented.

```
recipe:
  echo '{{ \
  "This interpolation " + \
    "has a lot of text." \
  }}'
  echo 'back to recipe body'
```
