---
title: "Getting Started - Just Programmer's Manual"
source_url: "https://just.systems/man/en/getting-started"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Getting Started](https://just.systems/man/en/getting-started.html#getting-started)

`just` is written in Rust. Use
[rustup](https://www.rust-lang.org/tools/install) to install a Rust toolchain.

`just` is extensively tested. All new features must be covered by unit or
integration tests. Unit tests are under
[src](https://github.com/casey/just/blob/master/src), live alongside the code
being tested, and test code in isolation. Integration tests are in the [tests
directory](https://github.com/casey/just/blob/master/tests) and test the `just`
binary from the outside by invoking `just` on a given `justfile` and set of
command-line arguments, and checking the output.

You should write whichever type of tests are easiest to write for your feature
while still providing good test coverage.

Unit tests are useful for testing new Rust functions that are used internally
and as an aid for development. A good example are the unit tests which cover
the
[`unindent()` function](https://github.com/casey/just/blob/master/src/unindent.rs),
used to unindent triple-quoted strings and backticks. `unindent()` has a bunch
of tricky edge cases which are easy to exercise with unit tests that call
`unindent()` directly.

Integration tests are useful for making sure that the final behavior of the
`just` binary is correct. `unindent()` is also covered by integration tests
which make sure that evaluating a triple-quoted string produces the correct
unindented value. However, there are not integration tests for all possible
cases. These are covered by faster, more concise unit tests that call
`unindent()` directly.

Integration tests use the `Test` struct, a builder which allows for easily
invoking `just` with a given `justfile`, arguments, and environment variables,
and checking the program’s stdout, stderr, and exit code .
