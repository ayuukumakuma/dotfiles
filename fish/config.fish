# Nix home-manager packages
if test -d /etc/profiles/per-user/$USER/bin
  if not contains /etc/profiles/per-user/$USER/bin $PATH
    set -gx PATH /etc/profiles/per-user/$USER/bin $PATH
  end
end

# brewでインストールしたfisherをnixpkgsでインストールしたfishで使う
if test -d /opt/homebrew/share/fish/vendor_functions.d
    set -p fish_function_path /opt/homebrew/share/fish/vendor_functions.d
end

if status is-interactive
  # remove welcome message
  set fish_greeting
  # Configurations for plugin: fish-autols
  set -gx autols_cmd eza -alh

  # Configurations for plugin: fish-fzf
  set -gx FZF_DISABLE_KEYBINDINGS 1

  # Configurations for git
  set -gx GIT_CONFIG_GLOBAL ~/.config/git/config

  # Configurations for lazygit
  set -gx XDG_CONFIG_HOME  ~/.config

  # Set Editor
  set -gx EDITOR nvim

  # Load git gtr completions
  if test -f ~/.config/fish/completions/gtr.fish
    source ~/.config/fish/completions/gtr.fish
  end

  # Configurations for mise
  /etc/profiles/per-user/nasuno.ayumu/bin/mise activate fish | source

  # Abbreviation
  abbr -a c 'clear'
  abbr -a reload 'exec $SHELL -l'
  abbr -a ll 'eza -alh'
  abbr -a ls 'eza'
  abbr -a g 'git'
  abbr -a pn 'pnpm'
  abbr -a j 'just'
  abbr -a cc 'claude'
  abbr -a v 'nvim'
  abbr -a cdg 'cd-gitroot'
  abbr -a cat 'bat'
  abbr -a zl 'zellij'
  abbr -a wt 'git gtr'
  abbr -a co 'codex'
  abbr -a oct 'command or'
  abbr -a lg 'lazygit'
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
export PATH="$HOME/.local/bin:$PATH"
