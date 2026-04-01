---
title: "Prerequisites - Just Programmer's Manual"
source_url: "https://just.systems/man/en/prerequisites"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Prerequisites](https://just.systems/man/en/prerequisites.html#prerequisites)

`just` should run on any system with a reasonable `sh`, including Linux, MacOS,
and the BSDs.

#### [Windows](https://just.systems/man/en/prerequisites.html#windows)

On Windows, `just` works with the `sh` provided by
[Git for Windows](https://git-scm.com),
[GitHub Desktop](https://desktop.github.com), or
[Cygwin](http://www.cygwin.com). After installation, `sh` must be available in
the `PATH` of the shell you want to invoke `just` from.

If you’d rather not install `sh`, you can use the `shell` setting to use the
shell of your choice.

Like PowerShell:

```
# use PowerShell instead of sh:
set shell := ["powershell.exe", "-c"]

hello:
  Write-Host "Hello, world!"
```

…or `cmd.exe`:

```
# use cmd.exe instead of sh:
set shell := ["cmd.exe", "/c"]

list:
  dir
```

You can also set the shell using command-line arguments. For example, to use
PowerShell, launch `just` with `--shell powershell.exe --shell-arg -c`.

(PowerShell is installed by default on Windows 7 SP1 and Windows Server 2008 R2
S1 and later, and `cmd.exe` is quite fiddly, so PowerShell is recommended for
most Windows users.)
