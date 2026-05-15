function __ghq_tmux_session_name --argument-names repo_path --description 'Build a tmux session name for a ghq repository'
    set -l repo_key (basename "$repo_path")
    set -l session_name (string replace -ar '[^A-Za-z0-9_-]+' '-' -- "$repo_key" | string trim --chars '-')
    if test -z "$session_name"
        set session_name repo
    end

    echo "$session_name"
end
