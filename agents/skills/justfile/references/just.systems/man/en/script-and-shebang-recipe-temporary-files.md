---
title: "Script and Shebang Recipe Temporary Files - Just Programmer's Manual"
source_url: "https://just.systems/man/en/script-and-shebang-recipe-temporary-files"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Script and Shebang Recipe Temporary Files](https://just.systems/man/en/script-and-shebang-recipe-temporary-files.html#script-and-shebang-recipe-temporary-files)

Both script and shebang recipes write the recipe body to a temporary file for
execution. Script recipes execute that file by passing it to a command, while
shebang recipes execute the file directly. Shebang recipe execution will fail
if the filesystem containing the temporary file is mounted with `noexec` or is
otherwise non-executable.

The directory that `just` writes temporary files to may be configured in a
number of ways, from highest to lowest precedence:

* Globally with the `--tempdir` command-line option or the `JUST_TEMPDIR`
  environment variable1.41.0.
* On a per-module basis with the `tempdir` setting.
* Globally on Linux with the `XDG_RUNTIME_DIR` environment variable.
* Falling back to the directory returned by
  [std::env::temp\_dir](https://doc.rust-lang.org/std/env/fn.temp_dir.html).