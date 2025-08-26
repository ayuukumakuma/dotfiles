function fzf_git_branch
    # 現在のブランチを取得
    set current_branch (git branch --show-current 2>/dev/null)

    # gitリポジトリでない場合は終了
    if test -z "$current_branch"
        echo "Not in a git repository"
        return 1
    end

    # ブランチ一覧を取得してfzfで選択
    set branch (git branch -a | \
        grep -v HEAD | \
        sed "s/.* //" | \
        sed "s#remotes/[^/]*/##" | \
        sort -u | \
        fzf --height 40% \
            --border \
            --prompt="Switch to branch> " \
            --header="Current: $current_branch" \
            --preview="git log --oneline --graph --color=always {} | head -20")

    # ブランチが選択された場合のみswitchを実行
    if test -n "$branch"
        git switch $branch
        commandline -f repaint
    end
end