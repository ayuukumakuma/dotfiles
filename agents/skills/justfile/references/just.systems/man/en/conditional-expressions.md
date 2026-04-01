---
title: "Conditional Expressions - Just Programmer's Manual"
source_url: "https://just.systems/man/en/conditional-expressions"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Conditional Expressions](https://just.systems/man/en/conditional-expressions.html#conditional-expressions)

`if`/`else` expressions evaluate different branches depending on if two
expressions evaluate to the same value:

```
foo := if "2" == "2" { "Good!" } else { "1984" }

bar:
  @echo "{{foo}}"
```

```
$ just bar
Good!
```

It is also possible to test for inequality:

```
foo := if "hello" != "goodbye" { "xyz" } else { "abc" }

bar:
  @echo {{foo}}
```

```
$ just bar
xyz
```

And match against regular expressions:

```
foo := if "hello" =~ 'hel+o' { "match" } else { "mismatch" }

bar:
  @echo {{foo}}
```

```
$ just bar
match
```

Regular expressions are provided by the
[regex crate](https://github.com/rust-lang/regex), whose syntax is documented on
[docs.rs](https://docs.rs/regex/1.5.4/regex/#syntax). Since regular expressions
commonly use backslash escape sequences, consider using single-quoted string
literals, which will pass slashes to the regex parser unmolested.

Conditional expressions short-circuit, which means they only evaluate one of
their branches. This can be used to make sure that backtick expressions don’t
run when they shouldn’t.

```
foo := if env_var("RELEASE") == "true" { `get-something-from-release-database` } else { "dummy-value" }
```

Conditionals can be used inside of recipes:

```
bar foo:
  echo {{ if foo == "bar" { "hello" } else { "goodbye" } }}
```

Multiple conditionals can be chained:

```
foo := if "hello" == "goodbye" {
  "xyz"
} else if "a" == "a" {
  "abc"
} else {
  "123"
}

bar:
  @echo {{foo}}
```

```
$ just bar
abc
```
