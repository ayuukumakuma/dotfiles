---
title: "Stopping execution with error - Just Programmer's Manual"
source_url: "https://just.systems/man/en/stopping-execution-with-error"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Stopping execution with error](https://just.systems/man/en/stopping-execution-with-error.html#stopping-execution-with-error)

Execution can be halted with the `error` function. For example:

```
foo := if "hello" == "goodbye" {
  "xyz"
} else if "a" == "b" {
  "abc"
} else {
  error("123")
}
```

Which produce the following error when run:

```
error: Call to function `error` failed: 123
   |
16 |   error("123")
```
