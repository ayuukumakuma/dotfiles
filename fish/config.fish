# brewでインストールしたfisherをnixpkgsでインストールしたfishで使うための設定
if test -d /opt/homebrew/share/fish/vendor_functions.d
    set -p fish_function_path /opt/homebrew/share/fish/vendor_functions.d
end

if status is-interactive
  # Configurations for plugin: fish-autols
  set -U autols_cmd ls -al

  # Configurations for git
  set -Ux GIT_CONFIG_GLOBAL ~/.config/git/config

  # Abbreviation
  abbr -a c 'clear'
  abbr -a reload 'exec $SHELL -l'
  abbr -a ll 'ls -la'
  abbr -a g 'git'
  abbr -a pn 'pnpm'
end

# mise activate
~/.nix-profile/bin/mise activate fish | source
