# Nix home-manager packages
if test -d /etc/profiles/per-user/$USER/bin
    if not contains /etc/profiles/per-user/$USER/bin $PATH
        set -gx PATH /etc/profiles/per-user/$USER/bin $PATH
    end
end

# `homebrew.goPackages` installs Go CLI binaries into `~/go/bin`.
if test -d ~/go/bin
    if not contains ~/go/bin $PATH
        set -gx PATH ~/go/bin $PATH
    end
end

if not contains ~/.local/bin $PATH
    set -gx PATH ~/.local/bin $PATH
end

# brewでインストールしたfisherをnixpkgsでインストールしたfishで使う
if test -d /opt/homebrew/share/fish/vendor_functions.d
    set -p fish_function_path /opt/homebrew/share/fish/vendor_functions.d
end
