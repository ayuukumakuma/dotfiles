---
title: "Shell Completion Scripts - Just Programmer's Manual"
source_url: "https://just.systems/man/en/shell-completion-scripts"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Shell Completion Scripts](https://just.systems/man/en/shell-completion-scripts.html#shell-completion-scripts)

Shell completion scripts for Bash, Elvish, Fish, Nushell, PowerShell, and Zsh
are available in [release archives](https://github.com/casey/just/releases).

The `just` binary can also generate the same completion scripts at runtime
using `just --completions SHELL`:

```
$ just --completions bash > just
```

#### [Bash](https://just.systems/man/en/shell-completion-scripts.html#bash)

The recommended approach is to use the `bash-completions` package to lazy-load
the completion script:

```
mkdir -p ~/.local/share/bash-completion/completions
just --completions bash > ~/.local/share/bash-completion/completions/just
```

If `bash-completions` is not installed, you can source the completion script in
your `.bashrc`:

```
source <(just --completions bash)
```

If you use an alias like `alias j=just`, you should also save the completion
script with the name `j` when lazy-loading:

```
just --completions bash > ~/.local/share/bash-completion/completions/j
```

Or if not lazy-loading, add this line after sourcing the completion script in
your `.bashrc`:

```
complete -F _clap_complete_just -o bashdefault -o default j
```

#### [Elvish](https://just.systems/man/en/shell-completion-scripts.html#elvish)

In your `rc.elv`:

```
set edit:completion:arg-completer[just] = { |@args|
  eval (just --completions elvish | slurp)
  set @result = (edit:completion:arg-completer[just] $@args)
  put $@result
}
```

#### [Fish](https://just.systems/man/en/shell-completion-scripts.html#fish)

Save the completion script to the completions directory to lazy-load it:

```
mkdir -p ~/.config/fish/completions
just --completions fish > ~/.config/fish/completions/just.fish
```

#### [Nushell](https://just.systems/man/en/shell-completion-scripts.html#nushell)

First save the completion script:

```
just --completions nushell | save -f ($nu.default-config-dir | path join just.nu)
```

Then in `config.nu`:

```
source just.nu
```

#### [PowerShell](https://just.systems/man/en/shell-completion-scripts.html#powershell)

In your PowerShell `$PROFILE`:

```
just --completions powershell | Out-String | Invoke-Expression
```

#### [Zsh](https://just.systems/man/en/shell-completion-scripts.html#zsh)

First save the completion script:

```
mkdir -p ~/.zsh/completions
just --completions zsh > ~/.zsh/completions/_just
```

Then in your `.zshrc`:

```
fpath=(~/.zsh/completions $fpath)
autoload -U compinit
compinit
```
