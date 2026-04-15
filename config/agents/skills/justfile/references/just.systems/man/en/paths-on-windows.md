---
title: "Paths on Windows - Just Programmer's Manual"
source_url: "https://just.systems/man/en/paths-on-windows"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Paths on Windows](https://just.systems/man/en/paths-on-windows.html#paths-on-windows)

On Windows, all functions that return paths, except `invocation_directory()`
will return `\`-separated paths. When not using PowerShell or `cmd.exe` these
paths should be quoted to prevent the `\`s from being interpreted as character
escapes:

```
ls:
    echo '{{absolute_path(".")}}'
```

`cygpath.exe` is an executable included in some distributions of Unix userlands
for Windows, including [Cygwin](https://www.cygwin.com/) and
[Git](https://git-scm.com/downloads) for Windows.

`just` uses `cygpath.exe` in two places:

For backwards compatibility, `invocation_directory()`, uses `cygpath.exe` to
convert the invocation directory into a unix-style `/`-separated path. Use
`invocation_directory_native()` to get the native, Windows-style path. On unix,
`invocation_directory()` and `invocation_directory_native()` both return the
same unix-style path.

`cygpath.exe` is used also used to convert Unix-style shebang lines into
Windows paths. As an alternative, the `[script]` attribute can be used, which
does not depend on `cygpath.exe`.

If `cygpath.exe` is available, you can use it to convert between path styles:

```
foo_unix := '/hello/world'
foo_windows := shell('cygpath --windows $1', foo_unix)

bar_windows := 'C:\hello\world'
bar_unix := shell('cygpath --unix $1', bar_windows)
```
