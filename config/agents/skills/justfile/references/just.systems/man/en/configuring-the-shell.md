---
title: "Configuring the Shell - Just Programmer's Manual"
source_url: "https://just.systems/man/en/configuring-the-shell"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Configuring the Shell](https://just.systems/man/en/configuring-the-shell.html#configuring-the-shell)

There are a number of ways to configure the shell for linewise recipes, which
are the default when a recipe does not start with a `#!` shebang. Their
precedence, from highest to lowest, is:

1. The `--shell` and `--shell-arg` command line options. Passing either of
   these will cause `just` to ignore any settings in the current justfile.
2. `set windows-shell := [...]`
3. `set windows-powershell` (deprecated)
4. `set shell := [...]`

Since `set windows-shell` has higher precedence than `set shell`, you can use
`set windows-shell` to pick a shell on Windows, and `set shell` to pick a shell
for all other platforms.
