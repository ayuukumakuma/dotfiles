function ghq_cd_fzf --description 'Search ghq repositories with fzf and cd into selected repo'
    for cmd in ghq fzf
        if not type -q $cmd
            echo "ghq_cd_fzf: $cmd command is not installed." >&2
            return 127
        end
    end

    set -l ghq_root (ghq root 2>/dev/null)
    if test -z "$ghq_root"
        echo 'ghq_cd_fzf: failed to get ghq root.' >&2
        return 1
    end

    set -l preview_cmd "
set -l repo_path '$ghq_root'/'{}'

if not test -d \"\$repo_path\"
    echo \"Not found: \$repo_path\"
    exit 0
end

set -l readme
for file in README.md README.rst README.txt README README.MD readme.md readme.rst readme.txt
    if test -f \"\$repo_path/\$file\"
        set readme \"\$repo_path/\$file\"
        break
    end
end

if test -n \"\$readme\"
    if type -q bat
        bat --color=always --language=markdown --paging=never --line-range :80 \"\$readme\"
    else
        sed -n '1,80p' \"\$readme\"
    end
else
    echo \"path: \$repo_path\"
    if test -d \"\$repo_path/.git\"
        set -l branch (git -C \"\$repo_path\" branch --show-current 2>/dev/null)
        if test -n \"\$branch\"
            echo \"branch: \$branch\"
        end

        set -l last_commit (git -C \"\$repo_path\" log -1 --pretty=format:'%h %s (%cr)' 2>/dev/null)
        if test -n \"\$last_commit\"
            echo \"last: \$last_commit\"
        end
    end
end
"

    set -l selected_repo (
        ghq list | fzf \
            --ansi \
            --height 80% \
            --layout=reverse \
            --prompt='ghq> ' \
            --preview-window='right:60%:wrap' \
            --preview "$preview_cmd"
    )
    if test -z "$selected_repo"
        return
    end

    cd -- "$ghq_root/$selected_repo"
end
