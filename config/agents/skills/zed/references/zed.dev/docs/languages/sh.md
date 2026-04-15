---
title: "Shell Script | Shell Script"
source_url: "https://zed.dev/docs/languages/sh"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Shell Scripts](https://zed.dev/docs/languages/sh.html#shell-scripts)

Shell Scripts (bash, zsh, dash, sh) are supported natively by Zed.

* Tree-sitter: [tree-sitter/tree-sitter-bash](https://github.com/tree-sitter/tree-sitter-bash)

## [Settings](https://zed.dev/docs/languages/sh.html#settings)

Configure settings in Settings (`cmd-,|ctrl-,`) under Languages > Shell Script, or add to your settings file:

```
  "languages": {
    "Shell Script": {
      "tab_size": 2,
      "hard_tabs": false
    }
  }
```

### [Formatting](https://zed.dev/docs/languages/sh.html#formatting)

Zed supports auto-formatting Shell Scripts using external tools like [`shfmt`](https://github.com/mvdan/sh).

1. Install `shfmt`:

```
brew install shfmt            # macos (homebrew)
sudo apt-get install shfmt    # debian/ubuntu
dnf install shfmt             # fedora
yum install shfmt             # redhat
pacman -Sy shfmt              # archlinux
choco install shfmt           # windows (chocolatey)
```

2. Ensure `shfmt` is available in your path and check the version:

```
which shfmt
shfmt --version
```

3. Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > Shell Script, or add to your settings file:

```
  "languages": {
    "Shell Script": {
      "format_on_save": "on",
      "formatter": {
        "external": {
          "command": "shfmt",
          // Change `--indent 2` to match your preferred tab_size
          "arguments": ["--filename", "{buffer_path}", "--indent", "2"]
        }
      }
    }
  }
```

## [See also:](https://zed.dev/docs/languages/sh.html#see-also)

* [Zed Docs: Language Support: Bash](https://zed.dev/docs/languages/bash.html)
* [Zed Docs: Language Support: Fish](https://zed.dev/docs/languages/fish.html)

[Scheme](https://zed.dev/docs/languages/scheme.html "Scheme")
[SQL](https://zed.dev/docs/languages/sql.html "SQL")
