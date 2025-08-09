# brewでインストールしたfisherをnixpkgsでインストールしたfishで使う
if test -d /opt/homebrew/share/fish/vendor_functions.d
    set -p fish_function_path /opt/homebrew/share/fish/vendor_functions.d
end

if status is-interactive
  # remove welcome message
  set fish_greeting
  # Configurations for plugin: fish-autols
  set -gx autols_cmd ls -al

  # Configurations for git
  set -gx GIT_CONFIG_GLOBAL ~/.config/git/config

  # Environment variables for Ruby building with Nix packages
  set -gx PKG_CONFIG_PATH "$HOME/.nix-profile/lib/pkgconfig"
  set -gx CFLAGS "-I$HOME/.nix-profile/include"
  set -gx LDFLAGS "-L$HOME/.nix-profile/lib"

  # mise activate
  ~/.nix-profile/bin/mise activate fish | source

  # Abbreviation
  abbr -a c 'clear'
  abbr -a reload 'exec $SHELL -l'
  abbr -a ll 'ls -la'
  abbr -a g 'git'
  abbr -a pn 'pnpm'
  abbr -a j 'just'
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
