---
title: "Installing Extensions | Installing Extensions"
source_url: "https://zed.dev/docs/extensions/installing-extensions"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Installing Extensions](https://zed.dev/docs/extensions/installing-extensions.html#installing-extensions)

Extensions add functionality to Zed, including languages, themes, and AI tools. Browse and install them from the Extension Gallery.

Open the Extension Gallery with `cmd-shift-x|ctrl-shift-x`, or select "Zed > Extensions" from the menu bar.

## [Installation Location](https://zed.dev/docs/extensions/installing-extensions.html#installation-location)

* On macOS, extensions are installed in `~/Library/Application Support/Zed/extensions`.
* On Linux, they are installed in either `$XDG_DATA_HOME/zed/extensions` or `~/.local/share/zed/extensions`.
* On Windows, the directory is `%LOCALAPPDATA%\Zed\extensions`.

This directory contains two subdirectories:

* `installed`, which contains the source code for each extension.
* `work` which contains files created by the extension itself, such as downloaded language servers.

## [Auto-installing](https://zed.dev/docs/extensions/installing-extensions.html#auto-installing)

To automate extension installation/uninstallation see the docs for [auto\_install\_extensions](https://zed.dev/docs/reference/all-settings.html#auto-install-extensions).

[Overview](https://zed.dev/docs/extensions.html "Overview")
[Developing Extensions](https://zed.dev/docs/extensions/developing-extensions.html "Developing Extensions")
