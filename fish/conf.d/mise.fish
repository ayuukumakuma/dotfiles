function mise --wraps mise
    functions -e mise
    ~/.nix-profile/bin/mise activate fish | source
    ~/.nix-profile/bin/mise hook-env -s fish | source
    command mise $argv
end
