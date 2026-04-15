---
title: "Janus - Just Programmer's Manual"
source_url: "https://just.systems/man/en/janus"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Janus](https://just.systems/man/en/janus.html#janus)

[Janus](https://github.com/casey/janus) is a tool for checking whether a change
to `just` breaks or changes the interpretation of existing `justfile`s. It
collects and analyzes public `justfile`s on GitHub.

Before merging a particularly large or gruesome change, Janus should be run to
make sure that nothing breaks. Don’t worry about running Janus yourself, Casey
will happily run it for you on changes that need it.
