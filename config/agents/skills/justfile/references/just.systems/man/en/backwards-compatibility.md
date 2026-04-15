---
title: "Backwards Compatibility - Just Programmer's Manual"
source_url: "https://just.systems/man/en/backwards-compatibility"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



## [Backwards Compatibility](https://just.systems/man/en/backwards-compatibility.html#backwards-compatibility)

With the release of version 1.0, `just` features a strong commitment to
backwards compatibility and stability.

Future releases will not introduce backwards incompatible changes that make
existing `justfile`s stop working, or break working invocations of the
command-line interface.

This does not, however, preclude fixing outright bugs, even if doing so might
break `justfiles` that rely on their behavior.

There will never be a `just` 2.0. Any desirable backwards-incompatible changes
will be opt-in on a per-`justfile` basis, so users may migrate at their
leisure.

Features that aren’t yet ready for stabilization are marked as unstable and may
be changed or removed at any time. Using unstable features produces an error by
default, which can be suppressed by passing the `--unstable` flag,
`set unstable`, or setting the environment variable `JUST_UNSTABLE`, to any
value other than `false`, `0`, or the empty string.
