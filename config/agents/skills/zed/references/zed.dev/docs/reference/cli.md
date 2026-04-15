---
title: "CLI Reference | CLI Reference"
source_url: "https://zed.dev/docs/reference/cli"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [CLI Reference](https://zed.dev/docs/reference/cli.html#cli-reference)

Use Zed's command-line interface (CLI) to open files and directories, integrate with other tools, and control Zed from scripts.

## [Installation](https://zed.dev/docs/reference/cli.html#installation)

**macOS:** Run the `cli: install` command from the command palette (`cmd-shift-p|ctrl-shift-p`) to install the `zed` CLI to `/usr/local/bin/zed`.

**Linux:** The CLI is included with Zed packages. The binary name may vary by distribution (commonly `zed` or `zeditor`).

**Windows:** The CLI is included with Zed. Add Zed's installation directory to your PATH, or use the full path to `zed.exe`.

## [Usage](https://zed.dev/docs/reference/cli.html#usage)

```
zed [OPTIONS] [PATHS]...
```

## [Opening Files and Directories](https://zed.dev/docs/reference/cli.html#opening-files-and-directories)

Open a file:

```
zed myfile.txt
```

Open a directory as a workspace:

```
zed ~/projects/myproject
```

Open multiple files or directories:

```
zed file1.txt file2.txt ~/projects/myproject
```

Open a file at a specific line and column:

```
zed myfile.txt:42        # Open at line 42
zed myfile.txt:42:10     # Open at line 42, column 10
```

## [Options](https://zed.dev/docs/reference/cli.html#options)

### [`-w`, `--wait`](https://zed.dev/docs/reference/cli.html#-w---wait)

Wait for all opened files to be closed before the CLI exits. When opening a directory, waits until the window is closed.

This is useful for integrating Zed with tools that expect an editor to block until editing is complete (e.g., `git commit`):

```
export EDITOR="zed --wait"
git commit  # Opens Zed and waits for you to close the commit message file
```

### [`-n`, `--new`](https://zed.dev/docs/reference/cli.html#-n---new)

Open paths in a new workspace window, even if the paths are already open in an existing window:

```
zed -n ~/projects/myproject
```

### [`-a`, `--add`](https://zed.dev/docs/reference/cli.html#-a---add)

Add paths to the currently focused workspace instead of opening a new window. When multiple workspace windows are open, files open in the focused window:

```
zed -a newfile.txt
```

### [`-r`, `--reuse`](https://zed.dev/docs/reference/cli.html#-r---reuse)

Reuse an existing window, replacing its current workspace with the new paths:

```
zed -r ~/projects/different-project
```

### [`--diff <OLD_PATH> <NEW_PATH>`](https://zed.dev/docs/reference/cli.html#--diff-old_path-new_path)

Open a diff view comparing two files. Can be specified multiple times:

```
zed --diff file1.txt file2.txt
zed --diff old.rs new.rs --diff old2.rs new2.rs
```

### [`--foreground`](https://zed.dev/docs/reference/cli.html#--foreground)

Run Zed in the foreground, keeping the terminal attached. Useful for debugging:

```
zed --foreground
```

### [`--user-data-dir <DIR>`](https://zed.dev/docs/reference/cli.html#--user-data-dir-dir)

Use a custom directory for all user data (database, extensions, logs) instead of the default location:

```
zed --user-data-dir ~/.zed-custom
```

Default locations:

* **macOS:** `~/Library/Application Support/Zed`
* **Linux:** `$XDG_DATA_HOME/zed` (typically `~/.local/share/zed`)
* **Windows:** `%LOCALAPPDATA%\Zed`

### [`-v`, `--version`](https://zed.dev/docs/reference/cli.html#-v---version)

Print Zed's version and exit:

```
zed --version
```

### [`--uninstall`](https://zed.dev/docs/reference/cli.html#--uninstall)

Uninstall Zed and remove all related files (macOS and Linux only):

```
zed --uninstall
```

### [`--zed <PATH>`](https://zed.dev/docs/reference/cli.html#--zed-path)

Specify a custom path to the Zed application or binary:

```
zed --zed /path/to/Zed.app myfile.txt
```

## [Reading from Standard Input](https://zed.dev/docs/reference/cli.html#reading-from-standard-input)

Read content from stdin by passing `-` as the path:

```
echo "Hello, World!" | zed -
cat myfile.txt | zed -
ps aux | zed -
```

This creates a temporary file with the stdin content and opens it in Zed.

## [URL Handling](https://zed.dev/docs/reference/cli.html#url-handling)

The CLI can open `zed://`, `http://`, and `https://` URLs:

```
zed zed://settings
zed https://github.com/zed-industries/zed
```

## [Using Zed as Your Default Editor](https://zed.dev/docs/reference/cli.html#using-zed-as-your-default-editor)

Set Zed as your default editor for Git and other tools:

```
export EDITOR="zed --wait"
export VISUAL="zed --wait"
```

Add these lines to your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`).

## [macOS: Switching Release Channels](https://zed.dev/docs/reference/cli.html#macos-switching-release-channels)

On macOS, you can launch a specific release channel by passing the channel name as the first argument:

```
zed --stable myfile.txt
zed --preview myfile.txt
zed --nightly myfile.txt
```

## [WSL Integration (Windows)](https://zed.dev/docs/reference/cli.html#wsl-integration-windows)

On Windows, the CLI supports opening paths from WSL distributions. This is handled automatically when launching Zed from within WSL.

## [Exit Codes](https://zed.dev/docs/reference/cli.html#exit-codes)

| Code | Meaning |
| --- | --- |
| `0` | Success |
| `1` | Error (details printed to stderr) |

When using `--wait`, the exit code reflects whether the files were saved before closing.

[All Actions](https://zed.dev/docs/all-actions.html "All Actions")
[Authenticate](https://zed.dev/docs/authentication.html "Authenticate")
