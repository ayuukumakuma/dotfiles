---
title: "Command Evaluation Using Backticks - Just Programmer's Manual"
source_url: "https://just.systems/man/en/command-evaluation-using-backticks"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Command Evaluation Using Backticks](https://just.systems/man/en/command-evaluation-using-backticks.html#command-evaluation-using-backticks)

Backticks can be used to store the result of commands:

```
localhost := `dumpinterfaces | cut -d: -f2 | sed 's/\/.*//' | sed 's/ //g'`

serve:
  ./serve {{localhost}} 8080
```

Indented backticks, delimited by three backticks, are de-indented in the same
manner as indented strings:

```
# This backtick evaluates the command `echo foo\necho bar\n`, which produces the value `foo\nbar\n`.
stuff := ```
    echo foo
    echo bar
  ```
```

See the [Strings](https://just.systems/man/en/strings.html) section for details on unindenting.

Backticks may not start with `#!`. This syntax is reserved for a future
upgrade.

The [`shell(…)` function](https://just.systems/man/en/functions.html#external-commands) provides a more general mechanism
to invoke external commands, including the ability to execute the contents of a
variable as a command, and to pass arguments to a command.
