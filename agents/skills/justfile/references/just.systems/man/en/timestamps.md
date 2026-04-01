---
title: "Timestamps - Just Programmer's Manual"
source_url: "https://just.systems/man/en/timestamps"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Timestamps](https://just.systems/man/en/timestamps.html#timestamps)

`just` can print timestamps before each recipe commands:

```
recipe:
  echo one
  sleep 2
  echo two
```

```
$ just --timestamp recipe
[07:28:46] echo one
one
[07:28:46] sleep 2
[07:28:48] echo two
two
```

By default, timestamps are formatted as `HH:MM:SS`. The format can be changed
with `--timestamp-format`:

```
$ just --timestamp recipe --timestamp-format '%H:%M:%S%.3f %Z'
[07:32:11:.349 UTC] echo one
one
[07:32:11:.350 UTC] sleep 2
[07:32:13:.352 UTC] echo two
two
```

The argument to `--timestamp-format` is a `strftime`-style format string, see
the
[`chrono` library docs](https://docs.rs/chrono/latest/chrono/format/strftime/index.html)
for details.
