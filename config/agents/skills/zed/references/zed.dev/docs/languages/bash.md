---
title: "Bash | Bash"
source_url: "https://zed.dev/docs/languages/bash"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Bash](https://zed.dev/docs/languages/bash.html#bash)

Bash support is available through the [Bash extension](https://github.com/zed-extensions/bash).

* Tree-sitter: [tree-sitter/tree-sitter-bash](https://github.com/tree-sitter/tree-sitter-bash)
* Language Server: [bash-lsp/bash-language-server](https://github.com/bash-lsp/bash-language-server)

## [Configuration](https://zed.dev/docs/languages/bash.html#configuration)

When `shellcheck` is available `bash-language-server` will use it internally to provide diagnostics.

### [Install `shellcheck`:](https://zed.dev/docs/languages/bash.html#install-shellcheck)

```
brew install shellcheck             # macOS (HomeBrew)
apt-get install shellcheck          # Ubuntu/Debian
pacman -S shellcheck                # ArchLinux
dnf install shellcheck              # Fedora
yum install shellcheck              # CentOS/RHEL
zypper install shellcheck           # openSUSE
choco install shellcheck            # Windows (Chocolatey)
```

And verify it is available from your path:

```
which shellcheck
shellcheck --version
```

If you wish to customize the warnings/errors reported you just need to create a `.shellcheckrc` file. You can do this in the root of your project or in your home directory (`~/.shellcheckrc`). See: [shellcheck documentation](https://github.com/koalaman/shellcheck/wiki/Ignore#ignoring-one-or-more-types-of-errors-forever) for more.

### [See also:](https://zed.dev/docs/languages/bash.html#see-also)

* [Zed Docs: Language Support: Shell Scripts](https://zed.dev/docs/languages/sh.html)

[Astro](https://zed.dev/docs/languages/astro.html "Astro")
[Biome](https://zed.dev/docs/languages/biome.html "Biome")
