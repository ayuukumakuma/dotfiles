---
title: "Command-line Options - Just Programmer's Manual"
source_url: "https://just.systems/man/en/command-line-options"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Command-line Options](https://just.systems/man/en/command-line-options.html#command-line-options)

`just` supports a number of useful command-line options for listing, dumping,
and debugging recipes and variables:

```
$ just --list
Available recipes:
  js
  perl
  polyglot
  python
  ruby
$ just --show perl
perl:
  #!/usr/bin/env perl
  print "Larry Wall says Hi!\n";
$ just --show polyglot
polyglot: python js perl sh ruby
```

#### [Setting Command-line Options with Environment Variables](https://just.systems/man/en/command-line-options.html#setting-command-line-options-with-environment-variables)

Some command-line options can be set with environment variables

For example, unstable features can be enabled either with the `--unstable`
flag:

```
$ just --unstable
```

Or by setting the `JUST_UNSTABLE` environment variable:

```
$ export JUST_UNSTABLE=1
$ just
```

Since environment variables are inherited by child processes, command-line
options set with environment variables are inherited by recursive invocations
of `just`, where as command line options set with arguments are not.

Consult `just --help` for which options can be set with environment variables.
