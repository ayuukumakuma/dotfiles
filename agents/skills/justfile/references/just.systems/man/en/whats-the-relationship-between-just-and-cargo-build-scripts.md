---
title: "What’s the relationship between Just and Cargo build scripts? - Just Programmer's Manual"
source_url: "https://just.systems/man/en/whats-the-relationship-between-just-and-cargo-build-scripts"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [What’s the relationship between Just and Cargo build scripts?](https://just.systems/man/en/whats-the-relationship-between-just-and-cargo-build-scripts.html#whats-the-relationship-between-just-and-cargo-build-scripts)

[`cargo` build scripts](http://doc.crates.io/build-script.html) have a pretty
specific use, which is to control how `cargo` builds your Rust project. This
might include adding flags to `rustc` invocations, building an external
dependency, or running some kind of codegen step.

`just`, on the other hand, is for all the other miscellaneous commands you
might run as part of development. Things like running tests in different
configurations, linting your code, pushing build artifacts to a server,
removing temporary files, and the like.

Also, although `just` is written in Rust, it can be used regardless of the
language or build system your project uses.
