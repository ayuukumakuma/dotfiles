if status is-interactive
    # remove welcome message
    set fish_greeting

    if command -q tmux; and not set -q TMUX
        exec tmux new-session -A -s main
    end
end
